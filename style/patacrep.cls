\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{patacrep}
\LoadClass[a4paper,twoside,12pt]{book}

\usepackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[frenchb]{babel}
\RequirePackage{type1cm}
\RequirePackage{lmodern}
\RequirePackage[francais]{minitoc}

\RequirePackage{eso-pic}
\RequirePackage{fancyhdr,fancybox,fancyvrb}
\RequirePackage{amssymb,amsmath}
\RequirePackage{xcolor, graphicx}
\RequirePackage{nota}
\RequirePackage{url}
\RequirePackage{ifthen}
\RequirePackage{xspace}
%-----------------------------------------------------------------------
% hyperref setup
\definecolor{tango-green-1}{HTML}{8ae234}
\definecolor{tango-green-3}{HTML}{4e9a06}
\definecolor{tango-blue-3}{HTML}{204a87}
\definecolor{tango-red-3}{HTML}{a40000}
\RequirePackage[bookmarks,
  bookmarksopen,
  colorlinks=true,
  linkcolor=tango-green-3,
  urlcolor=tango-blue-3
]{hyperref}

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

\endinput

