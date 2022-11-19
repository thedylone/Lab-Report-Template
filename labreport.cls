\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{labreport}[2022/11/19]

\LoadClassWithOptions{article}
\usepackage[a4paper, total={6in, 8in}]{geometry}
\usepackage{nomencl} % for nomen
\usepackage{etoolbox} % for nomen
\usepackage[nottoc,notlot,notlof,numbib]{tocbibind} % for citations
\usepackage{natbib} % for citations
\makenomenclature

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

\newenvironment{nomen}
    {
    \section*{Nomenclature and abbreviations}
    \addcontentsline{toc}{section}{\protect\numberline{}Nomenclature and abbreviations}
    %% This code creates the groups
    % -----------------------------------------
    \renewcommand\nomgroup[1]{
      \item[\bfseries
      \ifstrequal{##1}{A}{}{% %% Roman symbols first
      \ifstrequal{##1}{B}{}{% %% Greek symbols
      \ifstrequal{##1}{C}{}{}}}% %% Abbreviations last
    ]}
    % -----------------------------------------
    \renewcommand{\nomname}{}
    }
    {
    \printnomenclature
    \newpage
    }

%% ----------------------------------------------------------------
%% References (aka Bibliography)

\bibliographystyle{agsm}