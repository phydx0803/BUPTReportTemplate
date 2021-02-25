%buptreport.cls
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{buptreport}
    [2021/02/24 v0.3 The Report Template Designed For BUPT-SCIE]
\typeout{The Report Template Designed For BUPT-SCIE}
\def\BUPTversion{v0.3}

\RequirePackage{xkeyval}
\RequirePackage{etoolbox}
\define@boolkey{BUPT}[BUPT@opt@]{boldsongti}[false]{}
\define@boolkey{BUPT}[BUPT@opt@]{twoside}[false]{}
\define@boolkey{BUPT}[BUPT@opt@]{abstractpage}[true]{}
\define@boolkey{BUPT}[BUPT@opt@]{titleinabstract}[true]{}
\define@boolkey{BUPT}[BUPT@opt@]{toc}[true]{}
\define@cmdkeys{BUPT}[BUPT@opt@]{pagehead}
\define@key{BUPT}{pagehead}[北京邮电大学]{\gdef\BUPT@opt@pagehead{#1}}
\setkeys{BUPT}{pagehead=北京邮电大学}

\define@key{buptreport.cls}{pagehead}[北京邮电大学]{\gdef\BUPT@opt@pagehead{#1}}
\define@boolkey{buptreport.cls}[BUPT@opt@]{twoside}{}
\define@boolkey{buptreport.cls}[BUPT@opt@]{boldsongti}{}
\define@boolkey{buptreport.cls}[BUPT@opt@]{abstractpage}{}
\define@boolkey{buptreport.cls}[BUPT@opt@]{titleinabstract}{}
\define@boolkey{buptreport.cls}[BUPT@opt@]{toc}{}
\BUPT@opt@boldsongtifalse
\BUPT@opt@twosidefalse
\BUPT@opt@abstractpagetrue
\BUPT@opt@titleinabstracttrue
\BUPT@opt@toctrue

\newcommand{\reportsetup}[1]{\setkeys{BUPT}{#1}}
\ProcessOptionsX\relax

\ifBUPT@opt@twoside
    \PassOptionsToClass{twoside}{ctexart}
\fi
\LoadClass[zihao=-4,UTF8]{ctexart}
\RequirePackage{fontspec}


\ifBUPT@opt@boldsongti
    \setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{SimSun}
    \renewcommand*{\songti}{\CJKfamily{zhsong}}
\fi

\RequirePackage{fancyhdr, fancybox}
\RequirePackage{ifthen}
\RequirePackage{environ}
\RequirePackage{titlesec,titletoc}
\RequirePackage{lastpage}
\RequirePackage{listings}
\RequirePackage{amsthm, amsfonts}
\RequirePackage{amsmath, bm}
\RequirePackage{amssymb, mathrsfs}
\RequirePackage{extarrows}
\RequirePackage{xfrac}
\RequirePackage{latexsym}
\RequirePackage{longtable, multirow, hhline, tabularx, array}
\RequirePackage{changepage}
\RequirePackage{setspace}
\RequirePackage{flafter}
\RequirePackage{pifont, calc}
\RequirePackage{colortbl, booktabs}
\RequirePackage{float}
\RequirePackage{hologo}
\RequirePackage[scaled]{berasans}
\RequirePackage{hyperref}
\RequirePackage{ifpdf, ifxetex}
\setmainfont{Times New Roman}  
\setsansfont{Consolas}
\setmonofont{Courier New}

\RequirePackage{enumitem}
\setlist[enumerate,1]{itemsep=1ex,
                    parsep=0ex,
                    label=\arabic*、,
                    labelsep=0em,
                    leftmargin=0em,
                    itemindent=4em}
\setlist[enumerate,2]{itemsep=0.5ex,
                    parsep=0ex,
                    label=\alph*.,
                    labelsep=0.2em,
                    leftmargin=2em,
                    itemindent=3.7em}                    
\setlist[enumerate,3]{itemsep=0ex,
                    parsep=0ex,
                    labelsep=0em,
                    leftmargin=2em,
                    itemindent=3.7em}  

\ifpdf
    \RequirePackage{graphicx}
    \RequirePackage{epstopdf}
\else
    \ifxetex
        \RequirePackage{graphicx}
    \else
        \RequirePackage[dvipdfmx]{graphicx}
        \RequirePackage{bmpsize}
    \fi
\fi
\RequirePackage[svgnames]{xcolor}
\ifpdf
    \hypersetup{hidelinks}
\else
    \ifxetex
        \hypersetup{hidelinks}
    \else
        \hypersetup{dvipdfm, hidelinks}
    \fi
\fi

\ifBUPT@opt@twoside
    \RequirePackage[twoside]{geometry}
    %\setboolean{@twoside}{true}
    \geometry{  left=3.0cm,
                right=2.0cm}      
\else
    \RequirePackage{geometry}
    \setboolean{@twoside}{false}
    \geometry{  left=2.5cm,
                right=2.5cm}
\fi
\geometry{a4paper}                
\geometry{  top=2.5cm,
            bottom=2.5cm}
\geometry{headheight=1cm,headsep=1cm,footskip=1cm}
\linespread{1.35}\selectfont

\RequirePackage[titletoc]{appendix}
\renewcommand{\appendixname}{}
\renewenvironment{appendix}
{\begin{appendices}
    \renewcommand{\thesection}{附录{\rmfamily\arabic{section}}\hspace{0.15em}}}
{\end{appendices}}

\def\acknowledgement{
    \section*{致\qquad 谢}
    \phantomsection
    \addcontentsline{toc}{section}{致谢}}

\def\addReferencetoToC{\addcontentsline{toc}{section}{参考文献}}
\newenvironment{buptbibliography}
{\vspace*{4ex}\zihao{5}\begin{thebibliography}{99}
    \addtolength{\itemsep}{-1.4ex}
    \addReferencetoToC}
{\end{thebibliography}\zihao{-5}}


\fancyhf{}
%\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt}
\chead{\zihao{5} \BUPT@opt@pagehead}
\ifBUPT@opt@twoside
    \fancyfoot[RO]{\small --\hspace{0.3em}\thepage \hspace{0.3em}--}
    \fancyfoot[LE]{\small --\hspace{0.3em}\thepage \hspace{0.3em}--}
\else
    \fancyfoot[C]{\small --\hspace{0.3em}\thepage \hspace{0.3em}--}
\fi
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \ifBUPT@opt@twoside
        \fancyfoot[RO]{\small \thepage}
        \fancyfoot[LE]{\small \thepage}
    \else
        \fancyfoot[C]{\small \thepage}
    \fi
}

\setcounter{totalnumber}{4}
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\def\maketitle{%
    \pagestyle{fancy}
    \let\saved@thepage\thepage
    \let\thepage\relax
    \ifBUPT@opt@abstractpage
        \pagestyle{empty}
        \thispagestyle{empty}
        \ifBUPT@opt@titleinabstract
            \begin{center}
                \normalfont\bfseries\sffamily {\zihao{3}\@title} \par
                \mbox{}\vspace{-1ex}
            \end{center}
        \fi
        \make@abstract\par
        \vspace{1ex}
        \make@keywords
        \ifBUPT@opt@twoside
            \ifodd\value{page}
                \clearpage
                \mbox{}\vspace{\fill}
                \thispagestyle{empty}
                \clearpage
            \else
                \clearpage
            \fi
        \else
            \clearpage
        \fi
    \fi
    \newpage
    \ifBUPT@opt@toc
        \let\thepage\saved@thepage
        \renewcommand{\thepage}{\Roman{page}}
        \setcounter{page}{1}
        {
        \pagestyle{plain}
        \tableofcontents
        \ifBUPT@opt@twoside
            \ifodd\value{page}
                \newpage
                \mbox{}\vspace{\fill}
                \thispagestyle{empty}
                \clearpage
            \else
                \clearpage
            \fi
        \else
            \clearpage
        \fi
        }
        \renewcommand{\thepage}{\arabic{page}}
        \setcounter{page}{1}
    \else
        \let\thepage\saved@thepage
        \renewcommand{\thepage}{\arabic{page}}
        \setcounter{page}{1}
    \fi
    \pagestyle{fancy}
}

\def\abstractname{摘\qquad 要}
\RenewEnviron{abstract}{\xdef\@abstract{\expandonce\BODY}}
\def\make@abstract{%
    \begin{center}
        {\bfseries\sffamily\zihao{-3}\abstractname}

        \vspace*{-2ex}
        \mbox{}
    \end{center}
    \@abstract\par
}

\def\keywordsname{关键字}
\NewEnviron{keywords}{\xdef\@keywords{\expandonce\BODY}}
\def\make@keywords{%
    \par\noindent{\bfseries\sffamily\zihao{-4}\keywordsname}：
    \@keywords\par\thispagestyle{empty}}

\setcounter{secnumdepth}{4}

\renewcommand{\thesection}{第\chinese{section} 章}
\titleformat{\section}[hang]
{\normalfont \zihao{-3} \filcenter\bfseries\sffamily}
{\vspace*{-2ex}{\bfseries\sffamily\zihao{-3}\thesection}}
{1em}{}[\vspace{0.2ex}]

\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\titleformat{\subsection}[hang]
{\normalfont\zihao{4}\raggedright\sffamily\bfseries}
{\vspace{0.5ex}{\rmfamily\bfseries\large\thesubsection}}
{0.7em}{}[\vspace{0.2ex}]

\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\titleformat{\subsubsection}[hang]
{\vspace{-1.5ex}\normalfont\zihao{-4}\raggedright\bfseries\sffamily}
{\hspace{24pt}{\rmfamily\normalsize\thesubsubsection}}
{0.5em}{}[\vspace{-1.0ex}]

\renewcommand{\theparagraph}{\thesubsubsection.\arabic{paragraph}}
\titleformat{\paragraph}[hang]
{\vspace{-1.5ex}\normalfont\zihao{-4}\raggedright\bfseries\sffamily}
{\hspace{24pt}{\rmfamily\normalsize\theparagraph}}
{0.5em}{}[\vspace{-1.0ex}]

\setcounter{tocdepth}{3}  
\renewcommand{\contentsname}{目\hspace{2em}录}
\newcommand{\tocafterlength}{12pt}
%section
\titlecontents{section}[0pt]
    {\addvspace{6pt}\filright\bfseries}
    {\contentspush{\thecontentslabel{}\hspace{\tocafterlength}}}
    {}{\hspace{0.5em}\titlerule*[6pt]{$\cdot$}{\bfseries\rmfamily\normalsize{\contentspage}}}
    [\addvspace{0em}]
%subsection
\titlecontents{subsection}[22pt]
    {\addvspace{0pt}\filright\mdseries\rmfamily\normalsize}
    {\contentspush{\thecontentslabel\hspace{\tocafterlength}}}
    {}{\hspace{0.5em}\titlerule*[6pt]{$\cdot$}{\mdseries\rmfamily\normalsize{\contentspage}}}
    [\addvspace{0em}]
%subsubsection
\titlecontents{subsubsection}[48pt]
    {\addvspace{0pt}\filright\mdseries\rmfamily\normalsize}
    {\contentspush{\thecontentslabel\hspace{\tocafterlength}}}
    {}{\hspace{0.5em}\titlerule*[6pt]{$\cdot$}{\mdseries\rmfamily\normalsize{\contentspage}}}
    [\addvspace{0em}]


\providecommand{\dif}{\mathop{}\!\mathrm{d}}
\providecommand{\me}{\mathrm{e}}
\providecommand{\mi}{\mathrm{i}}
\providecommand{\abs}[1]{\left\vert #1 \right\vert}

\definecolor{grey}{rgb}{0.8,0.8,0.8}
\definecolor{darkgreen}{rgb}{0,0.3,0}
\definecolor{darkblue}{rgb}{0,0,0.3}
\definecolor{pur}{rgb}{0.6,0,0.6}
\definecolor{bupt}{rgb}{0.00392,0.227451,0.537255}
\def\lstbasicfont{\ttfamily\selectfont\footnotesize}
\lstset{%
    numbers=left,
    numberstyle=\small\color{bupt},%
    showstringspaces=false,
    showspaces=false,%
    tabsize=4,%
    frame=lines,%
    basicstyle={\footnotesize\lstbasicfont},%
    keywordstyle=\color{darkblue}\bfseries,%
    identifierstyle=,%
    commentstyle=\color{darkgreen},%\itshape,%
    stringstyle=\color{black}%
}
\lstloadlanguages{C,C++,Java,Matlab,Mathematica,TeX,Python}

\renewcommand{\refname}{参考文献}

\RequirePackage{subcaption}
\RequirePackage[format=hang,font=small,labelfont=normalfont,textfont=it]{caption}
\numberwithin{equation}{section}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}
\numberwithin{table}{section}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\numberwithin{figure}{section}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\numberwithin{footnote}{page}
\renewcommand{\thefootnote}{\ding{\numexpr171+\value{footnote}}}

\newcommand{\eqaref}[1]{\hyperref[#1]{式(} \thinspace\ref{#1})\hyperref[#1]{)}}
\newcommand{\figref}[1]{\hyperref[#1]{图} \thinspace\ref{#1}}
\newcommand{\tabref}[1]{\hyperref[#1]{表} \thinspace\ref{#1}}
\newcommand{\appref}[1]{\hyperref[#1]{附录} \thinspace\ref{#1}}
\newcommand{\secref}[1]{\hyperref[#1]{第}\ref{#1}\hyperref[#1]{章}}

%封面
\RequirePackage{pdfpages}
\newcommand{\makecover}[1]{
    \ifBUPT@opt@twoside
        \includepdf[pages={1,{}}]{#1}
    \else
        \includepdf{#1}
    \fi}

\endinput