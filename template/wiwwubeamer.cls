\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wiwwubeamer}[2011/05/13 Beamer-Class (von Stephan Dlugosz) Vers. 0.5.7]

\RequirePackage{ifthen}
\RequirePackage{kvoptions}
\RequirePackage{scrlfile}

\SetupKeyvalOptions{
	family=wiwwubeamer,
	prefix=wiwwubeamer@
}

\newcommand{\wiwwubeamer@option@handout}{}

\AfterClass*{beamer}{\newcommand{\wiwwubeamer@footer}{\insertshortauthor}}

\newboolean{wiwwubeamer@toclinks}
\setboolean{wiwwubeamer@toclinks}{false}

\DeclareVoidOption{handout}{%
  \PassOptionsToClass{handout}{beamer}
  \renewcommand{\wiwwubeamer@option@handout}{%
    \setbeamercolor{normal text}{fg=black,bg=white}
  }
}
\DeclareVoidOption{smaller}{%
  \PassOptionsToClass{smaller}{beamer}
}
\DeclareVoidOption{bigger}{%
  \PassOptionsToClass{bigger}{beamer}
}
\DeclareStringOption[wi]{style}[wi]
\DeclareVoidOption{numbered}{%
	\AfterClass*{beamer}{\edef\inserttocsectionnumber{\the\beamer@tempcount}}
	\AtBeginDocument{%
    	\setbeamertemplate{section in toc}{\inserttocsectionnumber~\inserttocsection}
		\setbeamertemplate{subsection in toc}{\leavevmode\leftskip=1.5em\inserttocsectionnumber.\inserttocsubsectionnumber~\inserttocsubsection}
		\setbeamertemplate{subsubsection in toc}{\leavevmode\leftskip=3em\inserttocsectionnumber.\inserttocsubsectionnumber.\inserttocsubsubsectionnumber~\inserttocsubsubsection}
	}
}
\DeclareVoidOption{toclinks}{%
	\setboolean{wiwwubeamer@toclinks}{true}
}
\DeclareBoolOption{noinputenc}
\DeclareDefaultOption{%
  \PackageWarning{wiwwubeamer}{Unknown Option: \CurrentOption}%
}
\ProcessKeyvalOptions{wiwwubeamer}

%% Klasse laden!
\LoadClass[12pt,t,pdfpagelabels=false]{beamer}
%%
\ifwiwwubeamer@noinputenc{%
\PackageInfo{wiwwubeamer}{Option noinputenc gesetzt, es wird eine ASCII-Datei angenommen.}
}\else{%
\RequirePackage[latin1]{inputenc}
}\fi
\RequirePackage[UKenglish,ngerman]{babel}
\RequirePackage[T1]{fontenc} % Fuer das Trennen von "Umlauten"
\RequirePackage{cmbright}
\RequirePackage[scaled]{uarial}
\RequirePackage{textcomp} %fuer tm und andere Copyright Zeichen....
\RequirePackage{eurosym} % Euro-Symbol
\RequirePackage{mdwlist}
\RequirePackage{enumerate} % fuer flexible Syntax in Listen!
\RequirePackage{ellipsis} % fuer die korrekten Abstaende bei Auslassungspunkten mit \dots
\RequirePackage[quiet,overlay]{textpos} % fuer absolute Positionierung

% echtes Ausfuehren der Optionen %%%%%%%%%%%%%%%%%%%%%%%%%%
\ifthenelse{\equal{\wiwwubeamer@style}{ercis}}{%
	\RequirePackage{wiwwubeamer_ercislike}
}{%
	\ifthenelse{\equal{\wiwwubeamer@style}{ercisfrei}}{%
		\RequirePackage[ercisfrei]{wiwwubeamer_ercislike}
	}{%
		\ifthenelse{\equal{\wiwwubeamer@style}{www}}{%
			\RequirePackage{wiwwubeamer_www}
		}{%
			\ifthenelse{\equal{\wiwwubeamer@style}{wi}}{%
				\RequirePackage{wiwwubeamer_wi}
			}{%
				\ifthenelse{\equal{\wiwwubeamer@style}{wwu}}{%
					\RequirePackage{wiwwubeamer_wwu}
				}{%
					\PackageWarning{wiwwubeamer}{Unknown Style: \wiwwubeamer@style}
					\PackageInfo{wiwwubeamer}{Using: wi}
					\RequirePackage{wiwwubeamer_wi}
				}
			}
		}
	}
}
\DisableKeyvalOption{wiwwubeamer}{style}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ifthenelse{\boolean{wiwwubeamer@toclinks}}{%
	\renewcommand\insertshorttitle[1][]{%
  		\beamer@setupshort{#1}%
  		\let\thanks=\@gobble%
  		\beamer@insertshort{\beamer@shorttitle}
	}
	\newcommand{\wiwwubeamer@footertitle}{\hyperlink{toc}{\insertshorttitle}}
}{%
	\newcommand{\wiwwubeamer@footertitle}{\insertshorttitle}
}


\wiwwubeamer@option@handout
\renewcommand{\insertcontinuationtext}{(Forts.)}

\hypersetup{pdfpagemode=FullScreen}

%% Aus Koma-Script uebernommen !!!%%
\newenvironment{labeling}[2][]
  {\def\sc@septext{#1}
   \list{}{\settowidth{\labelwidth}{#2#1}
     \leftmargin\labelwidth \advance\leftmargin by \labelsep
     \let\makelabel\labelinglabel}}
  {\endlist}
\newcommand\labelinglabel[1]{#1\hfil\sc@septext}
%%%%%%

\TPGrid{10}{10}

\newcommand{\bi}{\begin{itemize}}
\newcommand{\ei}{\end{itemize}}
\newcommand{\be}{\begin{enumerate}}
\newcommand{\ee}{\end{enumerate}}
\newcommand{\bl}[1]{\begin{labeling}{#1}}
\newcommand{\el}{\end{labeling}}

% fuer faule menschen
\def\myempty{}
\newenvironment{Folie}[2][\myempty]{%
   \begin{frame}[#1]\frametitle{#2}
}{
   \end{frame}
}
%%%%%%%%%%% nur fuer Kompatibilitaet!! %%%%%%%%%%%
\newenvironment{folie}[2][\myempty]{%
   \PackageInfo{wiwwubeamer}{Deprecated environment: folie, use: Folie}
   \begin{frame}[#1]\frametitle{#2}
}{
   \end{frame}
}
%%%%%%%%%%% nur fuer Kompatibilitaet!! %%%%%%%%%%%

% fuer ganz faule menschen (tut nicht, warum nicht?)
\let\bfol\folie
\let\efol\endfolie

% fuer ulrich ;-)
\newcommand{\fol}[3][\myempty]{% optionales Argument, Titel, Inhalt
   \begin{folie}[#1]{#2}
      #3
   \end{folie}
}

\newcommand{\printtitleframe}{%
  \setbeamertemplate{background canvas}{\pgfuseimage{hg}}
  \begin{frame}[t,plain]
    \titlepage
  \end{frame}
  \setbeamertemplate{background canvas}{\pgfuseimage{hgn}}
}