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

\RequirePackage[explicit]{titlesec}
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
% Tango colors
\definecolor{LightButter}{rgb}{0.98,0.91,0.31}
\definecolor{LightOrange}{rgb}{0.98,0.68,0.24}
\definecolor{LightChocolate}{rgb}{0.91,0.72,0.43}
\definecolor{LightChameleon}{rgb}{0.54,0.88,0.20}
\definecolor{LightSkyBlue}{rgb}{0.45,0.62,0.81}
\definecolor{LightPlum}{rgb}{0.68,0.50,0.66}
\definecolor{LightScarletRed}{rgb}{0.93,0.16,0.16}
\definecolor{Butter}{rgb}{0.93,0.86,0.25}
\definecolor{Orange}{rgb}{0.96,0.47,0.00}
\definecolor{Chocolate}{rgb}{0.75,0.49,0.07}
\definecolor{Chameleon}{rgb}{0.45,0.82,0.09}
\definecolor{SkyBlue}{rgb}{0.20,0.39,0.64}
\definecolor{Plum}{rgb}{0.46,0.31,0.48}
\definecolor{ScarletRed}{rgb}{0.80,0.00,0.00}
\definecolor{DarkButter}{rgb}{0.77,0.62,0.00}
\definecolor{DarkOrange}{rgb}{0.80,0.36,0.00}
\definecolor{DarkChocolate}{rgb}{0.56,0.35,0.01}
\definecolor{DarkChameleon}{rgb}{0.30,0.60,0.02}
\definecolor{DarkSkyBlue}{rgb}{0.12,0.29,0.53}
\definecolor{DarkPlum}{rgb}{0.36,0.21,0.40}
\definecolor{DarkScarletRed}{rgb}{0.64,0.00,0.00}
\definecolor{Aluminium1}{rgb}{0.93,0.93,0.92}
\definecolor{Aluminium2}{rgb}{0.82,0.84,0.81}
\definecolor{Aluminium3}{rgb}{0.73,0.74,0.71}
\definecolor{Aluminium4}{rgb}{0.53,0.54,0.52}
\definecolor{Aluminium5}{rgb}{0.33,0.34,0.32}
\definecolor{Aluminium6}{rgb}{0.18,0.20,0.21}

%-----------------------------------------------------------------------
% hyperref setup
\RequirePackage[bookmarks,
  bookmarksopen,
  colorlinks=true,
  linkcolor=DarkChameleon,
  urlcolor=DarkSkyBlue
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
  backgroundcolor=\color{Aluminium1},
  keywordstyle=[1]\color{DarkChameleon}\bfseries,
  keywordstyle=[2]\color{DarkOrange}\bfseries,
  keywordstyle=[3]\color{DarkScarletRed}\bfseries,
  commentstyle=\color{DarkPlum},
  stringstyle=\color{DarkPlum}
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
%Custom chapter titles
\titleformat{\chapter}[block]
  {\bfseries\Huge}
  {\colorbox{Aluminium6}{\parbox[c][25pt][c]{25pt}{%
        \hfil\color{Aluminium1}\Huge\bfseries\thechapter\hfil}}}
  {0pt}
  {\raisebox{-.3cm}{\hspace{.5cm}\Huge\bfseries#1}}
\titlespacing*{\chapter}
  {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

%-----------------------------------------------------------------------
\endinput

