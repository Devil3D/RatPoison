@echo off
rem 16 stings pwd

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789

set pwd=
FOR /L %%b IN (0, 1, 16) DO (
SET /A rnd_num=!RANDOM! * 62 / 32768 + 1
for /F %%c in ('echo %%alfanum:~!rnd_num!^,1%%') do set pwd=!pwd!%%c
)
cd build
cd RatPoison 1.6
ren "RatPoison 1.6.jar" "%pwd%.jar"
powershell -Command "(Get-Content -path 'Start RatPoison 1.6.bat') -replace 'RatPoison 1.6', '%pwd%' | Set-Content -Path 'Start RatPoison 1.6.bat'"
ren "Start RatPoison 1.6.bat" "%pwd%.bat"
exit