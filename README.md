# 西安邮电大学本科毕业设计（论文）英文翻译 LaTeX 模板

本目录是一个**独立工程**，对应《附件1：西安邮电大学本科毕业设计（论文）英文翻译模板.docx》**第 2 页起**的格式要求。

> 本科毕业设计（论文）除了正文，还需另交一份外文论文翻译。本模板只负责这份英文翻译，与毕业论文正文模板相互独立。

---

## 1. 格式要求（已由 `xupttranslation.cls` 自动实现）

| 项目     | 模板要求                                                            |
| ------ | --------------------------------------------------------------- |
| 纸张与页边距 | A4；左 2.5cm，右 2cm，上 2cm，下 2cm                                    |
| 一级标题   | “一、英文原文”“二、中文译文”：黑体 18pt 居中，段前约 23pt、段后约 8pt，行距固定 20pt          |
| 英文原文   | 小四号（12pt）Times New Roman，黑色，首行缩进 2 字符，固定行距 20pt                 |
| 中文译文   | 小四号（12pt）宋体，黑色，首行缩进 2 字符，固定行距 20pt                              |
| 文献标题   | 英文标题 / 中文标题均为 14pt 居中，固定行距 20pt（英文用 Times New Roman，中文用黑体）      |
| 著录信息   | “起止页码 / 出版日期（期刊号）/ 刊物名称（出版单位）”：小四号，中文宋体、数字字母 Times New Roman，黑色 |
| 页眉页脚   | 模板无页眉、无页脚、无页码（已统一设为空）                                           |
| 字数要求   | 中文译文不得少于 **2000 字**；英文来源须为与论文研究领域相关的期刊、书籍或网文摘录                  |
| 结尾     | 指导教师签字与日期，置于文末                                                  |

正文段落统一为小四 12pt / 固定行距 20pt / 首行缩进 2 字，由类文件控制，**不要在正文里手写字号或行距**。

---

## 2. 环境准备

- **TeX 发行版**：TeX Live 2025（本机已验证）或 MiKTeX。
- **编译器**：必须使用 **XeLaTeX**。
- **字体**：工程自带 `fonts/`（`simsun.ttc` 宋体、`simhei.ttf` 黑体、`times.ttf` / `timesbd.ttf` Times New Roman、`arial.ttf`），无需在本地安装。若 `fonts/` 被删除，Windows 回退到系统字体，其他平台回退到 `fandol`。
- 本模板不需要 Mermaid、代码高亮或伪代码功能，因此不需要 Node.js 或 `-shell-escape`。

---

## 3. 目录结构

```
translation/
├── main.tex                      主文档：只做装配
├── xupttranslation.cls           专用类文件：页面、字体、标题与正文格式
├── fonts/                        自带中英文字体
├── frontmatter/
│   └── source-info.tex           文献来源说明与著录信息
├── chapters/
│   ├── chapter1/english.tex      一、英文原文
│   └── chapter2/chinese.tex      二、中文译文
├── conclusion/signature.tex      指导教师签字与日期
├── references/                   预留目录（与主工程结构保持一致）
├── acknowledgements/             预留目录
├── appendix/                     预留目录
├── images/                       图片目录
├── build.bat                     Windows 构建脚本
├── build.sh                      Linux / macOS 构建脚本
├── .gitignore                    Git 忽略规则
└── README.md                     本说明
```

现有 `.tex` 内容均为**格式示例**（摘自附件 1 的示例文本），写自己的翻译时请全部替换。

---

## 4. 编译方法

### Windows

双击 `build.bat`，或终端执行：

```bat
build.bat
```

### Linux / macOS

```bash
chmod +x build.sh
./build.sh
```

脚本会连续执行 **两次 `xelatex main.tex`**，然后删除中间文件（`*.log` 与 `main.pdf` 保留）；失败时打印日志末尾 40 行。手动编译也需要运行两遍。本机 Windows + TeX Live 2025 下已实测通过，生成 1 页 A4 PDF，无页眉页脚页码。

---

## 5. 如何写自己的翻译

### 文献来源与著录信息

编辑 `frontmatter/source-info.tex`：

```latex
\xuptnote{英文来源：……，中文译文字数不得少于2000字。}

\xuptmeta{起止页码：\underline{\hspace{6em}}}
\xuptmeta{出版日期（期刊号）：\underline{\hspace{6em}}}
\xuptmeta{刊物名称（出版单位）：\underline{\hspace{10em}}}
```

`\xuptnote` 是顶格的小四号说明文字，定稿时可删除；`\xuptmeta` 是小四号、首行缩进 2 字的著录行。

### 英文原文

编辑 `chapters/chapter1/english.tex`：

```latex
\xuptpart{一、英文原文}
\englishTitle{英文文章标题}

这里粘贴英文原文，首行自动缩进 2 字符，字体为小四号 Times New Roman，
行距固定 20pt。
```

### 中文译文

编辑 `chapters/chapter2/chinese.tex`：

```latex
\xuptpart{二、中文译文}
\chineseTitle{中文译文标题}

这里写中文译文，首行自动缩进 2 字符，字体为小四号宋体，行距固定 20pt。
```

中文译文不少于 2000 字；译文应与英文原文分段对应。

### 结尾签字

`conclusion/signature.tex` 已用 `\xuptsignature` 排好“指导教师（签字）”与日期，直接替换日期即可。

---

## 6. 常见问题

- **中文显示为方框**：确认 `fonts/` 随工程一起存在；不要只上传 `.tex` 文件。
- **出现 `Overfull \hbox`**：多为长英文单词导致，轻微溢出可忽略；必要时在正文手动断行。
- **想改字号 / 行距 / 页边距**：统一修改 `xupttranslation.cls` 中的 `geometry`、`\normalsize` 与 `\xuptpart` 等命令。
- **查阅日志**：编译失败时看 `main.log` 末尾，或按脚本提示的 40 行输出定位。
