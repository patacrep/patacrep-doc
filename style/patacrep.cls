\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{patacrep}
\LoadClass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\RequirePackage[frenchb]{babel}

\RequirePackage{eso-pic}
\RequirePackage{fancyhdr,fancybox,fancyvrb}
\RequirePackage{amssymb,amsmath}
\RequirePackage{xcolor, graphicx}
\RequirePackage{nota}
\RequirePackage{url}
\RequirePackage{ifthen}
%-----------------------------------------------------------------------
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

%-----------------------------------------------------------------------
% emplacements des images
\graphicspath{ {fig/} {fig/pdf/} }
%-----------------------------------------------------------------------
\newcommand{\BackgroundPic}[1]{
  \put(0,0){
    \parbox[b][5cm]{\paperwidth}{%
      \vfill \centering
      \includegraphics[width=22cm]{#1}%
    }
  }
}
%-----------------------------------------------------------------------
% suppression des warning hyperref
\def\Hy@WarningNoLine#1{}
\def\Hy@Warning#1{}
%-----------------------------------------------------------------------
% configuration de l'environnement nota
\newcommand{\ficnota}{attention}
\setlength{\largeurnota}{.8cm}
\newenvironment{nota}{%
  \begin{pictonote}{\ficnota}}{\end{pictonote}}
%-----------------------------------------------------------------------
%file names
\newcommand{\colarg}[2][]{{\normalfont\color{tango-red-3}#2%
  \ifthenelse{\equal{#1}{}}{}{$_\mathit{#1}$}}}

   \let\marg\colarg

\let\fmbArg\colarg
%-----------------------------------------------------------------------
%renvois
\newcommand{\voir}[2]{%
  #2{\tiny$\blacktriangleleft$}%
  \marginpar{%
    \parbox[t]{.9\marginparwidth}{%
      {\small$\blacktriangleright$}{\footnotesize\sffamily\S\,\ref{#1}\,p.\,\pageref{#1}}
  }}
}
%-----------------------------------------------------------------------
\newcommand{\Touche}[1]{\Ovalbox{#1}}
%-----------------------------------------------------------------------

\DefineVerbatimEnvironment{unixcom}{Verbatim}{%
%  commandchars=¢«»,
  frame=leftline,
  framerule=1mm,
  framesep=2mm,
%  fontfamily=ccr,
%  gobble=2,
  xleftmargin=15pt}

\newcommand{\todo}[1]{\textbf{TODO:~}#1}

\newcommand{\latexcom}[1]{{\mdseries\ttfamily\upshape\symbol{92}#1}}
\newcommand{\command}[1]{{\mdseries\ttfamily\upshape#1}}


\endinput

