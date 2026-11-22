%% unipi-assignment.cls
%% LaTeX class for University of Piraeus course assignments (Greek version)
%% Matches the official Word template formatting (Πρότυπο Εργασίας)
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unipi-assignment}[2026/11/21 UniPi Assignment Template (Greek)]

%% ─── Base class ────────────────────────────────────────────────────────────
\LoadClass[a4paper, 10pt, twoside]{article}

%% ─── Required packages ────────────────────────────────────────────────────
\RequirePackage[a4paper, top=3cm, bottom=3cm, left=3cm, right=3cm,
                headheight=14pt, headsep=1.2cm, footskip=1.5cm]{geometry}
\RequirePackage{cmap}              % Text extraction & search in Greek PDF
\RequirePackage[LGR, T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english, greek]{babel}
\RequirePackage{alphabeta}         % Support Greek/Latin letters seamlessly
\pdfmapfile{+carlito.map}
\RequirePackage{helvet}            % Arial-compatible font (phv)
\RequirePackage[sfdefault,lining]{carlito} % Calibri metric-compatible font (sfdefault)
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
\RequirePackage[titles]{tocloft}   % TOC/LOF/LOT formatting
\RequirePackage{float}             % Float positioning
\RequirePackage{cite}              % Citation management

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
% Body font: Calibri (Carlito) — metric-compatible with MS Calibri
\renewcommand{\familydefault}{\sfdefault}

% Map phv (Helvetica/Arial) in LGR encoding to sans-serif Greek font (lmss / cmss)
\DeclareFontFamily{LGR}{phv}{}
\DeclareFontShape{LGR}{phv}{m}{n}{<-> ssub * lmss/m/n}{}
\DeclareFontShape{LGR}{phv}{b}{n}{<-> ssub * lmss/bx/n}{}
\DeclareFontShape{LGR}{phv}{bx}{n}{<-> ssub * lmss/bx/n}{}
\DeclareFontShape{LGR}{phv}{m}{it}{<-> ssub * lmss/m/it}{}
\DeclareFontShape{LGR}{phv}{m}{sl}{<-> ssub * lmss/m/sl}{}
\DeclareFontShape{LGR}{phv}{b}{it}{<-> ssub * lmss/bx/it}{}
\DeclareFontShape{LGR}{phv}{bx}{it}{<-> ssub * lmss/bx/it}{}
\DeclareFontShape{LGR}{phv}{b}{sl}{<-> ssub * lmss/bx/sl}{}
\DeclareFontShape{LGR}{phv}{bx}{sl}{<-> ssub * lmss/bx/sl}{}

% Map Carlito (Calibri) in LGR encoding to sans-serif Greek font (lmss / cmss)
\DeclareFontFamily{LGR}{Crlt-TLF}{}
\DeclareFontShape{LGR}{Crlt-TLF}{m}{n}{<-> ssub * lmss/m/n}{}
\DeclareFontShape{LGR}{Crlt-TLF}{b}{n}{<-> ssub * lmss/bx/n}{}
\DeclareFontShape{LGR}{Crlt-TLF}{bx}{n}{<-> ssub * lmss/bx/n}{}
\DeclareFontShape{LGR}{Crlt-TLF}{m}{it}{<-> ssub * lmss/m/it}{}
\DeclareFontShape{LGR}{Crlt-TLF}{m}{sl}{<-> ssub * lmss/m/sl}{}
\DeclareFontShape{LGR}{Crlt-TLF}{b}{it}{<-> ssub * lmss/bx/it}{}
\DeclareFontShape{LGR}{Crlt-TLF}{bx}{it}{<-> ssub * lmss/bx/it}{}
\DeclareFontShape{LGR}{Crlt-TLF}{b}{sl}{<-> ssub * lmss/bx/sl}{}
\DeclareFontShape{LGR}{Crlt-TLF}{bx}{sl}{<-> ssub * lmss/bx/sl}{}

\DeclareFontFamily{LGR}{Crlt-LF}{}
\DeclareFontShape{LGR}{Crlt-LF}{m}{n}{<-> ssub * lmss/m/n}{}
\DeclareFontShape{LGR}{Crlt-LF}{b}{n}{<-> ssub * lmss/bx/n}{}
\DeclareFontShape{LGR}{Crlt-LF}{bx}{n}{<-> ssub * lmss/bx/n}{}
\DeclareFontShape{LGR}{Crlt-LF}{m}{it}{<-> ssub * lmss/m/it}{}
\DeclareFontShape{LGR}{Crlt-LF}{m}{sl}{<-> ssub * lmss/m/sl}{}
\DeclareFontShape{LGR}{Crlt-LF}{b}{it}{<-> ssub * lmss/bx/it}{}
\DeclareFontShape{LGR}{Crlt-LF}{bx}{it}{<-> ssub * lmss/bx/it}{}
\DeclareFontShape{LGR}{Crlt-LF}{b}{sl}{<-> ssub * lmss/bx/sl}{}
\DeclareFontShape{LGR}{Crlt-LF}{bx}{sl}{<-> ssub * lmss/bx/sl}{}

\DeclareFontFamily{LGR}{Crlt-OsF}{}
\DeclareFontShape{LGR}{Crlt-OsF}{m}{n}{<-> ssub * lmss/m/n}{}
\DeclareFontShape{LGR}{Crlt-OsF}{b}{n}{<-> ssub * lmss/bx/n}{}
\DeclareFontShape{LGR}{Crlt-OsF}{bx}{n}{<-> ssub * lmss/bx/n}{}
\DeclareFontShape{LGR}{Crlt-OsF}{m}{it}{<-> ssub * lmss/m/it}{}
\DeclareFontShape{LGR}{Crlt-OsF}{m}{sl}{<-> ssub * lmss/m/sl}{}

\DeclareFontFamily{LGR}{Crlt-TOsF}{}
\DeclareFontShape{LGR}{Crlt-TOsF}{m}{n}{<-> ssub * lmss/m/n}{}
\DeclareFontShape{LGR}{Crlt-TOsF}{b}{n}{<-> ssub * lmss/bx/n}{}
\DeclareFontShape{LGR}{Crlt-TOsF}{bx}{n}{<-> ssub * lmss/bx/n}{}
\DeclareFontShape{LGR}{Crlt-TOsF}{m}{it}{<-> ssub * lmss/m/it}{}
\DeclareFontShape{LGR}{Crlt-TOsF}{m}{sl}{<-> ssub * lmss/m/sl}{}

% Headings font: Bold Calibri/Carlito
\newcommand{\headingfont}{\bfseries}

% Arial font command for embedded English terms (matching the assignment document)
\newcommand{\arial}[1]{{\fontfamily{phv}\selectfont #1}}

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

% Each numbered chapter starts on a new page
\let\orig@section\section
\renewcommand{\section}{\clearpage\orig@section}

% --- Heading 2 (numbered): Arial Black, 11pt, no color ---
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
  \clearpage
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

%% ─── List of Figures / Tables / Diagrams formatting ──────────────────────
\newcommand{\diagramname}{Διάγραμμα}

\renewcommand*\l@figure[2]{%
  \begingroup
  \normalfont\fontsize{10}{12}\selectfont
  \def\numberline##1{\figurename~##1:\enspace}%
  \@dottedtocline{1}{0pt}{0pt}{#1}{#2}%
  \endgroup
}

\renewcommand*\l@table[2]{%
  \begingroup
  \normalfont\fontsize{10}{12}\selectfont
  \def\numberline##1{\tablename~##1:\enspace}%
  \@dottedtocline{1}{0pt}{0pt}{#1}{#2}%
  \endgroup
}

\newcommand*\l@diagram[2]{%
  \begingroup
  \normalfont\fontsize{10}{12}\selectfont
  \def\numberline##1{\diagramname~##1:\enspace}%
  \@dottedtocline{1}{0pt}{0pt}{#1}{#2}%
  \endgroup
}

%% ─── Captions ─────────────────────────────────────────────────────────────
% Caption: Arial 9pt, bold label, centered
\DeclareCaptionFont{captionsize}{\fontsize{9}{10.8}\selectfont}
\captionsetup{
  font={bf, captionsize},
  justification=centering,
  labelsep=colon,
  skip=10pt,
}

% Separate caption numbering per chapter: Εικόνα 1.1, Πίνακας 1.1, etc.
\renewcommand{\thefigure}{\thesection.\arabic{figure}}
\renewcommand{\thetable}{\thesection.\arabic{table}}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}

% Custom "Diagram" float type
\newfloat{diagram}{htbp}{lod}[section]
\floatname{diagram}{Διάγραμμα}

% Greek babel captions configuration
\addto\captionsgreek{%
  \renewcommand{\figurename}{Εικόνα}%
  \renewcommand{\tablename}{Πίνακας}%
  \renewcommand{\contentsname}{Πίνακας Περιεχομένων}%
  \renewcommand{\listfigurename}{Κατάλογος Εικόνων}%
  \renewcommand{\listtablename}{Κατάλογος Πινάκων}%
  \renewcommand{\refname}{Βιβλιογραφία}%
}

\newcommand{\listofdiagramname}{Κατάλογος Διαγραμμάτων}

\AtBeginDocument{%
  \renewcommand{\figurename}{Εικόνα}%
  \renewcommand{\tablename}{Πίνακας}%
  \renewcommand{\contentsname}{Πίνακας Περιεχομένων}%
  \renewcommand{\listfigurename}{Κατάλογος Εικόνων}%
  \renewcommand{\listtablename}{Κατάλογος Πινάκων}%
  \renewcommand{\refname}{Βιβλιογραφία}%
  \renewcommand{\tableofcontents}{%
    \clearpage
    \sectionunnumberednoclear{\contentsname}%
    \vspace{-6pt}%
    \@starttoc{toc}%
  }%
  \renewcommand{\listoffigures}{%
    \clearpage
    \sectionunnumberednoclear{\listfigurename}%
    \vspace{-6pt}%
    \@starttoc{lof}%
  }%
  \renewcommand{\listoftables}{%
    \clearpage
    \sectionunnumberednoclear{\listtablename}%
    \vspace{-6pt}%
    \@starttoc{lot}%
  }%
  \newcommand{\listofdiagrams}{%
    \clearpage
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
\newcommand{\@university}{ΠΑΝΕΠΙΣΤΗΜΙΟ ΠΕΙΡΑΙΩΣ}
\newcommand{\@school}{ΣΧΟΛΗ ΤΕΧΝΟΛΟΓΙΩΝ ΠΛΗΡΟΦΟΡΙΚΗΣ ΚΑΙ ΕΠΙΚΟΙΝΩΝΙΩΝ}
\newcommand{\@department}{ΤΜΗΜΑ ΠΛΗΡΟΦΟΡΙΚΗΣ}
\newcommand{\@coursetitle}{Εργασία Μαθήματος}
\newcommand{\@coursename}{Επιστημονική Συγγραφή στην Εκπαίδευση}
\newcommand{\@essaytitle}{}
\newcommand{\@studentname}{}
\newcommand{\@fathername}{}
\newcommand{\@studentid}{Π/ΧΧΧΧΧ}
\newcommand{\@submissiondate}{Μήνας Έτος}

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
      Τίτλος Επιλεγμένου Θέματος & \@essaytitle \\
      \hline
      Ονοματεπώνυμο Φοιτητή     & \@studentname \\
      \hline
      Πατρώνυμο                & \@fathername \\
      \hline
      Αριθμός Μητρώου          & \@studentid \\
      \hline
    \end{tabular}
  \end{center}
  \vfill
  \begin{flushleft}
    \hspace*{0.63cm}Ημερομηνία Παράδοσης: \@submissiondate
  \end{flushleft}
  \clearpage
  \thispagestyle{empty}%
  \hbox{}%
  \thispagestyle{empty}%
  \clearpage
}

%% ─── Copyright page ─────────────────────────────────────────────────────
\newcommand{\makecopyrightpage}{%
  \sectionunnumberednoclear{\textlatin{Copyright} \copyright}%
  \par\vspace{6pt}%
  Απαγορεύεται η αντιγραφή, αποθήκευση και διανομή της παρούσας εργασίας, εξ ολοκλήρου ή τμήματος αυτής, για εμπορικό σκοπό. Επιτρέπεται η ανατύπωση, αποθήκευση και διανομή για σκοπό μη κερδοσκοπικό, εκπαιδευτικής ή ερευνητικής φύσης, υπό την προϋπόθεση να αναφέρεται η πηγή προέλευσης και να διατηρείται το παρόν μήνυμα.%
  \par\vspace{6pt}%
  Οι απόψεις και τα συμπεράσματα που περιέχονται σε αυτό το έγγραφο εκφράζουν αποκλειστικά τον συγγραφέα και δεν αντιπροσωπεύουν τις επίσημες θέσεις του Πανεπιστημίου Πειραιώς.%
  \par\vspace{6pt}%
  Ως συγγραφέας της παρούσας εργασίας δηλώνω πως η παρούσα εργασία δεν αποτελεί προϊόν λογοκλοπής και δεν περιέχει υλικό από μη αναφερόμενες πηγές.%
  \clearpage
  \hbox{}%
  \clearpage
}

%% ─── Front matter / Main matter ──────────────────────────────────────────
\newcommand{\frontmatter}{%
  \clearpage
  \hypersetup{pageanchor=true}%
  \pagenumbering{roman}%
  \pagestyle{fancy}%
}

\newcommand{\mainmatter}{%
  \clearpage
  \pagenumbering{arabic}%
  \pagestyle{fancy}%
}

%% ─── Bibliography style ─────────────────────────────────────────────────
% References use [1], [2], ... numbering format
\renewcommand{\refname}{Βιβλιογραφία}
\renewenvironment{thebibliography}[1]{%
  \sectionunnumbered{\refname}%
  \begin{otherlanguage}{english}%
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
  \end{otherlanguage}%
}

%% ─── Appendix support ───────────────────────────────────────────────────
\newcounter{appendixcounter}
\newcommand{\greekAlph}[1]{%
  \ifcase#1\or Α\or Β\or Γ\or Δ\or Ε\or Ζ\or Η\or Θ\or Ι\or Κ\or Λ\or Μ\or Ν\or Ξ\or Ο\or Π\or Ρ\or Σ\or Τ\or Υ\or Φ\or Χ\or Ψ\or Ω\fi
}
  \newcommand{\makeappendixheading}[1]{%
    \stepcounter{appendixcounter}%
    \phantomsection
    \addcontentsline{toc}{section}{\arabic{appendixcounter}.\ifx&#1&\else\
    #1\fi}%
    \vspace*{18pt}%
    {\normalfont\fontsize{12}{14.4}\headingfont\color{heading1color}%
      \arabic{appendixcounter}.\ifx&#1&\else\ #1\fi}%
    \par\vspace{1pt}%
    {\color{heading1color}\rule{\textwidth}{1.5pt}}%
    \par\vspace{6pt}%
  }

\endinput
