% Copyright 2016 Michael Walker <mike@barrucadu.co.uk>
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%     http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{barrucadu-cv}[2021/08/11 barrucadu's cv class]

% -----------------------------------------------------------------------------
% -- Document set-up

\RequirePackage{ifthen}
\RequirePackage{etoolbox}

% See the README for option documentation.

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\title{Curriculum Vitae}

\RequirePackage[vmargin=0.75cm]{geometry}
\addtolength{\textheight}{-2cm}

% -----------------------------------------------------------------------------
% -- Fonts and Colours

\RequirePackage{fontspec}

\newfontfamily\nameFont{Century Supra A Caps}[
  Path        = ../fonts/mb_type_library/otf/Century Supra A Caps/ ,
  Extension   = .otf ,
  UprightFont = Century Supra A Caps Regular,
]

\setmainfont{Valkyrie A}[
  Path           = ../fonts/mb_type_library/otf/Valkyrie A/ ,
  Extension      = .otf ,
  UprightFont    = Valkyrie A Regular ,
  BoldFont       = Valkyrie A Bold ,
  ItalicFont     = Valkyrie A Italic ,
  BoldItalicFont = Valkyrie A Bold Italic ,
  Numbers        = OldStyle ,
]

\newfontfamily\sectionHeadingFont{Heliotrope 8 Caps (Uppercase)}[
  Path        = ../fonts/mb_type_library/otf/Heliotrope 8/ ,
  Extension   = .otf ,
  UprightFont = Heliotrope 8 Italic ,
  LetterSpace = 4 ,
]

\newfontfamily\subsectionHeadingFont{Heliotrope 8 Caps}[
  Path        = ../fonts/mb_type_library/otf/Heliotrope 8 Caps/ ,
  Extension   = .otf ,
  UprightFont = Heliotrope 8 Caps Regular ,
]

\newfontfamily\entryHeadingFont{Heliotrope 6}[
  Path        = ../fonts/mb_type_library/otf/Heliotrope 6/ ,
  Extension   = .otf ,
  UprightFont = Heliotrope 6 Regular,
]

\newfontfamily\entryDateFont{Valkyrie A}[
  Path        = ../fonts/mb_type_library/otf/Valkyrie A/ ,
  Extension   = .otf ,
  UprightFont = Valkyrie A Regular ,
  Numbers     = OldStyle ,
]

\RequirePackage[usenames,dvipsnames]{xcolor}

\definecolor{links}{rgb}{0.1,0.3,0.45}
\definecolor{keyword}{HTML}{2b2b2b}
\definecolor{primary}{HTML}{000000}
\definecolor{rules}{HTML}{dddddd}

% -----------------------------------------------------------------------------
% -- Hyperlinks

\RequirePackage[pdfborder={0,0,0}]{hyperref}

% \link[optional text]{link}
\newcommand*{\link}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {{\color{links}\href{#2}{#2}}}%
    {{\color{links}\href{#2}{#1}}}}

% \httplink[optional text]{link}
\newcommand*{\httplink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {{\color{links}\href{https://#2}{#2}}}%
    {{\color{links}\href{https://#2}{#1}}}}

% \githublink[optional text]{user}{repo}
\newcommand*{\githublink}[3][]{%
  \ifthenelse{\equal{#1}{}}%
    {{github:~\color{links}\href{https://github.com/#2/#3}{#2/#3}}}%
    {{\color{links}\href{https://github.com/#2/#3}{#1}}}}

% \emaillink[optional text]{link}
\newcommand*{\emaillink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {{\color{links}\href{mailto:#2}{#2}}}%
    {{\color{links}\href{mailto:#2}{#1}}}}

% \doilink{number}
\newcommand*{\doilink}[2][]{%
  {doi:~\color{links}\href{https://doi.org/#1}{#2}}}

% -----------------------------------------------------------------------------
% -- Header and footer

\newcommand{\makecvhead}{%
  \begin{center}%
    \fontsize{40pt}{60pt}\nameFont%
    \@firstname%
    \hspace{10pt}%
    \@lastname%
  \end{center}}

\newcommand*{\makecvfoot}{%
  \fancypagestyle{plain}{%
    \fancyfoot[c]{%
      \parbox[b]{\textwidth}{%
        \centering%
        \vspace{\baselineskip}%
        \@addresscity~---~\@addresscountry\\
        \emaillink{\@email} ~\textbullet~ \httplink{\@homepage}\\
        github:~\httplink[\@github]{https://github.com/\@github} ~\textbullet~ linkedin:~\httplink[\@linkedin]{https://www.linkedin.com/in/\@linkedin} ~\textbullet~ twitter:~\httplink[\@twitter]{https://twitter.com/\@twitter}}}}
  \pagestyle{plain}}

\AtBeginDocument{%
  \makecvhead%
  \makecvfoot%
  \raggedright}

\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhf{}}
\pagestyle{plain}

% -----------------------------------------------------------------------------
% -- Section headings

\RequirePackage{titlesec}

\titleformat{\section}{\large\sectionHeadingFont}{}{0em}{}[{\color{rules}\titlerule}]

\titlespacing*{\subsection}{0pt}{4pt plus 2pt minus 2pt}{4pt plus 2pt minus 2pt}
\titleformat{\subsection}{\large\subsectionHeadingFont}{}{0em}{}

% -----------------------------------------------------------------------------
% -- Personal details

\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\newcommand*{\address}[2]{\def\@addresscity{#1}\def\@addresscountry{#2}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}

% -----------------------------------------------------------------------------
% -- Entries

\newcommand{\entryspacing}{\vspace{8pt}}

\newcommand{\entryhead}[2]{%
\addcontentsline{toc}{subsubsection}{#1}%
{\fontsize{11pt}{13pt}\entryHeadingFont #1} \hfill {\fontsize{10pt}{12pt}\entryDateFont #2}\\}

% \begin{entry}{dates}{title}
\newenvironment{cventry}[2]{\entryhead{#2}{#1}}{\entryspacing}

% \phdthesis{year}{title}{institute}
\newcommand{\phdthesis}[3]{%
\begin{cventry}{}{#2}
  Ph.D thesis. #3, #1.
\end{cventry}}

% \published[doi]{year}{title}{publisher}{authors}{venue}
\newcommand{\published}[6][]{%
\begin{cventry}{}{#3}
  #5, #2. \ifthenelse{\equal{#6}{}}{\textit{#4}}{In \textit{#6}}.
  \ifthenelse{\equal{#1}{}}{}{\par\textbf{\small\doilink{#1}}\\}
\end{cventry}}

% -----------------------------------------------------------------------------
% -- Extras

% Emphasise a keyword.
\newcommand{\keyword}[1]{\textbf{\color{keyword}#1}}

% 'itemize', but with less spacing.
\RequirePackage{enumitem}
\newenvironment{tightitemize}{\vspace{-\topsep}\begin{itemize}[leftmargin=*]\itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}
