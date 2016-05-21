\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2016/05/16 barrucadu's cv]

% Some of the files included in "extra-tex-files" have been edited by
% me, grep for "[barrucadu edit]".

% -----------------------------------------------------------------------------
% -- Document set-up

\LoadClass{deedy-resume}

\RequirePackage{ifthen}
\RequirePackage{etoolbox}

\title{Curriculum Vitae}

\addtolength{\textheight}{-2cm}

% -----------------------------------------------------------------------------
% -- Hyperlinks

\definecolor{linkcolour}{rgb}{0.1,0.3,0.45}

% \link[optional text]{link}
\newcommand*{\link}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {{\color{linkcolour}\href{#2}{#2}}}%
    {{\color{linkcolour}\href{#2}{#1}}}}

% \httplink[optional text]{link}
\newcommand*{\httplink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {{\color{linkcolour}\href{http://#2}{#2}}}%
    {{\color{linkcolour}\href{http://#2}{#1}}}}

% \githublink[optional text]{user}{repo}
\newcommand*{\githublink}[3][]{%
  \ifthenelse{\equal{#1}{}}%
    {{\color{linkcolour}\href{https://github.com/#2/#3}{github: #2/#3}}}%
    {{\color{linkcolour}\href{https://github.com/#2/#3}{#1}}}}

% \emaillink[optional text]{link}
\newcommand*{\emaillink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {{\color{linkcolour}\href{mailto:#2}{#2}}}%
    {{\color{linkcolour}\href{mailto:#2}{#1}}}}

% -----------------------------------------------------------------------------
% -- Header and footer

\newcommand{\makecvhead}{\namesection{\@firstname}{\@lastname}{}}

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