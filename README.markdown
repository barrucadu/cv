barrucadu/cv
============

A **one-page** CV template in **XeTeX** with a focus for people in the
computer science / tech industry. Based heavily on [Deedy-Resume][]
and [moderncv][]. See [my compiled CV][compiled].

This template aims to be a good, clean, base for any CV.

[Deedy-Resume]: https://github.com/deedy/Deedy-Resume
[moderncv]:     https://launchpad.net/moderncv
[compiled]:     https://www.barrucadu.co.uk/cv.pdf

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

```tex
\prenominals{prenominals}
\postnominals{postnominals}
\firstname{firstname}
\familyname{familyname}
\name{firstname}{familyname}
```

The header of the first page contains the name, centred, with the pre-
and postnominals on either side. The pre- and postnominals do not
count towards the centering.

```tex
\email{email address}
\homepage{website url}
\phone[fixed OR mobile]{number}
\extrainfo{any extra information}
\address{city}{county}{country}
\social[linkedin OR github OR twitter]{username}
```

The rest of the personal details make up the footer, which appears on
every page. The email address, homepage, and social media accounts are
hyperlinked.

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

All required tex files and fonts should be present in extra-tex-files
and fonts: if this isn't enough open an issue!
