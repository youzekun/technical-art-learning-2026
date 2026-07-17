[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Date,

    [Parameter()]
    [string]$ReportDirectory,

    [Parameter()]
    [string]$EvidenceRoot
)

$ErrorActionPreference = 'Stop'

$parsedDate = [datetime]::MinValue
$validDate = [datetime]::TryParseExact(
    $Date,
    'yyyy-MM-dd',
    [System.Globalization.CultureInfo]::InvariantCulture,
    [System.Globalization.DateTimeStyles]::None,
    [ref]$parsedDate
)

if (-not $validDate) {
    [Console]::Error.WriteLine('Date must use the yyyy-MM-dd format.')
    exit 2
}

$normalizedDate = $parsedDate.ToString('yyyy-MM-dd')
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$repositoryRoot = Split-Path -Parent $scriptDirectory

if (-not $ReportDirectory) {
    $anchorReport = Get-ChildItem -LiteralPath $repositoryRoot -Recurse -File -Filter '2026-07-18.md' |
        Where-Object { Test-Path -LiteralPath (Join-Path $_.DirectoryName 'README.md') } |
        Select-Object -First 1

    if (-not $anchorReport) {
        [Console]::Error.WriteLine('Could not locate the daily report directory. Pass -ReportDirectory explicitly.')
        exit 2
    }

    $ReportDirectory = $anchorReport.DirectoryName
}

$ReportDirectory = [System.IO.Path]::GetFullPath($ReportDirectory)

if (-not $EvidenceRoot) {
    $recordsRoot = Split-Path -Parent $ReportDirectory
    $EvidenceRoot = Join-Path $recordsRoot 'evidence'
}

$EvidenceRoot = [System.IO.Path]::GetFullPath($EvidenceRoot)
$reportPath = Join-Path $ReportDirectory "$normalizedDate.md"
$evidenceDirectory = Join-Path $EvidenceRoot $normalizedDate

if (Test-Path -LiteralPath $reportPath) {
    [Console]::Error.WriteLine("Report already exists and was not changed: $reportPath")
    exit 3
}

if (-not (Test-Path -LiteralPath $ReportDirectory)) {
    New-Item -ItemType Directory -Path $ReportDirectory -Force | Out-Null
}

if (-not (Test-Path -LiteralPath $evidenceDirectory)) {
    New-Item -ItemType Directory -Path $evidenceDirectory -Force | Out-Null
}

$report = @"
# Daily study report: $normalizedDate

- Planned study time:
- Actual study time:
- Current stage:
- Status: waiting for evidence

## Completed courses or topics

-

## Independent output

- Code:
- UE project, material, or tool:
- Screenshots or video:
- Notes:

## Can I reproduce it without the tutorial?

- Yes:
- Partly:
- No:

## Explanation in my own words

-

## Problems and errors

-

## Planned but incomplete

-

## Evidence

- Evidence directory: `$evidenceDirectory`
- Source files:
- Build or run output:
- Screenshots:
- Video:

## Review result

- Daily result: waiting for review
- Verified:
- Needs review:
- Current stage verified gates:
- Next study-day task:
"@

$evidenceReadme = @"
# Evidence: $normalizedDate

Keep the original files here whenever practical.

Suggested evidence:

- Source code, scripts, or text reports.
- Build and run output.
- UE editor and material screenshots.
- Short screen recordings.
- Performance traces or data tables when required.

A screenshot does not replace source code or a working project.
"@

$utf8WithBom = [System.Text.UTF8Encoding]::new($true)
[System.IO.File]::WriteAllText($reportPath, $report + [Environment]::NewLine, $utf8WithBom)
[System.IO.File]::WriteAllText(
    (Join-Path $evidenceDirectory 'README.md'),
    $evidenceReadme + [Environment]::NewLine,
    $utf8WithBom
)

Write-Output "Report created: $reportPath"
Write-Output "Evidence directory created: $evidenceDirectory"
exit 0
