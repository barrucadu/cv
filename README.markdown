barrucadu/cv
============

A **one-page** CV template in **XeTeX** with a focus for people in the
computer science / tech industry. Based heavily on [Deedy-Resume][]
and [moderncv][].

[Deedy-Resume]: https://github.com/deedy/Deedy-Resume
[moderncv]:     https://launchpad.net/moderncv

This template aims to be a good, clean, base for any CV.

Usage
-----

```tex
\documentclass[a4paper]{cv}
```

It is intended that the CV be broken into sections, where each section
contains only one type of entry. Entries of the same kind look
consistent, but there is some variation between entries of different
types which may not look good if juxtaposed.

### Anonymous mode

```tex
\documentclass[a4paper, anonymous]{cv}
```

Useful for sharing on reddit. This substitutes placeholders for:

- all the personal details (except pre- and postnominals)
- educational institution names
- publication titles and authors
- employer names
- open source project names and URLs
- personal project names and URLs

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
line drawn above it. The starred variant does not draw the line, which
is useful for a section starting at top of a page with nothing before
it.

### Entries

```tex
\published{year}{title}{publisher}{authors}{venue}
```

The `\published` entry is geared towards conference/workshop
submissions in requiring a presentation venue.

```tex
\employed{dates}{title}{organisation}{location}{description}
\contribution{dates}{title}{project name}{link}{description}
\project{title}{link}{very short summary}{description}

\begin{educated}{institute name}
  \degree{dates}{qualification}{grade}{description}
\end{educated}
```

As it is common to receive multiple qualifications from the same
institute, this is different to the rest of the entries. An
environment is used to only typeset the institution name once.

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
