\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wiwwuwordrprt}[2009/03/19 Report Class Basis fuer die Stile wie Word (von Stephan Dlugosz) Vers. 0.5.5]

\RequirePackage{kvoptions}
\RequirePackage{ifthen}

\SetupKeyvalOptions{
	family=wiwwuwordrprt,
	prefix=wiwwuwordrprt@
}

\DeclareStringOption[is]{style}[is]
\DeclareStringOption[onehalfspacing]{spacing}[onehalfspacing]
\DeclareVoidOption{square}{%
	\PassOptionsToClass{square}{wiwwurprt}
}
\DeclareStringOption[german]{language}[german]
\DeclareVoidOption{tabularx}{%
	\PassOptionsToClass{tabularx}{wiwwurprt}%
}
\DeclareVoidOption{nobottomtitles}{%
    \PassOptionsToPackage{nobottomtitles}{wiwwuwordbasis}
}
\DeclareVoidOption{noinputenc}{%
  \PassOptionsToClass{noinputenc}{wiwwuwordbasis}
}
\DeclareDefaultOption{%
	\ClassWarning{wiwwuwordrprt}{Unknown Option: \CurrentOption}%
}
\ProcessKeyvalOptions{wiwwuwordrprt}

\newcommand{\wiwwuwordrprt@loadStyle}{}

% echtes Ausfuehren der Optionen
\ifthenelse{\equal{\wiwwuwordrprt@style}{pi}}{%
	\PassOptionsToClass{size=12pt,square}{wiwwurprt}
	\renewcommand{\wiwwuwordrprt@loadStyle}{\RequirePackage{wiwwuword_pi}}
}{%
	\ifthenelse{\equal{\wiwwuwordrprt@style}{in}}{%
		\PassOptionsToClass{size=12pt,square,bibtopic,numbers}{wiwwurprt}
		\renewcommand{\wiwwuwordrprt@loadStyle}{\RequirePackage{wiwwuword_in}}
	}{%
		\ifthenelse{\equal{\wiwwuwordrprt@style}{aw}}{%
			\PassOptionsToClass{size=12pt}{wiwwurprt}
			\renewcommand{\wiwwuwordrprt@loadStyle}{\RequirePackage{wiwwuword_aw}}
		}{%
			\ifthenelse{\equal{\wiwwuwordrprt@style}{ercis}}{%
				\PassOptionsToClass{size=11pt,twoside}{wiwwurprt}
				\renewcommand{\wiwwuwordrprt@language}{english}
				\renewcommand{\wiwwuwordrprt@spacing}{singlespacing}
   				\renewcommand{\wiwwuwordrprt@loadStyle}{\RequirePackage{wiwwuword_ercis}}
			}{%
				\ifthenelse{\equal{\wiwwuwordrprt@style}{ab}}{%
					\PassOptionsToClass{size=12pt,twoside}{wiwwurprt}
					\renewcommand{\wiwwuwordrprt@loadStyle}{\RequirePackage{wiwwuword_ab}}
					\renewcommand{\wiwwuwordrprt@spacing}{singlespacing}
					\PassOptionsToPackage{language=\wiwwuwordrprt@language}{wiwwuword_ab}
				}{%
					\ifthenelse{\equal{\wiwwuwordrprt@style}{is}}{%
						\PassOptionsToClass{size=12pt,toctotoc}{wiwwurprt}
						\renewcommand{\wiwwuwordrprt@loadStyle}{\RequirePackage{wiwwuword_is}}
						\PassOptionsToPackage{language=\wiwwuwordrprt@language}{wiwwuword_is}
					}{%
						\PackageWarning{wiwwuwordrprt}{Unknown Style: \wiwwuwordrprt@style}
						\PackageInfo{wiwwuwordrprt}{Using: is}
						\PassOptionsToClass{size=12pt,toctotoc}{wiwwurprt}
						\renewcommand{\wiwwuwordrprt@loadStyle}{\RequirePackage{wiwwuword_is}}
						\PassOptionsToPackage{language=\wiwwuwordrprt@language}{wiwwuword_is}
					}
				}
			}
		}
	}
}
\DisableKeyvalOption{wiwwuwordrprt}{style}
\PassOptionsToClass{language=\wiwwuwordrprt@language}{wiwwurprt}
\PassOptionsToClass{spacing=\wiwwuwordrprt@spacing}{wiwwurprt}
\DisableKeyvalOption{wiwwuwordrprt}{language}
\DisableKeyvalOption{wiwwuwordrprt}{spacing}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Laden der "alten" Klasse
\LoadClass[wordstyle,liststotoc,bibtotoc]{wiwwurprt}

%weitere Pakete
\RequirePackage{wiwwuwordbasis}
\wiwwuwordrprt@loadStyle
