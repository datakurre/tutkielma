%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tutkielma.cls by Asko Soukka <asko.soukka@iki.fi>.
%
% Based on and inspired by gradu2.cls originally written
% by Antti-Juhani Kaijanaho and subsequently modified
% by Matthieu Weber and Antti-Juhani Kaijanaho.

\def\filedate{2006/11/28}
\def\fileversion{1.0}
\def\fileinfo{JYU/IT/CS Thesis}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tutkielma}[\filedate\space\fileversion\space\fileinfo]
% http://tex.stackexchange.com/questions/147243/a-class-with-default-language-settings
\RequirePackage{etoolbox}
\preto\@classoptionslist{english,finnish}
\typeout{tutkielma <\filedate:\fileversion> - Jyväskylän yliopiston Informaatioteknologian tiedekunnan Tietojenkäsittelytieteiden laitoksen opinnäytteille}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Layout
%

\LoadClass[a4paper,12pt]{report}
% \LoadClass[a4paper,12pt,twoside]{report}
\RequirePackage{everyshi}[1994/12/09]
\RequirePackage{mathpazo}
\RequirePackage[left=30mm,right=30mm,top=30mm,bottom=25mm,foot=12pt]{geometry}
\RequirePackage{microtype}
\RequirePackage{setspace}

\singlespacing

\newcommand{\tablefontsize}{\footnotesize}
\newcommand{\quotefontsize}{\footnotesize}
\newcommand{\examplefontsize}{\footnotesize}
\newcommand{\tablespacing}{\singlespacing}
\newcommand{\quotespacing}{\singlespacing}
\newcommand{\examplespacing}{\singlespacing}
\newcommand{\captionfontsize}{\footnotesize}

\setlength{\parindent}{5ex}

\setlength{\rightmargin}{\z@}
\setlength{\leftmargini}{5ex}
\setlength{\leftmarginii}{5ex}
\setlength{\leftmarginiii}{5ex}
\setlength{\leftmarginiv}{5ex}
\setlength{\leftmarginv}{5ex}
\setlength{\leftmarginvi}{5ex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Language
%

\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage[utf8]{inputenc}
\RequirePackage{babel}
\RequirePackage{iflang}

\def\myabstractname{Tiivistelm\"a}
\def\mykeywordsname{Asiasanat}
\def\mytableofcontentsname{Sis\"allys}
\def\myexamplename{Esimerkki}
\def\myfigurename{Kuvio}
\def\mytablename{Taulukko}
\def\mybibname{L\"ahteet}
\def\mysectionname{Luku}
\def\myappendixname{Liite}
\def\mysupervisorname{Ohjaaja}
\def\myforeignsupervisorname{Supervisor}
\def\mysupervisorsname{Ohjaajat}
\def\myforeignsupervisorsname{Supervisors}
\def\myforeignabstractname{Abstract}
\def\myforeignkeywordsname{Keywords}

\def\mylastsep{ja}
\def\mypageabbrv{s.}
\def\mypagesabbrv{s.}
\def\myforeignpagesabbrv{p.}

\def\tutkielma@title{Tutkielman otsikko}
\def\tutkielma@foreigntitle{The title of the thesis}
\def\tutkielma@titlesecond{Aliotsikko}
\def\tutkielma@author{Tutkielman kirjoittaja}
\def\tutkielma@date{\myday.\mymonth.\myyear}
\def\tutkielma@year{\myyear}
\def\tutkielma@location{Jyv\"askyl\"a}
\def\tutkielma@university{Jyv\"askyl\"an yliopisto}
\def\tutkielma@foreignuniversity{University of Jyv\"askyl\"a}
\def\tutkielma@department{Tietojenk\"asittelytieteiden laitos}
\def\tutkielma@supervisor{Tutkielman ohjaaja}
\def\tutkielma@subject{Tietoj\"arjestelm\"atieteen}
\def\tutkielma@type{pro gradu -tutkielma}
\def\tutkielma@foreigntype{Masters thesis}
\def\tutkielma@version{}
\def\tutkielma@note{}
\def\tutkielma@keywords{Luettele, t\"ah\"an, avain, sanat}
\def\tutkielma@foreignkeywords{Put, your, keywords, here}

\IfLanguageName{finnish}{%
  \def\mybibliographystyle{tutkielma}%
}{%
  \def\mybibliographystyle{tutkielma.en}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Date
%

\def\myday{\the\day}
\def\mymonth{\the\month}
\def\myyear{\the\year}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bibliography
%

\RequirePackage{tocbibind}
\RequirePackage[longnamesfirst,sort]{natbib}
\bibpunct[,~]{(}{)}{ ja}{a}{,}{,~}

\setlength{\bibhang}{5ex}
\setlength{\bibsep}{\z@}

\RequirePackage[hyphens]{url}
\urlstyle{same}

\bibliographystyle{\mybibliographystyle}

\let\tutkielma@thebibliography\thebibliography
\def\thebibliography#1{%
  \addtocontents{toc}{\protect\contentsline{space}{}{}{}}%
  \def\refname{\texorpdfstring{\uppercase{\mybibname}}{\mybibname}}%
  \def\bibname{\texorpdfstring{\uppercase{\mybibname}}{\mybibname}}%
  \tutkielma@thebibliography{#1}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page style
%

\RequirePackage{fancyhdr}
\pagestyle{fancyplain}

\fancyhead[C]{\thepage}
\fancyhead[L,R]{}
% \fancyhead[LE,RO]{\thepage}
% \fancyhead[CE,RE,CO,LO]{}
\fancyfoot{}

\renewcommand{\headrulewidth}{\z@}
\renewcommand{\footrulewidth}{\z@}

\def\triggerappendix{0}
\def\triggerschaptertoc{1}
\newcounter{appendix}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options
\renewcommand{\title}[1]{%
  \gdef\tutkielma@title{#1}
}
\newcommand{\foreigntitle}[1]{%
  \gdef\tutkielma@foreigntitle{#1}
}
\newcommand{\titlesecond}[1]{%
  \gdef\tutkielma@titlesecond{#1}
}
\newcommand{\foreignkeywords}[1]{%
    \gdef\tutkielma@foreignkeywords{#1}
}
\def\tutkielma@authors{}
\def\tutkielma@authorfs{}
\newcounter{tutkielma@authorcount}
\renewcommand{\author}[3]{%
  \addtocounter{tutkielma@authorcount}{1}
  \ifnum \value{tutkielma@authorcount} = 2
    \@cons\tutkielma@authors{\tutkielma@author}
    \@cons\tutkielma@authorfs{\tutkielma@authorf}
  \fi
  \ifnum \value{tutkielma@authorcount} > 2
    \@cons\tutkielma@authors{,~}
    \@cons\tutkielma@authors{\tutkielma@author}
    \@cons\tutkielma@authorfs{;~}
    \@cons\tutkielma@authorfs{\tutkielma@authorf}
  \fi
  \gdef\tutkielma@author{#1 #3}
  \setbox0=\hbox{#2}
  \ifnum \wd0 = 0 \gdef\tutkielma@authorf{#3, #1}
  \else \gdef\tutkielma@authorf{#3, #1 #2}
  \fi
}
\def\tutkielma@supervisorfs{}
\newcounter{tutkielma@supervisorcount}
\newcommand{\supervisor}[2]{%
  \addtocounter{tutkielma@supervisorcount}{1}
  \ifnum \value{tutkielma@supervisorcount} = 2
    \@cons\tutkielma@supervisorfs{\tutkielma@supervisorf}
  \fi
  \ifnum \value{tutkielma@supervisorcount} > 2
    \@cons\tutkielma@supervisorfs{;~}
    \@cons\tutkielma@supervisorfs{\tutkielma@supervisorf}
  \fi
  \gdef\tutkielma@supervisorf{#2, #1}
}
\newcommand{\location}[1]{%
  \gdef\tutkielma@location{#1}
}
\newcommand{\university}[1]{%
  \gdef\tutkielma@university{#1}
}
\newcommand{\foreignuniversity}[1]{%
  \gdef\tutkielma@foreignuniversity{#1}
}
\newcommand{\department}[1]{%
  \gdef\tutkielma@department{#1}
}
\newcommand{\subject}[1]{%
  \gdef\tutkielma@subject{#1}
}
\newcommand{\type}[1]{%
  \gdef\tutkielma@type{#1}
}
\newcommand{\foreigntype}[1]{%
  \gdef\tutkielma@foreigntype{#1}
}
\newcommand{\version}[1]{%
  \gdef\tutkielma@version{#1}
}
\newcommand{\note}[1]{%
  \gdef\tutkielma@note{#1}
}
\newcommand{\keywords}[1]{%
  \gdef\tutkielma@keywords{#1}
}
\newcommand{\fixdate}[3]{%
  \gdef\myday{#1}
  \gdef\mymonth{#2}
  \gdef\myyear{#3}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title page
%

\renewcommand{\maketitle}{%
  \thispagestyle{empty}
  \renewcommand\Large{\@setfontsize\Large{16}{16}}
  \begin{singlespace}%
    \mbox{}\vfill%
    \ifnum \value{tutkielma@authorcount} < 2%
      \centerline{\tutkielma@author}%
    \else%
      \centerline{%
        \tutkielma@authors%
        ~\mylastsep~\tutkielma@author%
      }%
    \fi%
    \begin{onehalfspace}%
    \begin{center}%
    \Large\textbf{%
      \MakeUppercase{\tutkielma@title}}%
    \end{center}%
    \begin{center}%
    \Large\textbf{%
      \MakeUppercase{\tutkielma@titlesecond}}%
    \end{center}%
    \end{onehalfspace}%
    \newcommand{\tablefontsizeorig}{\tablefontsize}
    \newcommand{\tablespacingorig}{\tablespacing}
    \renewcommand{\tablefontsize}{\tablefontsizeorig}
    \renewcommand{\tablespacing}{\tablespacingorig}
    \vfill%
    \begin{center}%
      \includegraphics[height=2.7cm]{kuviot/logo.jpg}\par%
      \MakeUppercase{\tutkielma@university}\par%
      \MakeUppercase{\tutkielma@department}\par%
      \tutkielma@year\par%
    \end{center}%
  \end{singlespace}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract page
\RequirePackage{totpages}
\newlength{\keywordswidth}
\renewenvironment{abstract}{%
  \chapter*{\myabstractname}
  \thispagestyle{empty}
  \ifnum \value{tutkielma@authorcount} < 2
    \tutkielma@authorf\\
    \tutkielma@title\\
  \else
    \tutkielma@authorfs;~\tutkielma@authorf\\
    \tutkielma@title\\
%   \setbox0=\hbox{\tutkielma@title~/~\tutkielma@authors~\mylastsep~\tutkielma@author}
%   \ifnum \wd0 > \hsize \tutkielma@title\\
%   \else \tutkielma@title~/~\tutkielma@authors~\mylastsep~\tutkielma@author\\
%   \fi
  \fi
  \ifnum \value{tutkielma@supervisorcount} = 1
    \mysupervisorname: \tutkielma@supervisorf\\
  \fi
  \ifnum \value{tutkielma@supervisorcount} > 1
    \mysupervisorsname: \tutkielma@supervisorfs;~\tutkielma@supervisorf\\
  \fi
  \tutkielma@location:~\tutkielma@university,~\myyear,~\ref{TotPages}~\mypagesabbrv\\
  \tutkielma@type
  \par\addvspace{15pt}
}{%
\addvspace{15pt}\par
\noindent\mykeywordsname:~\tutkielma@keywords
% \addvspace{26pt}\par
% \setlength{\keywordswidth}{\hsize}
% \setbox0=\hbox{\mykeywordsname:\hskip 5ex}
% \addtolength{\keywordswidth}{-\wd0}
% \addtolength{\keywordswidth}{-2.5pt}
% \noindent\box0\parbox[t][][t]{\keywordswidth}{\tutkielma@keywords}
}
\newenvironment{foreignabstract}{%
  \chapter*{\myforeignabstractname}
  \thispagestyle{empty}
  \ifnum \value{tutkielma@authorcount} < 2
    \tutkielma@authorf\\
    \tutkielma@foreigntitle\\
  \else
    \tutkielma@authorfs;~\tutkielma@authorf\\
    \tutkielma@foreigntitle\\
%   \setbox0=\hbox{\tutkielma@foreigntitle~/~\tutkielma@authors~\mylastsep~\tutkielma@author}
%   \ifnum \wd0 > \hsize \tutkielma@foreigntitle\\
%   \else \tutkielma@foreigntitle~/~\tutkielma@authors~\mylastsep~\tutkielma@author\\
%   \fi
  \fi
  \ifnum \value{tutkielma@supervisorcount} = 1
    \myforeignsupervisorname: \tutkielma@supervisorf\\
  \fi
  \ifnum \value{tutkielma@supervisorcount} > 1
    \myforeignsupervisorsname: \tutkielma@supervisorfs;~\tutkielma@supervisorf\\
  \fi
  \tutkielma@location:~\tutkielma@foreignuniversity,~\myyear,~\ref{TotPages}~\myforeignpagesabbrv\\
  \tutkielma@foreigntype
  \par\addvspace{15pt}
}{%
\addvspace{15pt}\par
\noindent\myforeignkeywordsname:~\tutkielma@foreignkeywords
% \setlength{\keywordswidth}{\hsize}
% \setbox0=\hbox{\myforeignkeywordsname:\hskip 5ex}
% \addtolength{\keywordswidth}{-\wd0}
% \addtolength{\keywordswidth}{-2.5pt}
% \noindent\box0\parbox[t][][t]{\keywordswidth}{\tutkielma@foreignkeywords}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table of contents
%

\renewcommand\@dotsep{0.1}
\renewcommand\tableofcontents{%
  \gdef\triggerschaptertoc{0}%
  \chapter*{\mytableofcontentsname}
  \pdfbookmark{\mytableofcontentsname}{contents}
  \thispagestyle{empty}%
  \begin{singlespace}%
    \@starttoc{toc}%
  \end{singlespace}%
  \thispagestyle{empty}%
}

\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1 > \c@tocdepth \else%
    \vskip \z@ \@plus.2\p@ {%
      \leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip%
      \parindent #2\relax\@afterindenttrue%
      \interlinepenalty\@M%
      \leavevmode%
      \@tempdima #3\relax%
      \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip%
      {#4}\nobreak%
      \leaders\hbox{$\m@th%
         \mkern \@dotsep mu\hbox{.}\mkern \@dotsep%
      mu$}\hfill%
      \nobreak%
      \setbox0=\hbox{#5}%
      \hb@xt@\wd0{\hfil\normalfont \normalcolor #5}%
      \par%
    }%
  \fi%
}

\def\@tocline#1#2#3#4#5{%
  \ifnum #1 > \c@tocdepth \else%
    \vskip \z@ \@plus.2\p@ {%
      \leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip%
      \parindent #2\relax\@afterindenttrue%
      \interlinepenalty\@M%
      \leavevmode%
      \@tempdima #3\relax%
      \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip%
      {#4}\nobreak%
      \par%
    }%
  \fi%
}

\newcommand*\l@space{\addvspace{\baselineskip}}
\newcommand*\l@schapter{\@tocline{\z@}{\z@}{4.5ex}}
\renewcommand*\l@chapter{\@dottedtocline{\z@}{\z@}{4.5ex}}
\renewcommand*\l@section{\@dottedtocline{\z@}{4.5ex}{6ex}}
\renewcommand*\l@subsection{\@dottedtocline{\z@}{10.5ex}{7.5ex}}
\newcommand*\l@appendix{\@dottedtocline{\z@}{\z@}{\z@}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Appendices
%

\renewcommand\appendix{%
  \clearpage%
  \gdef\triggerappendix{1}%
  \gdef\@chapapp{\appendixname}%
  \fancyhead[LE,RO]{\MakeUppercase{\appendixname}~\theappendix}%
  \renewcommand \theHexample{\theappendix.\@arabic\c@example}
  \renewcommand \theHfigure{\theappendix.\@arabic\c@figure}
  \renewcommand \theHtable{\theappendix.\@arabic\c@table}
  \renewcommand \theHsubfigure{\theappendix.\thefigure.\arabic{subfigure}}
}
\addtolength{\headheight}{2.5pt}
\providecommand*{\toclevel@appendix}{0}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Headlines
%

\def\@chapter[#1]#2{%
  \ifnum \triggerappendix = 1%
    \ifnum \c@secnumdepth > \m@ne
      \refstepcounter{chapter}%
      \refstepcounter{appendix}%
      \ifnum \theappendix = 1%
        \addtocontents{toc}{\protect\contentsline{space}{}{}{}} %
      \fi %
      \typeout{\@chapapp\space\thechapter.}%
      \addcontentsline{toc}{appendix}{%
        \protect\texorpdfstring{\uppercase{\appendixname}}{\appendixname}~%
        \theappendix.~#1%
      }%
    \else
      \addcontentsline{toc}{appendix}{#1}%
    \fi
  \else
    \ifnum \c@secnumdepth > \m@ne
      \refstepcounter{chapter}%
      \typeout{\@chapapp\space\thechapter.}%
      \addtocontents{toc}{\protect\contentsline{space}{}{}{}}%
      \addcontentsline{toc}{chapter}{%
        \protect\numberline{\thechapter}\texorpdfstring{\uppercase{#1}}{#1}%
      }%
    \else
      \addtocontents{toc}{\protect\contentsline{space}{}{}{}}%
      \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{#1}}{#1}}%
    \fi
  \fi
  \chaptermark{#1}%
  \@makechapterhead{#2}%
  \@afterheading%
}
\def\@makechapterhead#1{%
  % \ifnum \thechapter = 1 \thispagestyle{empty} \fi%
  {%
    \vspace*{5.7cm}%
    \parindent \z@ \raggedright%
    \fontsize{16}{18} \bfseries%
    \ifnum \triggerappendix = 0 %
      \ifnum \c@secnumdepth > \m@ne \thechapter \hskip 2.5ex \fi%
    \fi %
    \MakeUppercase{#1}%
  }%
  \par\addvspace{26pt}%
}
\def\@schapter#1{%
  \ifnum \triggerschaptertoc = 1%
    \addcontentsline{toc}{schapter}{\texorpdfstring{\uppercase{#1}}{#1}}%
  \fi%
  \@makeschapterhead{#1}%
  \@afterheading%
}
\def\@makeschapterhead#1{%
  {%
    \parindent \z@ \raggedright \interlinepenalty \@M%
    \large \bfseries \MakeUppercase{#1}%
  }%
  \par\addvspace{26pt}%
}

\def\@seccntformat#1{\csname the#1\endcsname \hskip 1ex}

\renewcommand\section{\@startsection{section}%
  {1}{\z@}{-26pt}{26pt}{\normalfont \large \bfseries}%
}
\renewcommand\subsection{\@startsection{subsection}%
  {2}{\z@}{-26pt}{26pt}{\normalfont \normalsize \bfseries}%
}
\renewcommand\subsubsection{\@startsection{subsubsection}%
  {3}{\z@}{-26pt}{26pt}{\normalfont \normalsize \bfseries}%
}
\renewcommand\paragraph{\@startsection{paragraph}%
  {4}{\z@}{-26pt}{26pt}{\normalfont \normalsize}%
}
\renewcommand\subparagraph{\@startsection{subparagraph}%
  {5}{\z@}{-26pt}{26pt}{\normalfont \normalsize}%
}

% \newcommand \secref[2][] {\MakeUppercase{\mysectionname}~\ref{#2}#1}

\newcommand \secref[1][] {%
  \def\relayarg{{#1}}%
  \secrefr%
}
\newcommand \secrefr[2][default] {%
  \setbox0=\hbox{#1}%
  \setbox1=\hbox{default}%
  \ifnum \wd0 = 0 (\relayarg\ \MakeUppercase{\mysectionname}~\ref{#2})%
  \else%
    \ifnum \wd0 = \wd1 (\MakeUppercase{\mysectionname}~\ref{#2}\relayarg)%
    \else (\relayarg\ \MakeUppercase{\mysectionname}~\ref{#2}#1)%
    \fi%
  \fi%
}

\newcommand \appxref[1][] {%
  \def\relayarg{{#1}}%
  \appxrefr%
}
\newcommand \appxrefr[2][default] {%
  \setbox0=\hbox{#1}%
  \setbox1=\hbox{default}%
  \ifnum \wd0 = 0 (\relayarg\ \MakeUppercase{\myappendixname}~\ref{#2})%
  \else%
    \ifnum \wd0 = \wd1 (\MakeUppercase{\myappendixname}~\ref{#2}\relayarg)%
    \else (\relayarg\ \MakeUppercase{\myappendixname}~\ref{#2}#1)%
    \fi%
  \fi%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lists and quotes
%

% Customized from: http://www.math.mcgill.ca/rags/texmacros/indent.sty
\renewenvironment{quote}{%
  \quotefontsize%
  \quotespacing%
  \addvspace{26pt}%
  \par%
  \advance\linewidth -\leftmargin%
  \advance\linewidth -\rightmargin%
  \advance\@totalleftmargin\leftmargin%
  \@setpar{{\@@par}}%
  \parshape 1 \@totalleftmargin \linewidth%
  \noindent \ignorespaces%
}{\par \addvspace{26pt}}

% Hooked enumerate, itemize and description
% from: http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/tweaklist.sty

\def\enumhook{}
\def\enumhooki{}
\def\enumhookii{}
\def\enumhookiii{}
\def\enumhookiv{}
\def\itemhook{}
\def\itemhooki{}
\def\itemhookii{}
\def\itemhookiii{}
\def\itemhookiv{}
\def\descripthook{}
\def\enumerate{%
%  \quotefontsize
%  \quotespacing
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}%
          \enumhook \csname enumhook\romannumeral\the\@enumdepth\endcsname}%
  \fi}
\def\itemize{%
%  \quotefontsize
%  \quotespacing        
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}%
        \itemhook \csname itemhook\romannumeral\the\@itemdepth\endcsname}%
  \fi}
\renewenvironment{description}
                 {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                          \let\makelabel\descriptionlabel\descripthook}}
                 {\endlist}

% \renewcommand{\enumhook}{\setlength{\topsep}{26pt}%
%   \setlength{\itemsep}{11pt}}

% \renewcommand{\itemhook}{\setlength{\topsep}{26pt}%
%   \setlength{\itemsep}{11pt}}

\renewcommand{\enumhook}{\setlength{\topsep}{11pt}%
  \setlength{\itemsep}{11pt}}

% \renewcommand{\enumhook}{\setlength{\topsep}{\z@}%
%  \setlength{\itemsep}{\z@}}

\renewcommand{\itemhook}{\setlength{\topsep}{1em}%
  \setlength{\itemsep}{0em}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Examples, Figures and Tables
%

\RequirePackage{remreset}
\RequirePackage[hang]{subfigure}
\RequirePackage{multirow}
% \RequirePackage{array}

\setlength{\intextsep}{26pt}
\setlength{\floatsep}{26pt}

\setlength{\abovecaptionskip}{\z@}
\setlength{\belowcaptionskip}{\z@}

\setlength{\subfigbottomskip}{1ex}
\setlength{\subfiglabelskip}{1ex}

\newcounter{example}[chapter]

\def\fps@example{example}
\def\ftype@example{3}
\def\ext@example{loe}

\@removefromreset{example}{chapter}
\@removefromreset{figure}{chapter}
\@removefromreset{table}{chapter}

\renewcommand \thefigure {\@arabic\c@figure}
\renewcommand \thesubfigure {$\alph{subfigure})$}
\renewcommand \thetable {\@arabic\c@table}
\renewcommand \thesubtable {\alph{subtable}}
\renewcommand \theexample {\@arabic\c@example}

% \newcommand \figref[2][] {\MakeUppercase{\myfigurename}~\ref{#2}#1}
% \newcommand \tabref[2][] {\MakeUppercase{\mytablename}~\ref{#2}#1}
% \newcommand \exref[2][] {\MakeUppercase{\myexamplename}~\ref{#2}#1}

\newcommand \figref[1][] {%
  \def\relayarg{{#1}}%
  \figrefr%
}
\newcommand \figrefr[2][default] {%
  \setbox0=\hbox{#1}%
  \setbox1=\hbox{default}%
  \ifnum \wd0 = 0 (\relayarg\ \MakeUppercase{\myfigurename}~\ref{#2})%
  \else%
    \ifnum \wd0 = \wd1 (\MakeUppercase{\myfigurename}~\ref{#2}\relayarg)%
    \else (\relayarg\ \MakeUppercase{\myfigurename}~\ref{#2}#1)%
    \fi%
  \fi%
}

\newcommand \tabref[1][] {%
  \def\relayarg{{#1}}%
  \tabrefr%
}
\newcommand \tabrefr[2][default] {%
  \setbox0=\hbox{#1}%
  \setbox1=\hbox{default}%
  \ifnum \wd0 = 0 (\relayarg\ \MakeUppercase{\mytablename}~\ref{#2})%
  \else%
    \ifnum \wd0 = \wd1 (\MakeUppercase{\mytablename}~\ref{#2}\relayarg)%
    \else (\relayarg\ \MakeUppercase{\mytablename}~\ref{#2}#1)%
    \fi%
  \fi%
}

\newcommand \exref[1][] {%
  \def\relayarg{{#1}}%
  \exrefr%
}
\newcommand \exrefr[2][default] {%
  \setbox0=\hbox{#1}%
  \setbox1=\hbox{default}%
  \ifnum \wd0 = 0 (\relayarg\ \MakeUppercase{\myexamplename}~\ref{#2})%
  \else%
    \ifnum \wd0 = \wd1 (\MakeUppercase{\myexamplename}~\ref{#2}\relayarg)%
    \else (\relayarg\ \MakeUppercase{\myexamplename}~\ref{#2}#1)%
    \fi%
  \fi%
}

\def\fnum@example{\MakeUppercase{\myexamplename}\nobreakspace\theexample}
\def\fnum@figure{\MakeUppercase{\myfigurename}\nobreakspace\thefigure}
\def\fnum@table{\MakeUppercase{\mytablename}\nobreakspace\thetable}

\newenvironment{example}{\setlength{\abovecaptionskip}{\z@}\setlength{\belowcaptionskip}{-2.5pt}\@float{example}}{\end@float}
\renewenvironment{table}{\setlength{\abovecaptionskip}{\z@}\setlength{\belowcaptionskip}{-5pt}\@float{table}}{\end@float}
\renewenvironment{figure}{\setlength{\abovecaptionskip}{11pt}\setlength{\belowcaptionskip}{\z@}\@float{figure}}{\end@float}

\def\@makecaption#1#2{%
  \captionfontsize%
  \par\addvspace{\abovecaptionskip}\par%
  \setbox0=\hbox{#1\hskip 5ex}%
  \setlength{\hangindent}{\wd0}%
  \noindent\box0#2%
  \normalsize%
  \par\addvspace{\belowcaptionskip}\par%
}

\def\tabular{%
  \tablespacing%
  \tablefontsize%
  \let\@halignto\@empty\@tabular}

\@namedef{tabular*}#1{%
  \tablespacing%
  \tablefontsize%
  \setlength\dimen@{#1}%
    \edef\@halignto{to\the\dimen@}\@tabular}

% Customized from: http://www.math.mcgill.ca/rags/texmacros/indent.sty
\newenvironment{capsule}{%
  \examplefontsize%
  \examplespacing%
  \par%
  \advance\linewidth -\leftmargin%
  \advance\linewidth -\rightmargin%
  \advance\@totalleftmargin\leftmargin%
  \@setpar{{\@@par}}%
  \parshape 1 \@totalleftmargin \linewidth%
  \ignorespaces %
}{\par \addvspace{-\baselineskip}}

\newcommand{\onpage}[1]{, \mypageabbrv~\pageref{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Footnotes
%

\usepackage[flushmargin]{footmisc}

\@removefromreset{footnote}{chapter}

\newlength{\myfootnotewidth}
\newlength{\myfootnotelabel}
\renewcommand{\@makefntext}[1]{%
  \setbox0=\hbox{\@makefnmark\ }%
  \setlength{\myfootnotelabel}{\wd0}
  \setlength{\myfootnotewidth}{\columnwidth}%
  \addtolength{\myfootnotewidth}{-\myfootnotelabel}%
  \noindent\makebox[\myfootnotelabel][r]{\@makefnmark\ }%
  \parbox[t]{\myfootnotewidth}{#1}%
}

\renewcommand\footnoterule{%
  \vfill
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hyperlinks
%

\RequirePackage[pdftex,bookmarksopen,bookmarksnumbered]{hyperref}
\newcommand \theHexample {\@arabic\c@example}
\renewcommand \theHfigure {\@arabic\c@figure}
\renewcommand \theHtable {\@arabic\c@table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table of figures and tables
%

\newcommand*\l@example{\@dottedtocline{\z@}{\z@}{\z@}}
\renewcommand*\l@figure{\@dottedtocline{\z@}{\z@}{\z@}}
\renewcommand*\l@table{\@dottedtocline{\z@}{\z@}{\z@}}

\renewcommand\listoffigures{%
  \addvspace{11pt}%
  \begin{singlespace}%
  \@starttoc{lof}%
  \end{singlespace}%
}

\renewcommand\listoftables{%
  \addvspace{11pt}%
  \begin{singlespace}%
  \@starttoc{lot}%
  \end{singlespace}%
}

\newcommand\listofexamples{%
  \addvspace{11pt}%
  \begin{singlespace}%
  \@starttoc{loe}%
  \end{singlespace}%
}

\long\def\@caption#1[#2]#3{%
  \hyper@makecurrent{\@captype}%
  \setbox0=\hbox{#2}
  \ifnum \wd0 > 0%
  \par\addcontentsline{\csname ext@#1\endcsname}{#1}{%
    \protect\texorpdfstring{\uppercase{\csname my#1name\endcsname}}%
    {\csname my#1name\endcsname}~\csname the#1\endcsname.~#2%
  }%
  \fi%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{%
      \ignorespaces
      \ifHy@nesting
        \hyper@@anchor{\@currentHref}{#3}%
      \else
        \Hy@raisedlink{\hyper@@anchor{\@currentHref}{\relax}}#3%
      \fi
    }%
    \par
  \endgroup
}
