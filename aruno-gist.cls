% Aruno Gist Class
%
% (c) Gambhiro Bhikkhu, 2013
% gambhiro@ratanagiri.org.uk
%
% LPPL LaTeX Pubic Project Licence
%

% ==============
% Identification
% ==============

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aruno-gist}[2013/03/21 v0.1 A document class for small booklets or quote collections.]

% ========================
% Preliminary Declarations
% ========================

% =======
% Options
% =======

% ======================
% All Other Declarations
% ======================

\LoadClass[11pt,twoside,final]{memoir}

\usepackage{nag}
\usepackage{calc}
\usepackage{xparse}
\usepackage{soul}
\usepackage{textcomp}
%\usepackage{booktabs}
\usepackage{longtable}
\usepackage[cmyk]{xcolor}

\usepackage[pdftex]{graphicx}
\graphicspath{{./src-images/}}
\usepackage{eso-pic}
\usepackage{ccicons}
\usepackage{enumitem}

\usepackage{tikz}

%% === Define colors ===================================================

\definecolor{textbody}{gray}{0.05}
\definecolor{drop}{gray}{0.7}
\definecolor{capsline}{gray}{0.3}
\definecolor{chapnum}{gray}{0.8}
\definecolor{chaptitle}{gray}{0.3}
% \definecolor{chapsubtitle}{gray}{0.6}
\definecolor{footnoterule}{gray}{0.5}

%% ============================
%% Load fonts (before multicol)
%% ============================

\usepackage{fontspec}
\defaultfontfeatures{Ligatures={TeX},Renderer={Basic}}

\setmainfont[ItalicFont = Shaker 2 Light Italic,]{Shaker 2 Light}

\newfontfamily\shaker{Shaker Pali}
\newfontfamily\chapTitleFont[ItalicFont = Shaker 2 Light Italic]{Shaker 2 Light}
\newfontfamily\chapNameFont[ItalicFont = Shaker 2 Light Italic]{Shaker 2 Light}
\newfontfamily\chapNumFont{Shaker Pali}

\newfontfamily\sectionFont{Shaker Pali}

\newfontfamily\headFont{Shaker Pali}
\newfontfamily\footFont[ItalicFont = Shaker 2 Light Italic]{Shaker 2 Light}

\newfontfamily\tocPageNumFont{Shaker Pali}

%% ===========================================
%% Set font sizes, indentation, etc.
%% ===========================================

\renewcommand{\normalsize}{%
   \@setfontsize\normalsize\@xipt{13.6}%
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \color{textbody}
   \let\@listi\@listI}
\normalsize

\setlength{\parindent}{17pt}
\setlength{\parskip}{0pt}

% \setlength{\vgap}{1.5em}
% \setlength{\vindent}{\vgap}
% \setlength{\vleftmargin}{2em}

\newcommand{\smaller}{\@setfontsize\smaller{9}{11}}
\newcommand{\copyrightsize}{\@setfontsize\copyrightsize{8}{10}}

\newcommand{\dhpversesize}{\@setfontsize\dhpversesize{12}{15.5}}
\newcommand{\chapnamesize}{\@setfontsize\chapnamesize{22}{24}}
\newcommand{\chaptitlesize}{\@setfontsize\chaptitlesize{13}{20}}

\newcommand{\footsize}{\@setfontsize\footsize{10}{14.5}}

\newcommand{\sectiontitlesize}{\@setfontsize\sectiontitlesize{11.5}{18}}

%% ==============================
%% Packages that come AFTER fonts
%% ==============================

\usepackage{multicol}

\usepackage{lettrine}

\setcounter{DefaultLines}{3}
\renewcommand{\DefaultLoversize}{0.15}
\renewcommand{\DefaultLraise}{0}
\renewcommand{\DefaultLhang}{0.4}
\renewcommand{\LettrineFontHook}{\dropFont\color{drop}}
\renewcommand{\LettrineTextFont}{\scshape\color{capsline}}

%% ============================
%% Set page geometry and layout
%% ============================

\usepackage{geometry}
\geometry{
paperwidth=135mm,
paperheight=120mm,
lines=17,
top=15mm,
bottom=15mm,
textwidth=100mm,
outer=15mm
}
\setlength{\stockwidth}{135mm}
\setlength{\stockheight}{120mm}

%% ========
%% Hyperref
%% ========

\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  unicode=true,
  linkcolor=textbody,
  citecolor=textbody,
  filecolor=textbody,
  urlcolor=textbody
}
\RequirePackage[
  open,
  openlevel=2
]{bookmark}

% memoir's more allowing penalties
\midsloppy

%% Make hyphenation less frequent
%% WARNING: there will be more underfull lines, and some very streched
%% lines. Check the log file for underfull warnings.

\lefthyphenmin=3
\righthyphenmin=3

\hyphenpenalty=600
\exhyphenpenalty=50
\doublehyphendemerits=900
\brokenpenalty=990

%% =========
%% Penalties
%% =========

\usepackage{nowidow}

% \parfillskip 0pt plus 0.8\textwidth

% \clubpenalty=9996
% \tolerance=1414
% \widowpenalty=8500
% \brokenpenalty=6000

% \tolerance 1414
% \hbadness 1414
% \emergencystretch 1.5em
% \hfuzz 0.3pt
% \vfuzz \hfuzz
% \widowpenalty=10000
% \finalhyphendemerits=4000

%% =============
%% soul settings
%% =============

\sodef\soTocChapter{}{.1em}{.5em plus.1em}{.1em plus.1em minus.1em}
\sodef\soSection{}{.07em}{.4em plus.1em}{.1em plus.1em minus.1em}
\sodef\soChapter{}{.1em}{.5em plus.1em}{.1em plus.1em minus.1em}
\sodef\soDropcapsA{}{.1em}{.3em plus.1em}{.4em plus.1em minus.1em}
\sodef\soDropcapsB{}{.1em}{.3em plus.1em}{.4em plus.1em minus.1em}

%% =====================================
%% New, custom commands and environments
%% =====================================

\newcommand{\versealign}{\centering}

\newcommand*{\subtitle}[1]{\def\@thesubtitle{#1}}
\newcommand*{\editionInfo}[1]{\def\@theEditionInfo{#1}}
\newcommand*{\ISBN}[1]{\def\@theISBN{#1}}

\newcommand\thesubtitle{\@thesubtitle}
\newcommand\theEditionInfo{\@theEditionInfo}
\newcommand\theISBN{\@theISBN}

\newsavebox{\quotepagebox}
\newlength{\quoteXshift}\setlength{\quoteXshift}{0mm}
%% Arguments:
%% [#1] -- xshift from page center, default 0mm
%% #2 -- width of quote
\newenvironment{quotepage}[2][0mm]
  {\setlength{\quoteXshift}{#1}
   \begin{lrbox}{\quotepagebox}\begin{minipage}{#2}
   \setlength{\parskip}{0.6\baselineskip}
   \setlength{\parindent}{0pt}}
  {\end{minipage}\end{lrbox}%
   \begin{tikzpicture}[remember picture,overlay]
   \node[xshift={\quoteXshift}] at (current page.center) {\usebox{\quotepagebox}};
   \end{tikzpicture}}

%% Arguments:
%% #1 -- verse numbers (i.e. 88-89, etc)

\newenvironment{dhpVerse}[1]
{\def\verseref{\textit{v. #1}}
\cleartoverso
\begin{minipage}[c][\textheight][c]{\textwidth}
\setlength{\parskip}{0.6\baselineskip}
\setlength{\parindent}{0pt}
\dhpversesize\versealign}
{\par\verseref
\end{minipage}}

% \newenvironment{dhpVerse}[1]
% {\def\verseref{\textit{v. #1}}
% \cleartoverso
% \begin{quotepage}[-2mm]{80mm}%
% \dhpversesize\versealign}
% {\par\verseref
% \end{quotepage}}

\newenvironment{dhpRefl}
{\cleartorecto
\begin{minipage}[c][\textheight][c]{\textwidth}
\setlength{\parskip}{0.6\baselineskip}
\setlength{\parindent}{0pt}}
{\end{minipage}}

% \newenvironment{dhpRefl}
% {\cleartorecto
% \begin{quotepage}[2mm]{105mm}}
% {\end{quotepage}}

\newenvironment{packeditemize}%
{\begin{itemize}[
  itemindent=0pt,
  leftmargin=20pt,
  rightmargin=0pt,
  itemsep=0pt,
  topsep=0pt,
  parsep=0pt,
  partopsep=3pt,
]%
}{\end{itemize}}

\newcommand\emptysheet{%
  \cleardoublepage
  \thispagestyle{empty}\mbox{}\newpage
  \thispagestyle{empty}\mbox{}\newpage
}

\def\gobble@spaces{\@ifnextchar\space{\@gobble\gobble@spaces}{}}
\newcommand{\verseref}[1]{\mbox{}\marginpar{\par\vspace*{-7pt}\oldNumFont #1.}\gobble@spaces}
\newcommand{\pali}[1]{\textit{#1}}
\newcommand{\suttaref}[1]{\hspace*{\fill}\footnotesize\begingroup #1 \endgroup\par}
\newcommand{\attrib}[1]{\nopagebreak{\raggedleft\footnotesize #1\par}}

\def\@vaggaName{}
\newcommand*{\setVaggaName}[1]{\def\@vaggaName{#1}}

\newcommand*{\chapterVagga}[2]{%
  \setVaggaName{\MakeLowercase{#2}}%
  \chapter{#1}%
  \markboth{#1}{#2}%
}

%% =======================
%% Renewing package macros
%% =======================

\renewcommand*{\notedivision}{\section*{\notesname}}
\renewcommand*{\pagenotesubhead}[3]{}
\renewcommand*{\notenumintext}[1]{\textsuperscript{\thinspace [#1]}}
\renewcommand{\prenoteinnotes}{\par\noindent}
\renewcommand{\postnoteinnotes}{\par\vspace*{0.5\baselineskip}}

\renewcommand\footnoterule{%
  \vspace*{\baselineskip}%
  \kern-3\p@
  {\color{footnoterule}\hrule height 0.1pt width \columnwidth}
  \kern2.6\p@}

%% ===========
%% Page styles
%% ===========

\makepagestyle{normalpage}
  \makepsmarks{normalpage}{%
    \def\chaptermark##1{\markboth{\memUChead{##1}}{}}%
    \def\tocmark{\markboth{\memUChead{\contentsname}}{\memUChead{\contentsname}}}%
    \def\lofmark{\markboth{\memUChead{\listfigurename}}{\memUChead{\listfigurename}}}%
    \def\lotmark{\markboth{\memUChead{\listtablename}}{\memUChead{\listtablename}}}%
    \def\bibmark{\markboth{\memUChead{\bibname}}{\memUChead{\bibname}}}%
    \def\indexmark{\markboth{\memUChead{\indexname}}{\memUChead{\indexname}}}%
    \def\sectionmark##1{\markright{\memUChead{##1}}}}
  \makepsmarks{normalpage}{%
    \nouppercaseheads
    \createmark{chapter}{left}{nonumber}{}{}
    \createmark{section}{right}{nonumber}{}{}
    \createplainmark{toc}{both}{\contentsname}
    \createplainmark{lof}{both}{\listfigurename}
    \createplainmark{lot}{both}{\listtablename}
    \createplainmark{bib}{both}{\bibname}
    \createplainmark{index}{both}{\indexname}
    \createplainmark{glossary}{both}{\glossaryname}
  }
%  \makeevenhead{normalpage}{}{\headFont\itshape\small\thetitle}{}
  \makeevenhead{normalpage}{}{}{}
%  \makeoddhead{normalpage}{}{\headFont\itshape\small\leftmark}{}
  \makeoddhead{normalpage}{}{}{}
  \makeevenfoot{normalpage}{}{\footFont\footsize\color[gray]{0.3}\thepage}{}
  \makeoddfoot{normalpage}{}{\footFont\footsize\color[gray]{0.3}\thepage}{}

\pagestyle{normalpage}

%% ============
%% TOC settings
%% ============

\newlength{\toctopskip}
\setlength{\toctopskip}{2\baselineskip}

\renewcommand{\printtoctitle}[1]{%
  \raggedright\vspace*{\toctopskip}%
  \hspace*{17pt}\parbox{0.85\linewidth}{%
    \raggedright\chapTitleFont\chaptitlesize\MakeUppercase{\soChapter{\contentsname}}%
  }%
}

\renewcommand{\cftchapterfont}{\chapTitleFont\chaptitlesize\color{chaptitle}}
\renewcommand{\cftchapterpagefont}{\tocPageNumFont\normalsize\color{chaptitle}}
\renewcommand{\cftchapterpresnum}[1]{}
\setlength{\cftchapternumwidth}{0pt}
\renewcommand{\chapternumberline}[1]{}

\renewcommand{\cftsectiondotsep}{\cftnodots}
\renewcommand{\cftsectionpresnum}[1]{}
\setlength{\cftsectionnumwidth}{0pt}
\renewcommand{\numberline}[1]{}

\renewcommand{\cftsubsectiondotsep}{\cftnodots}
\renewcommand{\cftsubsectionpresnum}[1]{}
\setlength{\cftsubsectionnumwidth}{0pt}

%% ====================
%% Part and Book styles
%% ====================

\aliaspagestyle{book}{empty}
\aliaspagestyle{part}{empty}

\renewcommand*{\printbookname}{}
\renewcommand*{\printbooknum}{}

\renewcommand*{\beforebookskip}{\vspace*{0.5\textheight}}
\renewcommand*{\booktitlefont}{\chapNameFont\Large\color{chaptitle}}
\renewcommand*{\printbooktitle}[1]{\booktitlefont\soChapter{#1}}

\renewcommand{\partnamefont}{\booktitlefont}
\renewcommand{\partnumfont}{\booktitlefont}
\renewcommand{\parttitlefont}{\booktitlefont}
\renewcommand{\printpartname}{\partnamefont\MakeUppercase{\soChapter{\partname}}}

\renewcommand{\printparttitle}[1]{\parttitlefont\MakeUppercase{\soChapter{#1}}}

%% ==============
%% Chapter styles
%% ==============

\aliaspagestyle{chapter}{empty}

\setsecnumdepth{chapter}

\newlength\chapterskipoffset
\setlength\chapterskipoffset{0pt}

\makechapterstyle{mainmatter}{%
  \chapterstyle{default}
  \setlength{\beforechapskip}{0mm+\chapterskipoffset}
  \setlength{\midchapskip}{0pt}
  \setlength{\afterchapskip}{2em}
  \renewcommand*{\chapnumfont}{\chapNumFont\chapnamesize}
  \renewcommand*{\chapnamefont}{\chapNameFont}
  \renewcommand*{\chaptitlefont}{\chapTitleFont\chaptitlesize}
  \renewcommand*{\printchaptername}{}
  \renewcommand*{\printchapternum}{\chapnumfont\color{chapnum}\raggedright\hspace*{17pt}\thechapter}
  \renewcommand*{\printchapternonum}{\afterchapternum}
  \renewcommand*{\printchaptertitle}[1]{%
    \centering\chaptitlefont\color{chaptitle}##1}
}

\makechapterstyle{frontmatter}{%
  \chapterstyle{mainmatter}%
}

\makechapterstyle{backmatter}{%
  \chapterstyle{mainmatter}%
  %\printchapternonum%
}

\chapterstyle{default}

%% ==============
%% Section styles
%% ==============

\DeclareDocumentCommand\Section{oom}{
\IfNoValueTF{#1}
  {\section[#3]{\MakeUppercase{\soSection{#3}}}}
  {\IfNoValueTF{#2}{\section[#1]{\MakeUppercase{\soSection{#3}}}}{\section[#1][#2]{\MakeUppercase{\soSection{#3}}}}}
}

\setlength{\beforesecskip}{3\baselineskip}

\setsecheadstyle{\sectionFont\sectiontitlesize\color{chaptitle}}
\setsubsecheadstyle{\sectionFont\large\itshape\memRTLraggedright}
\setsubsubsecheadstyle{\sectionFont\normalsize\itshape\memRTLraggedright}

%% ==========================
%% Packages to be loaded LAST
%% ==========================

\usepackage[perpage,multiple,stable]{footmisc}

\usepackage[final,babel=true]{microtype}

%% =================
%% PDF/X-3:2002 info
%% =================

% \pdfobjcompresslevel=0%
% \pdfminorversion=3%
% \pdfinfo{
%   /Title (Dhammapada)
%   /Author (Forizs Laszlo)
%   /Subject (buddhizmus)
%   /Keywords (buddhizmus)
%   /GTS_PDFXVersion (PDF/X-3:2002)
% }%
% \pdfpageattr{
% /MediaBox [0 0 369.00000 594.00000]
% /BleedBox [0.00000 0.00000 369.00000 594.00000]
% /CropBox [0 0 369.00000 594.00000]
% /TrimBox [0.00000 0.00000 369.00000 594.00000]
% }
% \pdfcatalog{
%   /PageMode /UseNone
%   /OutputIntents [ <<
%     /Info (none)
%     /Type /OutputIntent
%     /S /GTS_PDFX
%     /OutputConditionIdentifier (Blurb.com)
%     /RegistryName (http://www.color.org/)
%   >> ]
% }%

%% ==============
