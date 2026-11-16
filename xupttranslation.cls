\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xupttranslation}[2026/11/16 XUPT undergraduate thesis English translation]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[UTF8,scheme=chinese,punct=kaiming,zihao=-4,openany,oneside]{ctexbook}

\RequirePackage[a4paper,left=2.5cm,right=2cm,top=2cm,bottom=2cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}

% ------------------------------------------------------------------
% 字体：优先工程自带 fonts/，其次系统字体，最后保留 ctex 默认字体集
% ------------------------------------------------------------------
\newif\ifxupt@bundledfonts
\IfFileExists{fonts/simsun.ttc}{\xupt@bundledfontstrue}{\xupt@bundledfontsfalse}
\ifxupt@bundledfonts
  \setCJKfamilyfont{zhsong}{simsun.ttc}[Path=fonts/,FontIndex=0,BoldFont=simhei.ttf]
  \setCJKfamilyfont{zhhei}{simhei.ttf}[Path=fonts/]
  \setCJKmainfont{simsun.ttc}[Path=fonts/,FontIndex=0,BoldFont=simhei.ttf]
  \setCJKsansfont{simhei.ttf}[Path=fonts/]
  \setCJKmonofont{simsun.ttc}[Path=fonts/,FontIndex=0]
\else
  \IfFontExistsTF{SimSun}{%
    \setCJKfamilyfont{zhsong}{SimSun}[BoldFont=SimHei]
    \setCJKfamilyfont{zhhei}{SimHei}
    \setCJKmainfont{SimSun}[BoldFont=SimHei]
    \setCJKsansfont{SimHei}
  }{}%
\fi
\providecommand*{\songti}{}\providecommand*{\heiti}{}
\renewcommand*{\songti}{\CJKfamily{zhsong}}
\renewcommand*{\heiti}{\CJKfamily{zhhei}}
\IfFileExists{fonts/times.ttf}%
  {\setmainfont{times.ttf}[Path=fonts/,BoldFont=timesbd.ttf]}%
  {\IfFontExistsTF{Times New Roman}{\setmainfont{Times New Roman}}{}}
\IfFileExists{fonts/arial.ttf}%
  {\setsansfont{arial.ttf}[Path=fonts/]}%
  {\IfFontExistsTF{Arial}{\setsansfont{Arial}}{}}
\xeCJKsetup{CJKecglue={\hskip 0pt plus 0.1em}}

% ------------------------------------------------------------------
% 正文：小四号 12pt、固定行距 20pt、首行缩进 2 字、段前后 0pt
% ------------------------------------------------------------------
\linespread{1}
\renewcommand{\normalsize}{\fontsize{12pt}{20pt}\selectfont}
\AtBeginDocument{%
  \normalsize
  \setlength{\parindent}{2em}%
  \setlength{\parskip}{0pt}%
  \pagestyle{empty}%
}

% ------------------------------------------------------------------
% 英文翻译专用命令
% ------------------------------------------------------------------
% 一级标题：“一、英文原文”“二、中文译文”，黑体 18pt 居中，段前约 23pt、段后约 8pt
\newcommand{\xuptpart}[1]{%
  \par\vspace*{23pt}%
  {\centering\parindent=0pt\heiti\fontsize{18pt}{20pt}\selectfont #1\par}%
  \vspace{8pt}%
}
% 文献信息行：小四号，首行缩进 2 字，段前后约 8pt
\newcommand{\xuptmeta}[1]{%
  \par\vspace{8pt}%
  #1\par
  \vspace{8pt}%
}
% 说明性文字：小四号，顶格
\newcommand{\xuptnote}[1]{%
  \noindent{\songti\fontsize{12pt}{20pt}\selectfont #1}\par
}
% 英文/中文标题：14pt 居中，固定行距 20pt
\newcommand{\englishTitle}[1]{%
  {\centering\parindent=0pt\fontsize{14pt}{20pt}\selectfont #1\par}%
}
\newcommand{\chineseTitle}[1]{%
  {\centering\parindent=0pt\heiti\fontsize{14pt}{20pt}\selectfont #1\par}%
}
% 结尾签字与日期
\newcommand{\xuptsignature}{%
  \vfill
  \noindent{\heiti\fontsize{14pt}{20pt}\selectfont 指导教师（签字）：}\par
  \vspace{10pt}
  \hfill{\fontsize{12pt}{20pt}\selectfont 年\quad 月\quad 日}\par
}

\hypersetup{colorlinks=false,hidelinks,pdfusetitle}

\endinput
