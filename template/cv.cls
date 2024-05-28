% -- Class identification:
\NeedsTeXFormat{LaTeX2e}
\LoadClass[a4paper,11pt]{article}
\ProvidesClass{./template/cv}[...]

% -- LaTeX variables

% CV owner name (title):
\def \cvname#1{\def\@cvname{#1}}
\def \@cvname{}
% E-mail:
\def \email#1{\def\@email{#1}}
\def \@email{}
% Website:
\def \website#1{\def\@website{#1}}
\def \@website{}
% LinkedIn:
\def \linkedin#1{\def\@linkedin{#1}}
\def \@linkedin{}

% -- Encoding and idiom:
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{tgtermes}

% -- Margins:
\RequirePackage[margin=1in]{geometry}

% -- Spacing:
\RequirePackage{setspace}
\setstretch{1.05}
\setlength{\parindent}{0pt}

% -- Lists:
\RequirePackage{enumitem}
\setlist{left=0pt, itemsep=-0.25em}
\setlist[itemize]{label=--}

% -- Auxiliary packages:
\RequirePackage{etoolbox}
\RequirePackage{hanging}
\RequirePackage{lipsum}
\RequirePackage{needspace}
\RequirePackage{parskip}

% -- Prevent orphan lines
\RequirePackage[defaultlines=3,all]{nowidow}

% -- Underfull/Overfull warnings:
\hfuzz=1000pt
\tolerance=20000
\hbadness=19999

% -- Colour, hyperlinks and URLs:
\RequirePackage{xcolor}
\definecolor{conflowrblue}{HTML}{1E90FF}
\RequirePackage[hidelinks]{hyperref}
\hypersetup{
  colorlinks = true,
  urlcolor = blue,
  linkcolor = black,
  citecolor = black,
}
\RequirePackage{url}
\urlstyle{same}

% -- Maths:
\RequirePackage{amsmath,amssymb,amsfonts}

% -- Icons:
\RequirePackage{fontawesome}

% -- Headings:
\RequirePackage[explicit]{titlesec}
% Raised Rule Command:
% Arg 1 (Optional) - How high to raise the rule
% Arg 2 - Thickness of the rule
\newcommand{\raisedrulefill}[2][0ex]{\leaders\hbox{\rule[#1]{1pt}{#2}}\hfill}
\titleformat{\section}{\Large\bfseries}{}{0em}{#1\,\raisedrulefill[1pt]{0.25pt}}
\titleformat{\subsection}{\scshape\large}{}{0em}{#1}
\titleformat{\subsubsection}{\bfseries\normalsize}{}{0em}{#1}
%
\titlespacing{\section}{0pt}{11pt}{1.5pt}
\titlespacing{\subsection}{0pt}{6pt}{0pt}
\titlespacing{\subsubsection}{0pt}{6pt}{1.5pt}

% -- Floats:
\RequirePackage{multirow,multicol}
\RequirePackage{array}
% New column definitions
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% -- Custom page style:
\RequirePackage{datetime}
\RequirePackage{fancyhdr}
% Header/footer configuration:
\fancypagestyle{fancy}{
  \fancyhf{}
  \fancyfoot[L]{\small\textcolor{gray!50}{\monthname[\month] \the\year}}
  \fancyfoot[C]{\small\textcolor{gray!50}{Daniel Burger’s Curriculum Vitae}}
  \fancyfoot[R]{\small\textcolor{gray!50}{Page \thepage}}
  \renewcommand{\headrulewidth}{0pt}
  \setlength{\headsep}{0pt}
  \setlength{\footskip}{45pt}
}
\pagestyle{fancy}

% -- Custom commands:
%
% Title command
\newcommand{\printcvtitle}{
  \begin{center}
    {\Huge\bfseries\@cvname}\\  \medskip

    {\small
      \href{mailto:\@email}{\@email} \ \ | \ \ \href{\@website}{www.danielburger.online} \ \ | \ \
      \href{https://linkedin.com/in/danburonline}{@danburonline}
    }
  \end{center}
}
% Entries for Education:
\newcommand{\educationentry}[5]{
\smallskip\setstretch{0.75}
{\textbf{#1}} \hfill
{\color{black!75} #2}\\
{\scshape#3} \hfill {\footnotesize\color{black!75} \emph{#4}}\\\vspace*{-1.15\baselineskip}
\setstretch{1.05}\begin{itemize}#5\end{itemize}\smallskip
}
% Entries for Work Experience (academic):
\newcommand{\workentry}[5]{
\bigskip\setstretch{0.75}
{\textbf{#1}} \hfill
{\color{black!75} #2}\\
{\scshape#3} \hfill {\footnotesize\color{black!75} \emph{#4}}\\\vspace*{-1.15\baselineskip}
\setstretch{1.05}\begin{itemize}#5\end{itemize}\smallskip
}
% Entries for Work Experience (industry):
\newcommand{\workindustry}[5]{
\bigskip\setstretch{0.75}
{\textbf{#1}} \hfill
{\color{black!75} #2}\\
{\scshape#3} \hfill {\footnotesize\color{black!75} \emph{#4}}\\\vspace*{-1.15\baselineskip}
\setstretch{1.05}\begin{itemize}#5\end{itemize}\smallskip
}
% Entries for Awards:
\newcommand{\awardentry}[5]{
  \begin{tabular}{@{} l p{12cm} R{2cm}}
    {\color{black!75}#1} &
    \textbf{#2},~#3      &
    {\footnotesize\color{black!75}\emph{#4}}              \\
                          & \multicolumn{2}{p{14.5cm}}{#5}
  \end{tabular}
}
% Entries for Fellowships:
\newcommand{\fellowship}[5]{
  \begin{tabular}{@{} l p{12cm} R{2cm}}
    {\color{black!75}#1} &
    \textbf{#2},~#3      &
    {\footnotesize\color{black!75}\emph{#4}}              \\
                          & \multicolumn{2}{p{14.5cm}}{#5}
  \end{tabular}
}
% Entries for Grants:
\newcommand{\grant}[5]{
  \begin{tabular}{@{} l p{12cm} R{2cm}}
    {\color{black!75}#1} &
    \textbf{#2},~#3      &
    {\footnotesize\color{black!75}\emph{#4}}              \\
                          & \multicolumn{2}{p{14.5cm}}{#5}
  \end{tabular}
}
% Publications command:
\newcommand{\publications}[1]{
  \setlength{\parskip}{6pt}
  \begin{hangparas}{0.25in}{1}
    #1
  \end{hangparas}\smallskip
}

% Entries for Research Experience:
\newcommand{\researchentry}[5]{
\needspace{3\baselineskip}
\smallskip
{\textbf{#1}}
\hfill{\textbf{#2}}\\ {\raggedleft\itshape#3\hfill{\color{black!75}#4}}
\begin{itemize}#5\end{itemize}
}
% Entries for Teaching:
\newcommand{\teachingentry}[5]{
{\textbf{#1}}
\hfill{\textbf{#2}}\\
\emph{#3}~\hfill~{\raggedright\color{black!75}\emph{#4}}
\begin{itemize}#5\end{itemize}
}
% Entries for Courses Taught:
\newcommand{\coursetaught}[5]{
  \begin{tabular}{ @{} p{2.25cm} p{10.35cm} R{2cm}@{} }
    #1 & \textbf{#2},~#3                 & {\footnotesize\color{black!80}\emph{#4}} \\
        & \multicolumn{2}{p{12.35cm}}{#5}
  \end{tabular}
}
% Entries for Presentation:
\newcommand{\presentation}[4]{
  \begin{tabular}{ @{} p{2.25cm} p{10cm} R{2.5cm} @{} }
    #1 & \textbf{#2},~#3 & {\footnotesize\color{black!80}\emph{#4}} \\
  \end{tabular}
}
% Entries for Professional activities:
\newcommand{\activity}[5]{
  \begin{tabular}{ @{} p{1cm} p{11.25cm} R{2.75cm} @{} }
    \multirow{2}{*}{\parbox[t]{1cm}{#1}} & \textbf{#2},~#3              & {\footnotesize\color{black!80}\emph{#4}} \\
                                        & \multicolumn{2}{p{14cm}}{#5}                                            \\
  \end{tabular}
}
% Entries for Miscellaneous:
\newcommand{\miscentry}[5]{
  \begin{tabular}{ @{} p{1.5cm} p{11cm} R{2.25cm} @{} }
    #1 & \textbf{#2},~#3                 & {\footnotesize\color{black!80}\emph{#4}} \\
      & \multicolumn{2}{p{12.35cm}}{#5}
  \end{tabular}
}
% Generic entry:
\newcommand{\entry}[4]{%
  \noindent%
  \parbox{\linewidth}{%
    \textbf{#1} \hfill \textbf{#2} \\
    #3 \hfill #4%
  }%
  \vspace{0.5em}%
}
% Tools:
\newcommand{\tools}[1]{
  \begin{itemize}
    #1
  \end{itemize}
}
% Spoken languages:
\newcommand{\languages}[1]{
  \begin{itemize}
    #1
  \end{itemize}
}
% Print the CV title when starting the document:
\AtBeginDocument{
  \printcvtitle
}