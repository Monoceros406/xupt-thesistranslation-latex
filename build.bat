@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

echo ============================================================
echo  西安邮电大学毕业设计（论文）英文翻译 - Windows 构建
echo ============================================================

where xelatex >nul 2>nul
if errorlevel 1 (
  echo [错误] 未找到 xelatex，请先安装 TeX Live 或 MiKTeX 并加入 PATH。
  exit /b 1
)

echo [1/2] 第一次编译 ...
xelatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex >nul 2>&1
if errorlevel 1 goto :failed

echo [2/2] 第二次编译 ...
xelatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex >nul 2>&1
if errorlevel 1 goto :failed

echo 清理中间文件（保留 *.log 与 main.pdf）...
del /q *.aux *.toc *.lof *.lot *.out *.bbl *.blg *.fls *.fdb_latexmk *.synctex.gz *.tmp 2>nul
del /q "*.synctex(busy)" 2>nul

if not exist main.pdf (
  echo [错误] main.pdf 未生成，请查看 main.log。
  exit /b 1
)

echo [完成] 已生成 main.pdf。
exit /b 0

:failed
echo [错误] 编译失败！以下是 main.log 末尾内容：
if exist main.log powershell -NoProfile -Command "Get-Content main.log -Tail 40"
exit /b 1
