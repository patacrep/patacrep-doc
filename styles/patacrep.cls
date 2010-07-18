\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{patacrep}

%-----------------------------------------------------------------------
\newif\ifonline
%
\onlinetrue
%-----------------------------------------------------------------------
% Declaration des options
\DeclareOption{paper}{\onlinefalse} 
\DeclareOption{online}{\onlinetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
% Exécution des options
\ProcessOptions
\LoadClass[a4paper]{article}
%%-----------------------------------------------------------------------
% Paquets à charger
\RequirePackage{ifpdf}
\RequirePackage{fancyhdr,amssymb}
\RequirePackage{calc,index}
\RequirePackage{fancybox}
%\RequirePackage{textcomp,amsmath,manumac}
\RequirePackage{textcomp,amsmath}
\RequirePackage[final]{graphicx}
\RequirePackage{xcolor}
\RequirePackage{nota}
\RequirePackage{commands}
\definecolor{tango-green-1}{HTML}{8ae234}
\definecolor{tango-green-3}{HTML}{4e9a06}
\definecolor{tango-blue-3}{HTML}{204a87}
\definecolor{tango-red-3}{HTML}{a40000}
\RequirePackage[bookmarks,
  bookmarksopen,
  colorlinks=true,
  linkcolor=tango-green-3,
  urlcolor=tango-blue-3]{hyperref}

%-----------------------------------------------------------------------
% emplacements des graphiques
\graphicspath{ {fig/pdf/} }

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
%fichiers en couleurs pour version en ligne
%entre chevrons pour version papier
\ifonline\let\fmbArg\colarg\else\let\fmbArg\bwarg\fi

%-----------------------------------------------------------------------
%renvois
\newcommand{\voir}[2]{%
  #2{\tiny$\blacktriangleleft$}%
  \marginpar{%
    \parbox[t]{.9\marginparwidth}{%
      {\small$\blacktriangleright$}{\footnotesize\sffamily\S\,\ref{#1}\,p.\,\pageref{#1}}
  }}
}

%%-----------------------------------------------------------------------
%%environnement pour les commandes unix
%\DefineVerbatimEnvironment{unixcom}{Verbatim}{%
%  frame=leftline,
%  framerule=1mm,
%  framesep=2mm,
%  xleftmargin=15pt}


%-----------------------------------------------------------------------
\endinput

