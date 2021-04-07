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
\ProvidesClass{barrucadu-cv}[2019/06/29 barrucadu's cv class]

% -----------------------------------------------------------------------------
% -- Document set-up

\RequirePackage{ifthen}
\RequirePackage{etoolbox}

% See the README for option documentation.

\newcommand{\@newoption}[1]{\newtoggle{#1}\DeclareOption{#1}{\toggletrue{#1}}}

\@newoption{lato}
\@newoption{textwidthline}
\@newoption{noline}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\title{Curriculum Vitae}

\RequirePackage[vmargin=0.75cm]{geometry}
\addtolength{\textheight}{-2cm}

% -----------------------------------------------------------------------------
% -- Fonts and Colours

\RequirePackage{fontspec}

\setmainfont[Path=fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path=fonts/raleway/]{Raleway-ExtraLight}

\NewDocumentCommand{\lato}{m}{\fontspec[Path=fonts/lato/]{Lato-#1}\selectfont}
\NewDocumentCommand{\raleway}{m}{\fontspec[Path=fonts/raleway/]{Raleway-#1}\selectfont}

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
    {{\color{links}\href{http://#2}{#2}}}%
    {{\color{links}\href{http://#2}{#1}}}}

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

% -----------------------------------------------------------------------------
% -- Header and footer

\newcommand{\fake}[1]{\leavevmode\hphantom{#1}}

% Switch from Raleway to Lato if lato option is set.
\newcommand{\@pnomfont}{\iftoggle{lato}{\lato{Hai}}{\raleway{ExtraLight}}}
\newcommand{\@fnamefont}{\iftoggle{lato}{\lato{Hai}}{\raleway{ExtraLight}}}
\newcommand{\@lnamefont}{\iftoggle{lato}{\lato{Lig}}{\raleway{Light}}}

\newcommand{\makecvhead}{%
  \begin{center}%
    \fontsize{40pt}{60pt}%
    \@fnamefont\@firstname%
    \hspace{10pt}%
    \@lnamefont\@lastname%
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

\titlespacing*{\section}{0pt}{0pt}{4pt}
\newcommand{\sectionspace}{\vspace{8pt}}

% My website uses Raleway-ExtraLight here, but I think that looks too
% thin in the PDF. Lato-Lig looks basically the same in this context
% and is a tad thicker.
\newcommand{\headingstyle}{\fontsize{11pt}{13pt}\lato{Lig}\uppercase}

\newcommand{\@divlinewidth}{\iftoggle{textwidthline}{\textwidth}{\paperwidth}}

% magic from https://tex.stackexchange.com/a/61643
\newcommand\disappearingrule{%
  \par%
  \vskip5pt%
  \leaders\vrule width \textwidth\vskip0.5pt%
  \nointerlineskip%
  \vskip5pt%
}

\titleformat{\section}{%
\sectionspace%
\iftoggle{noline}{}{\color{rules}\disappearingrule\color{primary}}%
\vspace{4pt}%
\headingstyle}{}{0em}{}

% Starred sections don't get the overline.
\titleformat{name=\section,numberless}{\sectionspace\headingstyle}{}{0em}{}

\titlespacing*{\subsection}{0pt}{0pt}{0pt}
\titleformat{\subsection}{\fontsize{12pt}{12pt}\lato{Bol}}{}{0em}{}

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

\newcommand{\inlinemain}[1]{%
\fontsize{11pt}{13pt}\raleway{Medium} #1 \normalfont}

\newcommand{\inlineextra}[1]{%
\fontsize{10pt}{12pt}\raleway{Medium} #1 \normalfont}

\newcommand{\entryhead}[3]{%
\ifthenelse{\equal{#1}{}}{}{\subsection{#1}}%
\inlinemain{#2}%
\inlineextra{#3}%
\ifthenelse{\equal{#2}{}}{}{\\}%
\color{primary}}

\newcommand{\smallentryhead}[2]{%
\subsection{#1\inlineextra{#2}}%
\color{primary}}

% \phdthesis{year}{title}{institute}
\newcommand{\phdthesis}[3]{%
\entryhead{#2}{}{}%
Ph.D thesis. #3, #1.%
\sectionspace}

% \published{year}{title}{publisher}{authors}{venue}
\newcommand{\published}[5]{%
\entryhead{#2}{}{}%
#4, #1. \ifthenelse{\equal{#5}{}}{\textit{#3}}{In \textit{#5}}.%
\sectionspace}

% \entry[heading]{dates}{title}{description}
\newcommand{\entry}[4][]{%
\entryhead{#1}{#3}{\hfill #2}%
#4%
\sectionspace}

% \smallentry{name}{dates}{extra}{description}
\newcommand{\smallentry}[4]{%
\smallentryhead{#1}{\hfill #2}%
\ifthenelse{\equal{#3}{}}{}{\textbf{\small #3}\\}%
#4%
\sectionspace}

% -----------------------------------------------------------------------------
% -- Extras

% Emphasise a keyword.
\newcommand{\keyword}[1]{\textbf{\color{keyword}#1}}

% 'itemize', but with less spacing.
\RequirePackage{enumitem}
\newenvironment{tightitemize}{\vspace{-\topsep}\begin{itemize}[leftmargin=*]\itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}
