\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2016/05/16 barrucadu's cv]

% Some of the files included in "extra-tex-files" have been edited by
% me, grep for "[barrucadu edit]".

% -----------------------------------------------------------------------------
% -- Document set-up

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{ifthen}
\RequirePackage{etoolbox}

\title{Curriculum Vitae}

\RequirePackage[hmargin=2cm, vmargin=0.75cm]{geometry}
\addtolength{\textheight}{-2cm}

% -----------------------------------------------------------------------------
% -- Fonts and Colours

\RequirePackage{fontspec}

\setmainfont[Path=fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path =
fonts/raleway/]{Raleway-ExtraLight}

\RequirePackage[usenames,dvipsnames]{xcolor}

\definecolor{links}{rgb}{0.1,0.3,0.45}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

% -----------------------------------------------------------------------------
% -- Hyperlinks

\RequirePackage{hyperref}

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
    {{\color{links}\href{https://github.com/#2/#3}{github: #2/#3}}}%
    {{\color{links}\href{https://github.com/#2/#3}{#1}}}}

% \emaillink[optional text]{link}
\newcommand*{\emaillink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {{\color{links}\href{mailto:#2}{#2}}}%
    {{\color{links}\href{mailto:#2}{#1}}}}

% -----------------------------------------------------------------------------
% -- Header and footer

\newcommand{\makecvhead}{%
\begin{center}%
\fontsize{40pt}{60pt}%
\fontspec[Path = fonts/lato/]{Lato-Hai}\selectfont\@firstname%
\hspace{10pt}%
\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont\@lastname%
\end{center}}

% All junk to make mocerncvfooti work.
\newcommand{\makecvfoot}{}
\newcommand*{\addressfont}{}
\newcommand*{\recomputefootlengths}{}
\newcommand*{\recomputecvfootlengths}{}
\newcommand*{\recomputeletterfootlengths}{}
\newcommand*{\makeletterfoot}{}
\newcommand*{\@initializelength}[1]{%
  \ifdefined#1
  \else%
    \newlength{#1}\fi%
  \setlength{#1}{0pt}}
\newcommand*{\@initializebox}[1]{%
  \ifdefined#1
    \savebox{#1}{}%
  \else%
    \newsavebox{#1}\fi}
\newcommand*{\@initializeif}[1]{\newif#1}
\definecolor{color0}{rgb}{0,0,0}
\definecolor{color1}{rgb}{0,0,0}
\definecolor{color2}{rgb}{0,0,0}
\definecolor{color3}{rgb}{0,0,0}
\newcommand*{\addresssymbol}       {}
\newcommand*{\mobilephonesymbol}   {}
\newcommand*{\fixedphonesymbol}    {}
\newcommand*{\faxphonesymbol}      {}
\newcommand*{\emailsymbol}         {}
\newcommand*{\homepagesymbol}      {}
\newcommand*{\linkedinsocialsymbol}{}
\newcommand*{\twittersocialsymbol} {}
\newcommand*{\githubsocialsymbol}  {}
\RequirePackage{moderncviconsawesome}
\RequirePackage{moderncvfooti}

\AtBeginDocument{%
  \makecvhead%
  \makecvfoot}

\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhf{}}
\pagestyle{plain}

% -----------------------------------------------------------------------------
% -- Section headings

\RequirePackage{titlesec}

\titlespacing*{\section}{0pt}{0pt}{0pt}
\newcommand{\sectionspace}{\vspace{8pt}}

\titleformat{\section}{%
\sectionspace%
\color{headings}%
\titlerule[.5pt]%
\scshape\fontspec[Path = fonts/lato/, LetterSpace=4pt]{Lato-Lig}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{}{0em}{}

% -----------------------------------------------------------------------------
% -- Personal details

% Note: these must define the same things as moderncv so that
% moderncvfooti works.

\RequirePackage{moderncvcollection}

\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}

\NewDocumentCommand{\address}{mG{}G{}}{\def\@addressstreet{#1}\def\@addresscity{#2}\def\@addresscountry{#3}}

\newcommand*{\email}[1]{\def\@email{#1}}

\newcommand*{\homepage}[1]{\def\@homepage{#1}}

\collectionnew{phones}
\newcommand*{\phone}[2][fixed]{\collectionadd[#1]{phones}{#2}}

\collectionnew{socials}
\NewDocumentCommand{\social}{O{}O{}m}{%
  \ifthenelse{\equal{#2}{}}%
    {%
      \ifthenelse{\equal{#1}{linkedin}}{\collectionadd[linkedin]{socials}{\protect\httplink[#3]{www.linkedin.com/in/#3}}}{}%
      \ifthenelse{\equal{#1}{twitter}} {\collectionadd[twitter]{socials} {\protect\httplink[#3]{www.twitter.com/#3}}}    {}%
      \ifthenelse{\equal{#1}{github}}  {\collectionadd[github]{socials}  {\protect\httplink[#3]{www.github.com/#3}}}     {}%
    }
    {\collectionadd[#1]{socials}{\protect\httplink[#3]{#2}}}}

\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% -----------------------------------------------------------------------------
% -- Entries

\newcommand{\runsubsection}[1]{%
\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

\newcommand{\inlinemain}[1]{%
\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}{\fontsize{11pt}{13pt}\selectfont #1} \normalfont}

\newcommand{\inlineextra}[1]{%
\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}{\fontsize{10pt}{12pt}\selectfont #1} \normalfont}

\newcommand{\entryhead}[3]{%
\runsubsection{#1}%
\inlinemain{\ifthenelse{\equal{#2}{}}{}{| #2}}%
\inlineextra{#3\\}%
\color{primary}}

% \published{year}{title}{publisher}{authors}{venue}
\newcommand{\published}[5]{%
\entryhead{#2}{}{}%
By #4, #1. In \textit{#5}.%
\sectionspace}

% \employed{dates}{title}{organisation}{location}{description}
\newcommand{\employed}[5]{%
\entryhead{#3}{#2}{#1, #4.}%
#5%
\sectionspace}

% \begin{educated}{institute} degrees \end{educated}
\newenvironment{educated}[1]{\runsubsection{#1\\}}{\sectionspace}

% \degree{dates}{qualification}{grade}{description}
\newcommand{\degree}[4]{%
\inlinemain{#2}%
\inlineextra{#1\ifthenelse{\equal{#3}{}}{}{, #3}.\\}%
\color{primary}%
#4}

% \contribution{dates}{title}{name}{link}{description}
\newcommand{\contribution}[5]{%
\entryhead{#3}{#2}{#1. \hfill #4}%
#5%
\sectionspace}

% \project{title}{link}{summary}{description}
\newcommand{\project}[4]{%
\entryhead{#1}{#3}{\hfill #2}%
#4%
\sectionspace}

% -----------------------------------------------------------------------------
% -- Extras

% Emphasise a keyword.
\newcommand{\technology}{\textbf}

% 'itemize', but with less spacing.
\newenvironment{tightitemize}{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}