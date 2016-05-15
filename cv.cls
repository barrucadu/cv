\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2015/12/24 moderncv tweaks]

\LoadClass{moderncv}

\RequirePackage{ifthen}

%%% Fonts
\RequirePackage{fontspec}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[SmallCapsFont = Fontin SmallCaps]{Fontin}

%%% Page layout
\moderncvstyle{casual}
\moderncvcolor{blue}
\setlength{\hintscolumnwidth}{3cm}

\RequirePackage[big]{layaureo}

% PDF title
\title{Curriculum Vitae}

% Header and footer
\renewcommand{\makecvhead}{%
  \begin{center}%
    \namestyle{\@firstname\ \textsc{\@lastname}}%
  \end{center}}

\AtBeginDocument{%
  \makecvhead%
  \makecvfoot}

% Section headings
\RenewDocumentCommand{\section}{sm}{%
  \par\addvspace{2.5ex}%
  \phantomsection{}%
  \addcontentsline{toc}{section}{#2}%
  \cvitem[0ex]{\strut\raggedleft\raisebox{\baseletterheight}{\color{color1}\rule{\hintscolumnwidth}{0.33ex}}}{\strut\sectionstyle{\scshape#2}}%
  \par\nobreak\addvspace{1ex}\@afterheading}

\RenewDocumentCommand{\subsection}{sm}{%
  \par\addvspace{1ex}%
  \phantomsection{}%
  \addcontentsline{toc}{subsection}{#2}%
  \cvitem[0ex]{}{\strut\subsectionstyle{\bfseries#2}}%
  \par\nobreak\addvspace{.5ex}\@afterheading}%

%%% Hyperlinks
\AfterPreamble{%
  \definecolor{linkcolour}{rgb}{0.1,0.3,0.45}%
  \hypersetup{colorlinks,breaklinks,urlcolor=linkcolour,linkcolor=linkcolour}}

%%% Entries
\renewcommand*{\cventry}[7][.25em]{%
  \cvitem[#1]{\itshape#2}{%
    {\bfseries#3}%
    \ifthenelse{\equal{#4}{}}{}{, #4}%
    \ifthenelse{\equal{#5}{}}{}{, {\itshape#5}}.%
    \ifthenelse{\equal{#6}{}}{}{\hfill\href{#6}{#6}}%
    \strut%
    \ifx&#7&%
    \else{\newline{}\begin{minipage}[t]{\linewidth}\small#7\end{minipage}}\fi}}

% \published{year}{title}{publisher}{authors}{venue}
\newcommand{\published}[5]{\cventry{#3}{#1}{#2}{}{}{#4. In \textit{#5}.}}

% \employed{dates}{title}{organisation}{location}{description}
\newcommand{\employed}[5]{\cventry{#3}{#1}{#2}{#4}{}{#5}}

% \educated{dates}{level}{institute}{grade}{description}
\newcommand{\educated}[5]{\cventry{#3}{#1}{#2}{#4}{}{#5}}

% \contribution{dates}{title}{name}{url}{description}
\newcommand{\contribution}[5]{\cventry{#3}{#1}{#2}{}{#4}{#5}}

% \project{title}{url}{summary}{description}
\newcommand{\project}[4]{\cventry{#1}{#3}{}{}{#2}{#4}}
