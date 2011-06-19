%=======================================================================
% File      : patacrep.cls
%=======================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{patacrep}
\LoadClass[a4paper,twoside,12pt]{book}

%font
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,frenchb]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{type1cm}
\RequirePackage{lmodern}
\RequirePackage{inconsolata}
\RequirePackage[francais]{minitoc}

\RequirePackage{eso-pic}
\RequirePackage{fancyhdr,fancybox,fancyvrb}
\RequirePackage{amssymb,amsmath}
\RequirePackage[table]{xcolor}
\RequirePackage{graphicx, subfigure}
\RequirePackage{multicol}
\RequirePackage{nota}
\RequirePackage{url}
\RequirePackage{ifthen}
\RequirePackage{xspace}
\RequirePackage{listings}
%-----------------------------------------------------------------------
% hyperref setup
\definecolor{tango-green-1}{HTML}{8ae234}
\definecolor{tango-green-3}{HTML}{4e9a06}
\definecolor{tango-blue-3}{HTML}{204a87}
\definecolor{tango-red-3}{HTML}{a40000}
\definecolor{tango-grey-1}{HTML}{eeeeee}
\definecolor{tango-purple-3}{HTML}{5c3566}
\definecolor{tango-grey-4}{HTML}{888a85}
\definecolor{tango-orange-3}{HTML}{ce5c00}
\RequirePackage[bookmarks,
  bookmarksopen,
  colorlinks=true,
  linkcolor=tango-green-3,
  urlcolor=tango-blue-3
]{hyperref}

\newif{\iffr}
\DeclareOption{fr}{\frtrue}
\ProcessOptions

%-----------------------------------------------------------------------
% metadata
\hypersetup{
pdfauthor = {Romain Goffe},%
pdftitle = {Patacrep! Songbook Documentation},%
pdfkeywords = {},%
pdfcreator = {PDFLaTeX},%
pdfproducer = {PDFLaTeX}}

\def\Hy@WarningNoLine#1{}
\def\Hy@Warning#1{}

%-----------------------------------------------------------------------
% figures
\graphicspath{ {fig/} {fig/pdf/} }

%-----------------------------------------------------------------------
% Set equal margins on book style
\setlength{\oddsidemargin}{30pt}
\setlength{\evensidemargin}{30pt}
\setlength{\marginparwidth}{45pt}
\setlength{\footskip}{30pt}
\setlength{\textwidth}{400pt}
%-----------------------------------------------------------------------
% Redefine plain page style
\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[LE,RO]{\thepage}
}
%-----------------------------------------------------------------------
% Code for creating empty pages
% No headers on empty pages before new chapter
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}
  \thispagestyle{plain}
  \newpage
  \if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother \clearpage{\pagestyle{plain}\cleardoublepage}
%-----------------------------------------------------------------------
% Define pagestyle
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}
 
\fancyhf{}
\fancyfoot[LE,RO]{\thepage}
\fancyhead[RE]{\textit{\nouppercase{\leftmark}}}
\fancyhead[LO]{\textit{\nouppercase{\rightmark}}}
 
\fancypagestyle{plain}{ %
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}
%-----------------------------------------------------------------------
%Paragraphs
\setlength{\parskip}{0.5ex plus .2ex minus .2ex}
\renewcommand{\paragraph}[1]{\subsubsection*{#1}}

%Disable single lines at the start of a paragraph 
\clubpenalty = 10000
\widowpenalty = 10000
\displaywidowpenalty = 10000
%-----------------------------------------------------------------------
% syntax highlighting with listings

% style sheet
\lstset{
  basicstyle=\footnotesize\ttfamily,
  literate={é}{{\'e}}1 {à}{{\`a}}1 {è}{{\`e}}1,
  frame=leftline,
  framerule=1mm,
  framesep=2mm,
  xleftmargin=15pt,
  backgroundcolor=\color{tango-grey-1},
  keywordstyle=[1]\color{tango-green-3}\bfseries,
  keywordstyle=[2]\color{tango-orange-3}\bfseries,
  keywordstyle=[3]\color{tango-red-3}\bfseries,
  commentstyle=\color{tango-purple-3},
  stringstyle=\color{tango-purple-3}
}

% language definition
\lstdefinelanguage{songbook}{
  keywords=[1]{
    beginsong,beginverse,beginchorus,
    endsong,endverse,endchorus
  },
  morekeywords=[2]{
    selectlanguage,songcolumns,gtab,
    cover, rep, echo, lilypond, image
  },
  morecomment=[l]{\%},
  morecomment=[s]{[}{]},
}

% language definition
\lstdefinelanguage{lilypond}{
  keywords=[1]{
    include,paper
  },
  morekeywords=[2]{
    key,major,minor,time,
    relative, trill,times
  },
  morecomment=[l]{\%},
  morestring=[b]",
}

% language definition
\lstdefinelanguage{unix}{
    morekeywords=[3]{
      sudo
    }
}
%-----------------------------------------------------------------------
\endinput

