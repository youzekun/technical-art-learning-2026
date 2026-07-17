# 本地检查工具

## 新建每日记录

[`新建每日记录.ps1`](./新建每日记录.ps1)会创建当天日报和独立证据目录。已有日报绝不会被覆盖。

例如创建7月19日记录：

```powershell
powershell -ExecutionPolicy Bypass -File ".\工具\新建每日记录.ps1" `
  -Date "2026-07-19"
```

生成位置：

```text
记录/每日汇报/2026-07-19.md
记录/evidence/2026-07-19/README.md
```

如果日期格式错误，脚本返回退出码`2`；如果日报已经存在，返回退出码`3`并保持原文件不变。

## UE开发环境检查

[`检查UE开发环境.ps1`](./检查UE开发环境.ps1)只读取安装目录、Visual Studio组件、SDK、磁盘和指定项目，不会安装、删除或修改软件。

在本仓库目录打开PowerShell后运行：

```powershell
powershell -ExecutionPolicy Bypass -File ".\工具\检查UE开发环境.ps1"
```

安装UE并创建项目后，用项目路径再次检查：

```powershell
powershell -ExecutionPolicy Bypass -File ".\工具\检查UE开发环境.ps1" `
  -ProjectPath "D:\你的UE项目\项目名.uproject"
```

需要保存文字证据时：

```powershell
powershell -ExecutionPolicy Bypass -File ".\工具\检查UE开发环境.ps1" `
  -ProjectPath "D:\你的UE项目\项目名.uproject" `
  -ReportPath ".\记录\每日汇报\2026-07-18_环境检查.txt"
```

## 状态含义

- `OK`：该项已经在本机找到。
- `MISSING`：必需项缺失，需要安装、创建或编译。
- `MANUAL`：脚本无法代替人工验证，例如确认UE项目已经实际打开。
- `INFO`：版本或磁盘信息，不单独决定通过与否。

脚本退出码为`2`表示仍有必需缺失项；这是检查结果，不代表脚本运行失败。

## 环境验收边界

脚本只能证明：

- UE Editor是否存在。
- Visual Studio与所需组件是否存在。
- 项目文件、Source目录和编译产物是否存在。

最终仍必须保存：

- UE C++项目成功编译的结果。
- Unreal Editor实际打开该项目的截图。
- UE、Visual Studio、MSVC和Windows SDK版本。

只有这些证据齐全，阶段一的“UE环境”硬门槛才能标记为已验证。
