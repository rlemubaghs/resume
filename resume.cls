\ProvidesClass{resume}

%% Document settings and packages
\LoadClass[11pt, letterpaper]{article}
\usepackage[top=1.25cm,bottom=1.25cm,left=1cm,right=1cm,marginparwidth=1.75cm]{geometry}
\usepackage[english]{babel}
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage[dvipsnames]{xcolor}
\usepackage{ifthen}
\usepackage{enumitem}
\usepackage{graphicx}
\usepackage{eso-pic}

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
\newlength{\profilepicturesize}
\setlength{\profilepicturesize}{2.2cm}

\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax
\let \@profilepicture \relax

\def \profilepicture #1{
  \def \@profilepicture {#1}
}

\def \printprofilepicture {
  \@ifundefined{@profilepicture}{}{
    \AddToShipoutPictureFG*{
      \AtTextUpperLeft{
        \put(\LenToUnit{\textwidth-\profilepicturesize},\LenToUnit{-\profilepicturesize}){
          \makebox[0pt][l]{
            \begingroup
              \setlength{\fboxsep}{0pt}
              \setlength{\fboxrule}{0.8pt}
              \fbox{\includegraphics[width=\profilepicturesize,height=\profilepicturesize]{\@profilepicture}}
            \endgroup
          }
        }
      }
    }
  }
}

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
  \printprofilepicture
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
  \hrule width \hsize
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

\newenvironment{resumeitemize}{
  \begin{itemize}[leftmargin=1.2em,itemsep=0em,topsep=0.1em,parsep=0em,partopsep=0em]
}{
  \end{itemize}
}
