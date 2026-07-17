[CmdletBinding()]
param(
    [Parameter()]
    [string]$ProjectPath,

    [Parameter()]
    [string]$ReportPath
)

$ErrorActionPreference = 'Stop'

$results = [System.Collections.Generic.List[object]]::new()

function Add-CheckResult {
    param(
        [string]$Item,
        [ValidateSet('OK', 'MISSING', 'MANUAL', 'INFO')]
        [string]$Status,
        [string]$Details,
        [bool]$Critical = $false
    )

    $results.Add([pscustomobject]@{
        Item     = $Item
        Status   = $Status
        Details  = $Details
        Critical = $Critical
    })
}

function Get-FirstExistingPath {
    param([string[]]$Candidates)

    foreach ($candidate in $Candidates) {
        if ($candidate -and (Test-Path -LiteralPath $candidate)) {
            return (Resolve-Path -LiteralPath $candidate).Path
        }
    }

    return $null
}

function Get-UnrealInstallations {
    $found = [System.Collections.Generic.List[string]]::new()

    $commonRoots = @(
        'C:\Program Files\Epic Games',
        'D:\Epic Games',
        'D:\Epic UE5',
        'C:\Program Files\Unreal Engine',
        'D:\Unreal Engine'
    )

    foreach ($root in $commonRoots) {
        if (-not (Test-Path -LiteralPath $root)) {
            continue
        }

        Get-ChildItem -LiteralPath $root -Directory -ErrorAction SilentlyContinue |
            Where-Object { $_.Name -like 'UE_*' } |
            ForEach-Object {
                $editor = Join-Path $_.FullName 'Engine\Binaries\Win64\UnrealEditor.exe'
                if (Test-Path -LiteralPath $editor) {
                    $found.Add($_.FullName)
                }
            }
    }

    $manifestRoot = 'C:\ProgramData\Epic\EpicGamesLauncher\Data\Manifests'
    if (Test-Path -LiteralPath $manifestRoot) {
        Get-ChildItem -LiteralPath $manifestRoot -Filter '*.item' -File -ErrorAction SilentlyContinue |
            ForEach-Object {
                try {
                    $manifest = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8 |
                        ConvertFrom-Json
                    $installPath = [string]$manifest.InstallLocation
                    $launchExecutable = [string]$manifest.LaunchExecutable
                    $isUnrealEditor = $manifest.DisplayName -like 'Unreal Engine*' -or
                        $launchExecutable -like '*UnrealEditor.exe'

                    if ($installPath -and $isUnrealEditor) {
                        $editor = Join-Path $installPath 'Engine\Binaries\Win64\UnrealEditor.exe'
                        if (Test-Path -LiteralPath $editor) {
                            $found.Add($installPath)
                        }
                    }
                }
                catch {
                    # Ignore malformed or unrelated launcher manifests.
                }
            }
    }

    $buildRegistry = 'HKCU:\SOFTWARE\Epic Games\Unreal Engine\Builds'
    if (Test-Path -LiteralPath $buildRegistry) {
        $properties = (Get-ItemProperty -LiteralPath $buildRegistry).PSObject.Properties |
            Where-Object { $_.Name -notlike 'PS*' }

        foreach ($property in $properties) {
            $installPath = [string]$property.Value
            $editor = Join-Path $installPath 'Engine\Binaries\Win64\UnrealEditor.exe'
            if (Test-Path -LiteralPath $editor) {
                $found.Add($installPath)
            }
        }
    }

    return @($found | Sort-Object -Unique)
}

$launcher = Get-FirstExistingPath @(
    'C:\Program Files\Epic Games\Launcher\Portal\Binaries\Win64\EpicGamesLauncher.exe',
    'C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win64\EpicGamesLauncher.exe'
)

if ($launcher) {
    Add-CheckResult 'Epic Games Launcher' 'OK' $launcher
}
else {
    Add-CheckResult 'Epic Games Launcher' 'MISSING' 'Not found in common installation paths' $true
}

$unrealInstallations = @(Get-UnrealInstallations)
if ($unrealInstallations.Count -gt 0) {
    Add-CheckResult 'Unreal Editor' 'OK' ($unrealInstallations -join '; ') $true
}
else {
    Add-CheckResult 'Unreal Editor' 'MISSING' 'No UE_* installation containing UnrealEditor.exe was found' $true
}

$vswhere = Get-FirstExistingPath @(
    'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe',
    'C:\Program Files\Microsoft Visual Studio\Installer\vswhere.exe'
)

$visualStudioPath = $null
if ($vswhere) {
    $visualStudioPath = (& $vswhere -latest -products '*' -property installationPath | Select-Object -First 1)
}

if ($visualStudioPath) {
    Add-CheckResult 'Visual Studio' 'OK' $visualStudioPath $true
}
else {
    Add-CheckResult 'Visual Studio' 'MISSING' 'vswhere did not return a usable instance' $true
}

$vsComponents = @(
    [pscustomobject]@{
        Name = 'Game development with C++'
        Ids = @('Microsoft.VisualStudio.Workload.NativeGame')
    }
    [pscustomobject]@{
        Name = 'MSVC x64/x86 build tools'
        Ids = @('Microsoft.VisualStudio.Component.VC.Tools.x86.x64')
    }
    [pscustomobject]@{
        Name = 'Windows 11 SDK 10.0.26100'
        Ids = @('Microsoft.VisualStudio.Component.Windows11SDK.26100')
    }
    [pscustomobject]@{
        Name = 'Visual Studio Tools for Unreal Engine'
        Ids = @(
            'Component.Unreal'
            'Microsoft.VisualStudio.Component.VC.Unreal'
        )
    }
    [pscustomobject]@{
        Name = 'Blueprint debugger tools'
        Ids = @(
            'Component.Unreal.Debugger'
            'Microsoft.VisualStudio.Component.VC.Unreal.Blueprint'
        )
    }
    [pscustomobject]@{
        Name = 'Unreal Engine Test Adapter'
        Ids = @(
            'Microsoft.VisualStudio.Component.Unreal.TestAdapter'
            'Microsoft.VisualStudio.Component.VC.Unreal.TestAdapter'
        )
    }
)

foreach ($component in $vsComponents) {
    $componentInstall = $null
    $matchedComponentId = $null
    if ($vswhere) {
        foreach ($componentId in $component.Ids) {
            $componentInstall = (& $vswhere -latest -products '*' -requires $componentId -property installationPath |
                Select-Object -First 1)
            if ($componentInstall) {
                $matchedComponentId = $componentId
                break
            }
        }
    }

    if ($componentInstall) {
        Add-CheckResult $component.Name 'OK' $matchedComponentId $true
    }
    else {
        Add-CheckResult $component.Name 'MISSING' ($component.Ids -join ' or ') $true
    }
}

$msvcVersions = @()
if ($visualStudioPath) {
    $msvcRoot = Join-Path $visualStudioPath 'VC\Tools\MSVC'
    if (Test-Path -LiteralPath $msvcRoot) {
        $msvcVersions = @(Get-ChildItem -LiteralPath $msvcRoot -Directory |
            Sort-Object Name -Descending |
            Select-Object -ExpandProperty Name)
    }
}

if ($msvcVersions.Count -gt 0) {
    Add-CheckResult 'MSVC versions' 'INFO' ($msvcVersions -join ', ')
}

$sdkIncludeRoot = 'C:\Program Files (x86)\Windows Kits\10\Include'
if (Test-Path -LiteralPath $sdkIncludeRoot) {
    $sdkVersions = @(Get-ChildItem -LiteralPath $sdkIncludeRoot -Directory |
        Sort-Object Name -Descending |
        Select-Object -ExpandProperty Name)

    if ($sdkVersions.Count -gt 0) {
        Add-CheckResult 'Windows SDK versions' 'INFO' ($sdkVersions -join ', ')
    }
}

[System.IO.DriveInfo]::GetDrives() |
    Where-Object { $_.IsReady -and $_.DriveType -eq 'Fixed' -and $_.Name.Substring(0, 1) -in @('C', 'D') } |
    ForEach-Object {
        $details = '{0:N1} GB free / {1:N1} GB total' -f ($_.AvailableFreeSpace / 1GB), ($_.TotalSize / 1GB)
        Add-CheckResult "Drive $($_.Name.Substring(0, 1))" 'INFO' $details
    }

if ($ProjectPath) {
    $resolvedProject = $null

    if (Test-Path -LiteralPath $ProjectPath -PathType Leaf) {
        $resolvedProject = (Resolve-Path -LiteralPath $ProjectPath).Path
    }
    elseif (Test-Path -LiteralPath $ProjectPath -PathType Container) {
        $resolvedProject = Get-ChildItem -LiteralPath $ProjectPath -Filter '*.uproject' -File |
            Select-Object -First 1 -ExpandProperty FullName
    }

    if ($resolvedProject -and $resolvedProject.EndsWith('.uproject', [System.StringComparison]::OrdinalIgnoreCase)) {
        Add-CheckResult 'UE C++ project file' 'OK' $resolvedProject $true

        $projectRoot = Split-Path -Parent $resolvedProject
        $sourcePath = Join-Path $projectRoot 'Source'
        $binariesPath = Join-Path $projectRoot 'Binaries\Win64'

        if (Test-Path -LiteralPath $sourcePath) {
            Add-CheckResult 'Project Source directory' 'OK' $sourcePath $true
        }
        else {
            Add-CheckResult 'Project Source directory' 'MISSING' 'The project may not be a C++ project' $true
        }

        $projectModules = @()
        if (Test-Path -LiteralPath $binariesPath) {
            $projectModules = @(Get-ChildItem -LiteralPath $binariesPath -Filter '*.dll' -File -ErrorAction SilentlyContinue)
        }

        if ($projectModules.Count -gt 0) {
            Add-CheckResult 'Project build artifacts' 'OK' ($projectModules.Name -join ', ') $true
        }
        else {
            Add-CheckResult 'Project build artifacts' 'MISSING' 'No project DLL was found in Binaries\Win64; compile the project once' $true
        }

        Add-CheckResult 'Project opened in editor' 'MANUAL' 'Save a screenshot showing the project open in Unreal Editor'
    }
    else {
        Add-CheckResult 'UE C++ project file' 'MISSING' "No valid .uproject was found: $ProjectPath" $true
    }
}
else {
    Add-CheckResult 'UE C++ project check' 'MANUAL' 'After installing UE, pass a project directory or .uproject with -ProjectPath'
}

$displayResults = $results | Select-Object Item, Status, Details
$table = $displayResults | Format-Table -AutoSize -Wrap | Out-String -Width 220
$table = (($table -split '\r?\n') | ForEach-Object { $_.TrimEnd() }) -join [Environment]::NewLine
$blocking = @($results | Where-Object { $_.Critical -and $_.Status -eq 'MISSING' })

$summary = if ($blocking.Count -eq 0) {
    'Environment components passed. A real UE C++ project still needs compile-and-open evidence.'
}
else {
    "$($blocking.Count) required item(s) are missing. Install them and run this check again."
}

$output = @(
    'UE DEVELOPMENT ENVIRONMENT CHECK'
    "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    ''
    $table.TrimEnd()
    ''
    "Summary: $summary"
) -join [Environment]::NewLine

Write-Output $output

if ($ReportPath) {
    $fullReportPath = [System.IO.Path]::GetFullPath($ReportPath)
    $reportDirectory = Split-Path -Parent $fullReportPath

    if ($reportDirectory -and -not (Test-Path -LiteralPath $reportDirectory)) {
        New-Item -ItemType Directory -Path $reportDirectory -Force | Out-Null
    }

    [System.IO.File]::WriteAllText(
        $fullReportPath,
        $output + [Environment]::NewLine,
        [System.Text.UTF8Encoding]::new($true)
    )

    Write-Output "Report saved: $fullReportPath"
}

if ($blocking.Count -gt 0) {
    exit 2
}

exit 0
