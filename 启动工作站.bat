@echo off
chcp 65001 >nul
title Turing Agent Team
cd /d "%~dp0"

netstat -ano | findstr ":3411" | findstr "LISTENING" >nul 2>nul
if not errorlevel 1 (
  echo 服务已在运行，正在打开浏览器...
  start "" http://127.0.0.1:3411
  exit /b
)

where node >nul 2>nul
if errorlevel 1 (
  echo 未检测到 Node.js。请先安装：https://nodejs.org 后重新运行本文件。
  pause
  exit /b
)

echo 正在启动 Turing Agent Team，浏览器将自动打开...
echo （本窗口关闭即停止服务）
start "" powershell -NoProfile -WindowStyle Hidden -Command "Start-Sleep -Seconds 2; Start-Process 'http://127.0.0.1:3411'"
node server.mjs
echo.
echo 服务已停止。如上方出现错误信息，请截图反馈。
pause