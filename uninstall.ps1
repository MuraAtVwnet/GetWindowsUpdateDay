# モジュール名
$ModuleName = "GetWindowsUpdateDay"

# モジュール Path
$ModulePath = Join-Path (Split-Path $PROFILE -Parent) "Modules"

# モジュールを配置する Path
$RemovePath = Join-Path $ModulePath $ModuleName

# ディレクトリ削除
Remove-Item $RemovePath