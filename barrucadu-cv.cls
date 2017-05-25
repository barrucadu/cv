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
\ProvidesClass{barrucadu-cv}[2016/05/16 barrucadu's cv class]

% Some of the files included in "extra-tex-files" have been edited by
% me, grep for "[barrucadu edit]".

% -----------------------------------------------------------------------------
% -- Document set-up

\RequirePackage{ifthen}
\RequirePackage{etoolbox}

% See the README for option documentation.

\newcommand{\@newoption}[1]{\newtoggle{#1}\DeclareOption{#1}{\toggletrue{#1}}}

\@newoption{anonymous}
\@newoption{lato}
\@newoption{textwidthline}
\@newoption{noline}

% \@newoption can't handle moreanonymous because it sets two flags.
\newtoggle{moreanonymous}
\DeclareOption{moreanonymous}{\toggletrue{moreanonymous}\toggletrue{anonymous}}

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

\newfontfamily{\FA}[Path=./fonts/fontawesome/]{FontAwesome}
\newcommand*{\faicon}[1]{{\csname faicon@#1\endcsname}}
\input{extra-tex-files/fontawesomesymbols-generic.tex}
\input{extra-tex-files/fontawesomesymbols-xeluatex.tex}

\RequirePackage[usenames,dvipsnames]{xcolor}

\definecolor{links}{rgb}{0.1,0.3,0.45}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}
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
    {{\color{links}\href{https://github.com/#2/#3}{github: #2/#3}}}%
    {{\color{links}\href{https://github.com/#2/#3}{#1}}}}

% \emaillink[optional text]{link}
\newcommand*{\emaillink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {{\color{links}\href{mailto:#2}{#2}}}%
    {{\color{links}\href{mailto:#2}{#1}}}}

% -----------------------------------------------------------------------------
% -- Header and footer

\def\@prenom{}
\def\@postnom{}

\newcommand{\fake}[1]{\leavevmode\hphantom{#1}}

% Switch from Raleway to Lato if lato option is set.
\newcommand{\@pnomfont}{\iftoggle{lato}{\lato{Hai}}{\raleway{ExtraLight}}}
\newcommand{\@fnamefont}{\iftoggle{lato}{\lato{Hai}}{\raleway{ExtraLight}}}
\newcommand{\@lnamefont}{\iftoggle{lato}{\lato{Lig}}{\raleway{Light}}}

\newcommand{\makecvhead}{%
\begin{center}%
\fontsize{20pt}{30pt}\@pnomfont\fake{\@postnom}\@prenom%
\hspace{10pt}%
\fontsize{40pt}{60pt}\@fnamefont\@firstname%
\hspace{10pt}%
\@lnamefont\@lastname%
\hspace{10pt}%
\fontsize{20pt}{30pt}\@pnomfont\@postnom\fake{\@prenom}%
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

\titlespacing*{\section}{0pt}{0pt}{0pt}
\newcommand{\sectionspace}{\vspace{8pt}}

% My website uses Raleway-ExtraLight here, but I think that looks too
% thin in the PDF. Lato-Lig looks basically the same in this context
% and is a tad thicker.
\newcommand{\headingstyle}{\color{headings}\fontsize{16pt}{24pt}\lato{Lig}\uppercase}

\newcommand{\@divlinewidth}{\iftoggle{textwidthline}{\textwidth}{\paperwidth}}

\newcommand{\@titleline}{\iftoggle{textwidthline}%
{\titlerule[0.5pt]}%
{\titleline{\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.5pt}}}}}

\titleformat{\section}{%
\sectionspace%
\iftoggle{noline}{}{\color{rules}\@titleline}%
\headingstyle}{}{0em}{}

% Starred sections don't get the overline.
\titleformat{name=\section,numberless}{\sectionspace\headingstyle}{}{0em}{}

% -----------------------------------------------------------------------------
% -- Personal details

% Note: these must define the same things as moderncv so that
% moderncvfooti works.

\RequirePackage{moderncvcollection}

\collectionnew{phones}
\collectionnew{socials}

\newcommand*{\prenominals}[1]{\def\@prenom{#1}}
\newcommand*{\postnominals}[1]{\def\@postnom{#1}}

\newcommand*{\@realfirstname}[1]{\def\@firstname{#1}}
\newcommand*{\@realfamilyname}[1]{\def\@lastname{#1}}
\newcommand*{\@realname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\@realemail}[1]{\def\@email{#1}}
\newcommand*{\@realhomepage}[1]{\def\@homepage{#1}}
\newcommand*{\@realphone}[2][fixed]{\collectionadd[#1]{phones}{#2}}
\newcommand*{\@realextrainfo}[1]{\def\@extrainfo{#1}}
\NewDocumentCommand{\@realaddress}{mG{}G{}}{\def\@addressstreet{#1}\def\@addresscity{#2}\def\@addresscountry{#3}}
\NewDocumentCommand{\@realsocial}{O{}O{}m}{%
  \ifthenelse{\equal{#2}{}}%
    {%
      \ifthenelse{\equal{#1}{linkedin}}{\collectionadd[linkedin]{socials}{\protect\httplink[#3]{www.linkedin.com/in/#3}}}{}%
      \ifthenelse{\equal{#1}{twitter}} {\collectionadd[twitter]{socials} {\protect\httplink[#3]{www.twitter.com/#3}}}    {}%
      \ifthenelse{\equal{#1}{github}}  {\collectionadd[github]{socials}  {\protect\httplink[#3]{www.github.com/#3}}}     {}%
    }
    {\collectionadd[#1]{socials}{\protect\httplink[#3]{#2}}}}

% If anonymous is on, discard all personal information other than pre- and
% postnominals.
\newcommand*{\firstname}[1]{%
\iftoggle{anonymous}%
{\@realfirstname{Mary}}%
{\@realfirstname{#1}}}

\newcommand*{\familyname}[1]{%
\iftoggle{anonymous}%
{\@realfamilyname{Sue}}%
{\@realfamilyname{#1}}}

\newcommand*{\name}[2]{%
\iftoggle{anonymous}%
{\@realname{Mary}{Sue}}%
{\@realname{#1}{#2}}}

\newcommand*{\email}[1]{%
\iftoggle{anonymous}%
{\@realemail{email@my-website.com}}%
{\@realemail{#1}}}

\newcommand*{\homepage}[1]{%
\iftoggle{anonymous}%
{\@realhomepage{www.my-website.com}}%
{\@realhomepage{#1}}}

\newcommand*{\phone}[2][fixed]{%
\iftoggle{anonymous}%
{\@realphone[#1]{(area) phone number}}%
{\@realphone[#1]{#2}}}

\newcommand*{\extrainfo}[1]{%
\iftoggle{anonymous}%
{\@realextrainfo{extra info}}%
{\@realextrainfo{#1}}}

\NewDocumentCommand{\address}{mG{}G{}}{%
\iftoggle{anonymous}%
{\@realaddress{city}{county}{country}}%
{\@realaddress{#1}{#2}{#3}}}

\NewDocumentCommand{\social}{O{}O{}m}{%
\iftoggle{anonymous}%
{\@realsocial[#1][#2]{username}}%
{\@realsocial[#1][#2]{#3}}}

% -----------------------------------------------------------------------------
% -- Entries

% Another website divergence, rather than use Merriweather-Black just
% stick to Lato-Bol. Merriweather just doesn't look nice in PDF form,
% not sure why as it looks very nice in Chrome.
\newcommand{\runsubsection}[1]{\color{subheadings}\fontsize{12pt}{12pt}\lato{Bol} #1 \normalfont}

\newcommand{\inlinemain}[1]{%
\color{subheadings}\fontsize{11pt}{13pt}\raleway{Medium} #1 \normalfont}

\newcommand{\inlineextra}[1]{%
\color{headings}\fontsize{10pt}{12pt}\raleway{Medium} #1 \normalfont}

\newcommand{\entryhead}[3]{%
\runsubsection{#1\ifthenelse{\equal{#2}{}}{}{,}}%
\inlinemain{#2}%
\inlineextra{#3\\}%
\color{primary}}

% \published{year}{title}{publisher}{authors}{venue}
\newcommand{\@published}[5]{%
\entryhead{#2}{}{}%
#4, #1. \ifthenelse{\equal{#5}{}}{\textit{#3}}{In \textit{#5}}.%
\sectionspace}

% \employed{dates}{title}{organisation}{location}{description}
\newcommand{\@employed}[5]{%
\entryhead{#3}{#2}{#1, #4.}%
#5%
\sectionspace}

% \begin{educated}{institute} degrees \end{educated}
\iftoggle{moreanonymous}
{\newenvironment{educated}[1]{\runsubsection{Some Institute\\}}{}}
{\newenvironment{educated}[1]{\runsubsection{#1\\}}{}}

% \degree{dates}{qualification}{grade}{description}
\newcommand{\degree}[4]{%
\inlinemain{#2}%
\inlineextra{#1\ifthenelse{\equal{#3}{}}{}{, #3}.\\}%
\color{primary}%
#4%
\sectionspace}

% \contribution{dates}{title}{name}{link}{description}
\newcommand{\@contribution}[5]{%
\entryhead{#3}{#2}{#1. \hfill #4}%
#5%
\sectionspace}

% \project{title}{link}{summary}{description}
\newcommand{\@project}[4]{%
\entryhead{#1}{#3}{\hfill #2}%
#4%
\sectionspace}

% If moreanonymous put in dummy values for identifying fields.
\newcommand{\published}[5]{%
\iftoggle{moreanonymous}%
{\@published{#1}{Some Publication}{#3}{Some Authors}{#5}}%
{\@published{#1}{#2}{#3}{#4}{#5}}}

\newcommand{\employed}[5]{%
\iftoggle{moreanonymous}%
{\@employed{#1}{#2}{Some Company}{#4}{#5}}%
{\@employed{#1}{#2}{#3}{#4}{#5}}}

\newcommand{\contribution}[5]{%
\iftoggle{moreanonymous}%
{\@contribution{#1}{#2}{Some OSS Project}{\httplink{www.example.com}}{#5}}%
{\@contribution{#1}{#2}{#3}{#4}{#5}}}

\newcommand{\project}[4]{
\iftoggle{moreanonymous}%
{\@project{Some Project}{\httplink{www.example.com}}{#3}{#4}}%
{\@project{#1}{#2}{#3}{#4}}}

% -----------------------------------------------------------------------------
% -- Extras

% Emphasise a keyword.
\newcommand{\keyword}{\textbf}

% 'itemize', but with less spacing.
\newenvironment{tightitemize}{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}
