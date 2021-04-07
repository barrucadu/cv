barrucadu/cv
============

My CV: https://www.barrucadu.co.uk/cv.pdf

Based heavily on [Deedy-Resume][] and [moderncv][].

[Deedy-Resume]: https://github.com/deedy/Deedy-Resume
[moderncv]: https://launchpad.net/moderncv

Usage
-----

```tex
\documentclass[a4paper]{barrucadu-cv}
```

It is intended that the CV be broken into sections, where each section
contains only one type of entry. Entries of the same kind look
consistent, but there is some variation between entries of different
types which may not look good if juxtaposed.

### Class Options

- `lato`: Use Lato for the name font, rather than Raleway.

- `textwidthline`: Draw the dividing lines between sections only as
  wide as the text, not the full page.

- `noline`: Don't draw dividing lines between sections.

### Personal details

Shown in the header of the first page:

```tex
\firstname{first name}
\familyname{family name}
```

Shown in the footer of every page:

```tex
\address{city}{country}
\email{email address}
\homepage{website url}
\linkedin{linkedin username}
\twitter{twitter username}
\github{github username}
```

All are required.

### Sectioning

```tex
\section{main section title}
\section*{main section title}
```

Creates a new section with the title text capitalised and a dividing
line drawn above it, which is omitted if the section is at the top of
a page. The starred variant never draws the line.

```tex
\subsection{name}
```

Creates a heading suitable for containing multiple entries involving
the same place (for example, multiple degrees at the same
institute).

### Entries

```tex
\phdthesis{year}{title}{institute}
```

```tex
\published{year}{title}{publisher}{authors}{venue}
```

If the "venue" field is set, it and not the publisher is shown; if
unset, the publisher is shown.

```tex
\entry[heading]{dates}{title}{description}
```

If the `[heading]` is unset, you should use a `\subsection` above.

```tex
\smallentry{name}{dates}{extra}{description}
```

Creates an entry where the name, dates, and extra are all in a single
line. The extra is aligned to the right.

### Miscellaneous

```tex
\link[optional text]{link}
\httplink[optional text]{link}
\githublink[optional text]{username}{repository}
\emaillink[optional text]{email address}
```

All produce a clickable link and, if the text is not given, display
the given link or email address. The default text for a github link is
"github: username/repository".

```tex
\keyword{word}
```

Emboldens a term.

```tex
\begin{tightitemize}
  \item item contents
\end{tightitemize}
```

A bulleted list environment using less space than the usual.

Dependencies
------------

Compiles with **XeTeX**.
