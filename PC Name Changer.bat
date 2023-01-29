@echo off
chcp 65001>nul
color a
title PC NAME CHANGER
net session >nul 2>&1
if not %errorLevel% == 0 (
echo 관리자 권한으로 다시 실행시키기 바랍니다.
pause>nul
exit
)
set /p ren=변경할 컴퓨터 이름을 입력해 주세요: 
wmic computersystem where caption="%computername%" call rename name=%ren%>nul

:loop
echo 작업이 완료되었습니다.
set /p YN=재부팅하시겠습니까? (Y/N): 
if /i "%YN%" == "Y" goto YES
if /i "%YN%" == "N" goto NO
goto loop

:YES
shutdown -r -t 0

:NO
exit