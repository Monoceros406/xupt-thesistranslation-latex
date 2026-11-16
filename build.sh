#!/usr/bin/env bash
# 西安邮电大学本科毕业设计（论文）英文翻译 —— Linux / macOS 构建脚本
set -euo pipefail

cd "$(dirname "$0")"

echo "============================================================"
echo " 西安邮电大学毕业设计（论文）英文翻译 - 构建脚本"
echo "============================================================"

if ! command -v xelatex >/dev/null 2>&1; then
  echo "[错误] 未找到 xelatex，请先安装 TeX Live 或 MiKTeX。" >&2
  exit 1
fi

fail() {
  echo "[错误] 编译失败！以下是 main.log 末尾内容：" >&2
  [ -f main.log ] && tail -n 40 main.log >&2
  exit 1
}

echo "[1/2] 第一次编译 ..."
xelatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex >/dev/null 2>&1 || fail

echo "[2/2] 第二次编译 ..."
xelatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex >/dev/null 2>&1 || fail

echo "清理中间文件（保留 *.log 与 main.pdf）..."
rm -f ./*.aux ./*.toc ./*.lof ./*.lot ./*.out ./*.bbl ./*.blg ./*.fls \
      ./*.fdb_latexmk ./*.synctex.gz ./*.tmp
find . -maxdepth 1 -type f -name '*.synctex(busy)' -delete

[ -f main.pdf ] || { echo "[错误] main.pdf 未生成，请查看 main.log。" >&2; exit 1; }
echo "[完成] 已生成 main.pdf。"
