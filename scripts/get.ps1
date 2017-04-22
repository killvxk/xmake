# xmake getter
# usage: (in powershell)
#  Invoke-Expression (Invoke-Webrequest <my location> -UseBasicParsing).Content

$outfile=($env:TMP,$env:TEMP,'.' -ne $null)[0]+"\$pid-xmake-installer.exe"
$ver='v2.1.3'
Invoke-Webrequest "https://github.com/tboox/xmake/releases/download/$ver/xmake-$ver.exe" -OutFile "$outfile"
Start-Process -FilePath "$outfile" -ArgumentList '/S /D=C:\xmake' -Wait
Remove-Item "$outfile"
$env:Path+=";C:\xmake"
[Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path",[System.EnvironmentVariableTarget]::User)+";C:\xmake",[System.EnvironmentVariableTarget]::User)
xmake --version
