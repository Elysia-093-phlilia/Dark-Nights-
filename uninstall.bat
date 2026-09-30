@echo off
chcp 65001 >nul
rem ============================================
rem  Dark Nights 1.1 汉化补丁 - 卸载脚本
rem ============================================
setlocal

set "GAME=%~dp0..\DarkNights-1.1-pc"

if not exist "%GAME%\game" (
    echo [错误] 未找到游戏目录：%GAME%
    pause
    exit /b 1
)

echo 正在卸载汉化补丁...
rmdir /s /q "%GAME%\game\tl\chinese"
del /q "%GAME%\game\zzz_chinese_patch.rpy" 2>nul
del /q "%GAME%\game\zzz_chinese_patch.rpyc" 2>nul

echo [完成] 已恢复为英文原版。
pause
