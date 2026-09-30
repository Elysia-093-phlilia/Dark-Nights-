@echo off
chcp 65001 >nul
rem ============================================
rem  Dark Nights 1.1 汉化补丁 - 安装脚本
rem  将本文件夹中的汉化补丁安装到游戏目录
rem ============================================
setlocal

set "GAME=%~dp0..\DarkNights-1.1-pc"

if not exist "%GAME%\game" (
    echo [错误] 未找到游戏目录：%GAME%
    echo 请确认本文件夹位于 "Dark Nights" 目录下（与 DarkNights-1.1-pc 并列）。
    pause
    exit /b 1
)

echo 正在安装汉化补丁到：%GAME%
echo.

rem 复制中文语言包
xcopy "%~dp0tl_chinese" "%GAME%\game\tl\chinese\" /e /i /y /q
if errorlevel 1 goto :fail

rem 复制补丁脚本
copy /y "%~dp0zzz_chinese_patch.rpy" "%GAME%\game\" >nul
if errorlevel 1 goto :fail

echo.
echo [完成] 汉化补丁安装成功！
echo 首次启动游戏时 Ren'Py 会自动编译翻译文件，启动时间会略长，属正常现象。
echo 游戏将默认以中文显示；游戏中随时按 Shift+L 可切换中/英文。
pause
exit /b 0

:fail
echo [错误] 安装失败，请检查文件权限。
pause
exit /b 1
