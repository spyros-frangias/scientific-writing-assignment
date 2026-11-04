%% unipi-assignment.cls
%% LaTeX class for University of Piraeus course assignments
%% Matches the official Word template formatting
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unipi-assignment}[2026/11/04 UniPi Assignment Template]

%% ─── Base class ────────────────────────────────────────────────────────────
\LoadClass[a4paper, 10pt, twoside]{article}

%% ─── Required packages ────────────────────────────────────────────────────
\RequirePackage[a4paper, top=3cm, bottom=3cm, left=3cm, right=3cm,
                headheight=14pt, headsep=1.2cm, footskip=1.5cm]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}            % Arial-like font (TeX Gyre Heros / Helvetica)
\RequirePackage{titlesec}          % Heading formatting
\RequirePackage{titletoc}          % TOC formatting
\RequirePackage{fancyhdr}          % Headers and footers
\RequirePackage{graphicx}          % Images
\RequirePackage{xcolor}            % Colors
\RequirePackage{caption}           % Caption formatting
\RequirePackage{booktabs}          % Professional tables
\RequirePackage{array}             % Table column types
\RequirePackage{tabularx}          % Full-width tables
\RequirePackage{setspace}          % Line spacing
\RequirePackage{parskip}           % Paragraph spacing (no indent by default)
\RequirePackage{enumitem}          % List formatting
\RequirePackage[pdfpagelabels=true,plainpages=false]{hyperref}          % Hyperlinks
\RequirePackage{bookmark}          % PDF bookmarks
\RequirePackage{etoolbox}          % Programming tools
\RequirePackage{calc}              % Arithmetic in lengths
\RequirePackage[titles]{tocloft}           % TOC/LOF/LOT formatting
\RequirePackage{float}             % Float positioning

% Blank pages inserted for two-sided alignment retain headers and footers
\renewcommand{\cleardoublepage}{%
  \clearpage
  \ifodd\c@page\else
    \hbox{}%
    \newpage
    \if@twocolumn\hbox{}\newpage\fi
  \fi
}

%% ─── Colors (from the Word template) ──────────────────────────────────────
\definecolor{heading1color}{HTML}{2E74B5}  % Heading 1 & unnumbered headings
\definecolor{heading4color}{HTML}{2F5496}  % Heading 4-5
\definecolor{heading6color}{HTML}{1F3763}  % Heading 6-7
\definecolor{linkcolor}{HTML}{0563C1}      % Hyperlinks

%% ─── Font setup ───────────────────────────────────────────────────────────
% Body: Arial 10pt — we use Helvetica (helvet) which is nearly identical
\renewcommand{\familydefault}{\sfdefault}
\renewcommand{\rmdefault}{phv}     % Helvetica for roman

% For "Arial Black" headings, we use bold Helvetica (close match)
% If you have fontspec + XeLaTeX, you can use actual Arial Black
\newcommand{\headingfont}{\fontseries{b}\fontfamily{phv}\selectfont}

%% ─── Spacing ──────────────────────────────────────────────────────────────
\setlength{\parindent}{0pt}        % No indentation by default (Normal-Noindentation)
\setlength{\parskip}{2pt plus 1pt} % ~60 twips after para ≈ 3pt (Word: spacing after=60)
\singlespacing                     % Single line spacing (Word: line=240)

%% ─── Indentation environment ─────────────────────────────────────────────
% For "Normal - Indentation" style: left indent 357 twips ≈ 0.63cm
\newlength{\bodyindent}
\setlength{\bodyindent}{0.63cm}

\newenvironment{indented}{%
  \begin{list}{}{%
    \setlength{\leftmargin}{\bodyindent}%
    \setlength{\rightmargin}{0pt}%
    \setlength{\parsep}{\parskip}%
    \setlength{\itemsep}{0pt}%
    \setlength{\topsep}{0pt}%
  }%
  \item\relax
}{%
  \end{list}%
}

%% ─── Heading styles ──────────────────────────────────────────────────────

% --- Heading 1 (numbered): Arial Black, 12pt, #2E74B5, bottom blue rule ---
\titleformat{\section}
  {\normalfont\fontsize{12}{14.4}\headingfont\color{heading1color}}
  {\thesection}
  {0.5em}
  {}
  [\vspace{1pt}{\color{heading1color}\titlerule[1.5pt]}]

\titlespacing*{\section}{0pt}{18pt plus 4pt minus 2pt}{6pt plus 2pt}

% Each numbered chapter starts on a new recto (odd) page
\let\orig@section\section
\renewcommand{\section}{\cleardoublepage\orig@section}

% --- Heading 2 (numbered): Arial Black, 11pt (default inherited), no color ---
\titleformat{\subsection}
  {\normalfont\fontsize{11}{13.2}\headingfont}
  {\thesubsection}
  {0.5em}
  {}

\titlespacing*{\subsection}{0pt}{18pt plus 4pt minus 2pt}{6pt plus 2pt}

% --- Heading 3 (numbered): Arial Black, 10pt, no color ---
\titleformat{\subsubsection}
  {\normalfont\fontsize{10}{12}\headingfont}
  {\thesubsubsection}
  {0.5em}
  {}

\titlespacing*{\subsubsection}{0pt}{18pt plus 4pt minus 2pt}{6pt plus 2pt}

% --- Heading 4: 11pt, #2F5496 ---
\titleformat{\paragraph}
  {\normalfont\fontsize{11}{13.2}\selectfont\color{heading4color}\bfseries}
  {\theparagraph}
  {0.5em}
  {}
\titlespacing*{\paragraph}{0pt}{12pt plus 2pt minus 2pt}{4pt plus 1pt}

% --- Heading 5: 11pt, #2F5496, italic ---
\titleformat{\subparagraph}
  {\normalfont\fontsize{11}{13.2}\selectfont\color{heading4color}\itshape}
  {\thesubparagraph}
  {0.5em}
  {}
\titlespacing*{\subparagraph}{0pt}{12pt plus 2pt minus 2pt}{4pt plus 1pt}

% --- Unnumbered heading (same look as Heading 1 but no number) ---
\newcommand{\sectionunnumbered}[1]{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{#1}%
  \vspace*{18pt}%
  {\normalfont\fontsize{12}{14.4}\headingfont\color{heading1color}#1}%
  \par\vspace{1pt}%
  {\color{heading1color}\rule{\textwidth}{1.5pt}}%
  \par\vspace{6pt}%
}

% Variant without page break
\newcommand{\sectionunnumberednoclear}[1]{%
  \phantomsection
  \addcontentsline{toc}{section}{#1}%
  \vspace*{18pt}%
  {\normalfont\fontsize{12}{14.4}\headingfont\color{heading1color}#1}%
  \par\vspace{1pt}%
  {\color{heading1color}\rule{\textwidth}{1.5pt}}%
  \par\vspace{6pt}%
}

%% ─── Numbering format: 1, 1.1, 1.1.1 ────────────────────────────────────
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

%% ─── Table of Contents formatting ────────────────────────────────────────
\renewcommand{\cftsecfont}{\normalfont\fontsize{10}{12}\selectfont}
\renewcommand{\cftsubsecfont}{\normalfont\fontsize{10}{12}\selectfont}
\renewcommand{\cftsubsubsecfont}{\normalfont\fontsize{10}{12}\selectfont}
\renewcommand{\cftsecpagefont}{\normalfont\fontsize{10}{12}\selectfont}
\renewcommand{\cftsubsecpagefont}{\normalfont\fontsize{10}{12}\selectfont}
\renewcommand{\cftsubsubsecpagefont}{\normalfont\fontsize{10}{12}\selectfont}
\setlength{\cftsecnumwidth}{2em}
\setlength{\cftsubsecnumwidth}{3em}
\setlength{\cftsubsubsecnumwidth}{4em}
\setlength{\cftsubsecindent}{2em}
\setlength{\cftsubsubsecindent}{5em}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftbeforesubsubsecskip}{0pt}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

%% ─── List of Figures / Tables formatting ─────────────────────────────────
\renewcommand{\cftfigfont}{\normalfont\fontsize{10}{12}\selectfont}
\renewcommand{\cfttabfont}{\normalfont\fontsize{10}{12}\selectfont}
\renewcommand{\cftfigpagefont}{\normalfont\fontsize{10}{12}\selectfont}
\renewcommand{\cfttabpagefont}{\normalfont\fontsize{10}{12}\selectfont}
\setlength{\cftbeforefigskip}{0pt}
\setlength{\cftbeforetabskip}{0pt}

%% ─── Captions ─────────────────────────────────────────────────────────────
% Caption: Arial 9pt, bold label, centered
\DeclareCaptionFont{captionsize}{\fontsize{9}{10.8}\selectfont}
\captionsetup{
  font={bf, captionsize},
  justification=centering,
  labelsep=colon,
  skip=10pt,
}

% Separate caption numbering per chapter: Figure 1.1, Table 1.1, etc.
\renewcommand{\thefigure}{\thesection.\arabic{figure}}
\renewcommand{\thetable}{\thesection.\arabic{table}}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}

% Custom "Diagram" float type
\newfloat{diagram}{htbp}{lod}[section]
\floatname{diagram}{Diagram}
\let\l@diagram\l@figure
% Clean Front Matter lists with UniPi styling and TOC registration
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}
\newcommand{\listofdiagramname}{List of Diagrams}

\AtBeginDocument{%
  \renewcommand{\tableofcontents}{%
    \cleardoublepage
    \sectionunnumberednoclear{\contentsname}%
    \vspace{-6pt}%
    \@starttoc{toc}%
  }%
  \renewcommand{\listoffigures}{%
    \cleardoublepage
    \sectionunnumberednoclear{\listfigurename}%
    \vspace{-6pt}%
    \@starttoc{lof}%
  }%
  \renewcommand{\listoftables}{%
    \cleardoublepage
    \sectionunnumberednoclear{\listtablename}%
    \vspace{-6pt}%
    \@starttoc{lot}%
  }%
  \newcommand{\listofdiagrams}{%
    \cleardoublepage
    \sectionunnumberednoclear{\listofdiagramname}%
    \vspace{-6pt}%
    \@starttoc{lod}%
  }%
}

%% ─── Tables styling ──────────────────────────────────────────────────────
% Tables: top and bottom rule only, header underline, centered, no side borders
% Use booktabs: \toprule, \midrule, \bottomrule

%% ─── Header and footer ───────────────────────────────────────────────────
\pagestyle{fancy}
\fancyhf{}

% Header: inner = document title (8pt), outer = author name (8pt)
\newcommand{\@doctitle}{}
\newcommand{\@docauthor}{}
\newcommand{\doctitle}[1]{\renewcommand{\@doctitle}{#1}}
\newcommand{\docauthor}[1]{\renewcommand{\@docauthor}{#1}}

\fancyhead[LO,RE]{\fontsize{8}{9.6}\selectfont \@doctitle}
\fancyhead[RO,LE]{\fontsize{8}{9.6}\selectfont \@docauthor}
\renewcommand{\headrulewidth}{0pt}

% Footer: outer = page number (8pt)
\fancyfoot[RO,LE]{\fontsize{8}{9.6}\selectfont \thepage}
\renewcommand{\footrulewidth}{0pt}

% Plain page style (for first page of sections, TOC, etc.)
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[LO,RE]{\fontsize{8}{9.6}\selectfont \@doctitle}%
  \fancyhead[RO,LE]{\fontsize{8}{9.6}\selectfont \@docauthor}%
  \fancyfoot[RO,LE]{\fontsize{8}{9.6}\selectfont \thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

% Empty page style (for title page, copyright)
\fancypagestyle{empty}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

%% ─── Hyperref setup ──────────────────────────────────────────────────────
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=linkcolor,
  pdfborder={0 0 0},
}

%% ─── Title page command ──────────────────────────────────────────────────
\newcommand{\@university}{University of Piraeus}
\newcommand{\@school}{School of Information and Communication Technologies}
\newcommand{\@department}{Department of Informatics}
\newcommand{\@coursetitle}{Course Assignment}
\newcommand{\@coursename}{}
\newcommand{\@essaytitle}{}
\newcommand{\@studentname}{}
\newcommand{\@fathername}{}
\newcommand{\@studentid}{}
\newcommand{\@submissiondate}{}

\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\school}[1]{\renewcommand{\@school}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\coursetitle}[1]{\renewcommand{\@coursetitle}{#1}}
\newcommand{\coursename}[1]{\renewcommand{\@coursename}{#1}}
\newcommand{\essaytitle}[1]{\renewcommand{\@essaytitle}{#1}}
\newcommand{\studentname}[1]{\renewcommand{\@studentname}{#1}}
\newcommand{\fathername}[1]{\renewcommand{\@fathername}{#1}}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}
\newcommand{\submissiondate}[1]{\renewcommand{\@submissiondate}{#1}}

\newcommand{\maketitlepage}{%
  \hypersetup{pageanchor=false}%
  \thispagestyle{empty}%
  \begin{center}
    \vspace*{-0.5cm}%
    \includegraphics[height=2.25cm]{images/unipi-logo.png}%
    \par\vspace{12pt}%
    {\fontsize{14}{16.8}\bfseries\selectfont \@university}%
    \par\vspace{4pt}%
    {\fontsize{12.5}{15}\bfseries\selectfont \@school}%
    \par\vspace{4pt}%
    {\fontsize{14}{16.8}\bfseries\selectfont \@department}%
    \par\vfill%
    {\fontsize{14}{16.8}\bfseries\selectfont \@coursetitle}%
    \par\vspace{4pt}%
    {\fontsize{14}{16.8}\bfseries\selectfont \guillemotleft\@coursename\guillemotright}%
    \par\vspace{1.2cm}%
  \end{center}%
  %
  % Student info table (fitted within 15cm text margins)
  \begin{center}
    \begin{tabular}{|p{5.0cm}|p{9.0cm}|}
      \hline
      Selected Topic Title & \@essaytitle \\
      \hline
      Student Name         & \@studentname \\
      \hline
      Father's Name        & \@fathername \\
      \hline
      Registration Number  & \@studentid \\
      \hline
    \end{tabular}
  \end{center}
  \vfill
  \begin{flushleft}
    \hspace*{0.63cm}Submission Date: \@submissiondate
  \end{flushleft}
  \clearpage
  \thispagestyle{empty}%
  \hbox{}%
  \thispagestyle{empty}%
  \clearpage
}

%% ─── Copyright page ─────────────────────────────────────────────────────
\newcommand{\makecopyrightpage}{%
  \sectionunnumberednoclear{Copyright \copyright}%
  \par\vspace{6pt}%
  Copying, storage, and distribution of this work, in whole or in part, for
  commercial purposes is prohibited. Reprinting, storage, and distribution for
  non-profit, educational, or research purposes is permitted, provided that the
  source is acknowledged and this notice is retained.%
  \par\vspace{6pt}%
  The views and conclusions contained in this document are solely those of the
  author and do not represent the official positions of the University of
  Piraeus.%
  \par\vspace{6pt}%
  As the author of this work, I declare that this work is not a product of
  plagiarism and does not contain material from unreferenced sources.%
  \cleardoublepage
}

%% ─── Front matter / Main matter ──────────────────────────────────────────
\newcommand{\frontmatter}{%
  \cleardoublepage
  \hypersetup{pageanchor=true}%
  \pagenumbering{roman}%
  \pagestyle{fancy}%
}

\newcommand{\mainmatter}{%
  \cleardoublepage
  \pagenumbering{arabic}%
  \pagestyle{fancy}%
}

%% ─── Bibliography style ─────────────────────────────────────────────────
% References use [1], [2], ... numbering format
\RequirePackage{cite}
\renewcommand{\refname}{Bibliography}
\renewenvironment{thebibliography}[1]{%
  \sectionunnumbered{\refname}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
       {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m
}{%
  \def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}

%% ─── Appendix support ───────────────────────────────────────────────────
\newcounter{appendixcounter}
\newcommand{\makeappendixheading}[1]{%
  \stepcounter{appendixcounter}%
  \phantomsection
  \addcontentsline{toc}{section}{Appendix \arabic{appendixcounter}}%
  \vspace*{18pt}%
  {\normalfont\fontsize{12}{14.4}\headingfont\color{heading1color}%
    Appendix \arabic{appendixcounter}\ifx&#1&\else: #1\fi}%
  \par\vspace{1pt}%
  {\color{heading1color}\rule{\textwidth}{1.5pt}}%
  \par\vspace{6pt}%
}

\endinput

