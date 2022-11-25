\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{labreport}[2022/11/19]

\LoadClassWithOptions{article}
\usepackage[a4paper, total={6in, 8in}]{geometry}
\usepackage{setspace}
\onehalfspacing
%% Table of Contents
% \setcounter{tocdepth}{2}
\usepackage[hidelinks]{hyperref}
% Nomenclature
\usepackage[stdsubgroups]{nomencl}
\usepackage{etoolbox}
\makenomenclature
%% Figures and images
\usepackage{graphicx}
\graphicspath{ {images/} }
\usepackage{subcaption}
%% Tables
\renewcommand{\arraystretch}{1.5}
\usepackage{tabularx}
\usepackage[tableposition=above]{caption}
%% Equations
\usepackage{amsmath}
%% Citations
\usepackage[nottoc,notlot,notlof,numbib]{tocbibind}
\usepackage{natbib}
\bibliographystyle{agsm}
%% Appendix
\usepackage[title,titletoc]{appendix}


%% ----------------------------------------------------------------
%% Page Numbering

\def\frontmatter{%
    \pagenumbering{roman}
    \setcounter{page}{1}
    \renewcommand{\thesection}{\Roman{section}}
}%

\def\mainmatter{%
    \pagenumbering{arabic}
    \setcounter{page}{1}
    \setcounter{section}{0}
    \renewcommand{\thesection}{\arabic{section}}
}%

\def\backmatter{%
    \setcounter{section}{0}
    \renewcommand{\thesection}{\Alph{section}}
}%

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
