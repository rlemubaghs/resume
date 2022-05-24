\ProvidesClass{resume}

%% Document settings and packages
\LoadClass[11pt, letterpaper]{article}
\usepackage[top=1.25cm,bottom=1.25cm,left=1cm,right=1cm,marginparwidth=1.75cm]{geometry}
\usepackage[english]{babel}
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage[dvipsnames]{xcolor}
\usepackage{ifthen}

%% Layout
\pagenumbering{gobble}

%% Define
\def \name#1{\def\@name{#1}}
\def \@name {}
\def \addressSep {$\diamond$}
\def\namesize{\huge}
\def\addressskip{\smallskip}
\def\sectionlineskip{\medskip}
\def\nameskip{\smallskip}
\def\sectionskip{\medskip}

\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

%% Print contact information
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

\def \printname {
  \begingroup
    \hfil{\namesize\bf \@name}\hfil
    \nameskip\break
  \endgroup
}

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document
  \printname
  \printaddress{\@addressone}
  \@ifundefined{@addressone}{}{
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{
    \printaddress{\@addressthree}}
\sectionlineskip
\sectionlineskip
}

%% Section formatting
\newenvironment{sections}[1]{
  \sectionlineskip
  \hrule width \hsize \kern 0.5mm \hrule width \hsize height 0.4pt
  \sectionskip{\bf \Large #1}
  \sectionlineskip
  \begin{list}{}{
    \setlength{\leftmargin}{1em}
  }
  \item[]
}{
  \end{list}
  \sectionlineskip
}
