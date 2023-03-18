\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{labreport}[2022/11/19]

\LoadClassWithOptions{article}
\usepackage[a4paper, total={6in, 8in}]{geometry}
\usepackage{setspace}
\onehalfspacing
\usepackage{floatrow}

%% ----------------------------------------------------------------
%% Table of Contents
% \setcounter{tocdepth}{2} % section depth to display
\usepackage[hidelinks]{hyperref}

%% ----------------------------------------------------------------
%% Page Numbering

\def\frontmatter{
    \pagenumbering{roman}
    \setcounter{page}{1}
    \renewcommand{\thesection}{\Roman{section}}
}

\def\mainmatter{
    \pagenumbering{arabic}
    \setcounter{page}{1}
    \setcounter{section}{0}
    \renewcommand{\thesection}{\arabic{section}}
}

\def\backmatter{
    \setcounter{section}{0}
    \renewcommand{\thesection}{\Alph{section}}
}

%% ----------------------------------------------------------------
%% Title Page

% subtitle
\def\stitle{}
\newcommand{\subtitle}[1]{\def\stitle{#1\\}}

% department
\def\dept{}
\newcommand{\department}[1]{\def\dept{#1\\}}

% organisation
\def\org{}
\newcommand{\organisation}[1]{\def\org{#1\\}}

\renewcommand\titlepage{
    {
        \thispagestyle{empty}
        \maketitle
        \newpage
    }
}

% maketitle
\renewcommand\maketitle{
    {
        \begin{center}
        \vspace*{\fill} % centre text vertically
        {\Huge \bfseries \@title }\\[4ex]
        {\Large \stitle}
        \vspace{8ex}
        {\LARGE  \@author}\\[4ex]
        {\Large \dept}
        {\Large \org}
        \vspace{4ex}
        \@date\\[8ex]
        \vspace*{\fill}
        \end{center}
    }
}

%% ----------------------------------------------------------------
%% Nomenclature & Abbr.
\usepackage[stdsubgroups]{nomencl}
\usepackage{etoolbox}
\makenomenclature
\setlength{\nomlabelwidth}{5em}
\newenvironment{nomen}
    {
    %% This code creates the groups
    % -----------------------------------------
    \renewcommand\nomgroup[1]{
      \item[\bfseries
      \ifstrequal{##1}{A}{Latin Letters}{% %% Latin symbols first
      \ifstrequal{##1}{G}{Greek Letters}{% %% Greek symbols
      \ifstrequal{##1}{M}{Abbreviations}{% %% Abbreviations
      \ifstrequal{##1}{X}{Superscripts}{% %% Superscripts
      \ifstrequal{##1}{Z}{Subscripts}}}}} % %% Subscripts
    ]}
    % -----------------------------------------
    \renewcommand{\nomname}{Nomenclature and abbreviations}
    \addcontentsline{toc}{section}{\protect\numberline{}Nomenclature and abbreviations}
    }
    {
    \printnomenclature
    \newpage
    }

%% ----------------------------------------------------------------
%% Equations
\usepackage{amsmath}

%% ----------------------------------------------------------------
%% Tables
\floatsetup[table]{capposition=t}
\renewcommand{\arraystretch}{1.5}
\usepackage{tabularx}
\usepackage{caption}
\captionsetup{labelfont=bf, tableposition=top, figureposition=bottom}
\newenvironment{tbl}[4][\textwidth]
    {
     \table[h]\centering
     \caption{#3}\label{tab:#2}
     \tabularx{#1}{#4} \hline
    }
    {
     \endtabularx
     \endtable
    }

%% ----------------------------------------------------------------
%% Figures
\floatsetup[figure]{capposition=b}
\usepackage{graphicx}
\graphicspath{ {images/} }
\usepackage{subcaption}
\newenvironment{img}[2]
    {
    \figure[h]\centering
    \caption{#2}\label{fig:#1}%
    }
    {
    \endfigure
    }

\newenvironment{subimg}[4][\textwidth]
    {
    \subfigure[h]{#1}\centering
    \src{#4}
    \subcaption{#3}\label{fig:#2}%
    }
    {
    \endsubfigure
    }

\newcommand{\src}[2][\textwidth]{\includegraphics[width=#1]{#2}}

%% ----------------------------------------------------------------
%% Citations
\usepackage[nottoc,notlot,notlof,numbib]{tocbibind}
\usepackage{natbib}
\bibliographystyle{agsm}

%% ----------------------------------------------------------------
%% Appendix
\usepackage[title,titletoc]{appendix}

%% ----------------------------------------------------------------
%% Code blocks
\usepackage{listings}
\usepackage{color}

\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{frame=tb,
  language=Java,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3
}