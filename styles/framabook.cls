\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{framabook}[2007/12/03]

%-----------------------------------------------------------------------
% Avec des si...
\newif\ifversionenligne
\newif\ifbrouillon
\newif\ifpasdepartieII
\newif\ifframabookversion
%
\pasdepartieIIfalse
\framabookversiontrue
\brouillonfalse
\versionenlignetrue
%-----------------------------------------------------------------------
% Declaration des options
\DeclareOption{draft}{\brouillontrue\PassOptionsToClass{draft}{book}}
\DeclareOption{versionpapier}{\versionenlignefalse} 
\DeclareOption{versionenligne}{\versionenlignetrue}
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
\RequirePackage{textcomp,amsmath,manumac}
\RequirePackage[final]{graphicx}
\RequirePackage{xcolor}
\RequirePackage{nota}
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
% hyperref qui pète les ouilles
\def\Hy@WarningNoLine#1{}
\def\Hy@Warning#1{}
%-----------------------------------------------------------------------
% configuration de l'environnement nota
\newcommand{\ficnota}{attention}

\setlength{\largeurnota}{.8cm}
\newenvironment{nota}{%
  \begin{pictonote}{\ficnota}}{\end{pictonote}}
%----------------------------------------------------------------------
% pour faire parler \include dans le terminal
\let\includeORIG\include
\renewcommand{\include}[1]{%
  \typeout{============================================================}%
  \typeout{+ #1}%
  \typeout{============================================================}%  
  \includeORIG{#1}}
%-----------------------------------------------------------------------
%fichiers en couleurs pour version en ligne
%entre chevrons pour version papier
\ifversionenligne\let\fmbArg\colarg\else\let\fmbArg\bwarg\fi
%-----------------------------------------------------------------------
%renvois
\newcommand{\voir}[2]{%
  #2{\tiny$\blacktriangleleft$}%
  \marginpar{%
    \parbox[t]{.9\marginparwidth}{%
      {\small$\blacktriangleright$}{\footnotesize\sffamily\S\,\ref{#1}\,p.\,\pageref{#1}}
  }}
}
  
%
% fin du fichier
%
\endinput

