\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wiwwuwordartcl}[2009/03/02 Article Class Basis fuer die Stile wie Word (von Stephan Dlugosz) Vers. 0.5.5]

\RequirePackage{kvoptions}
\RequirePackage{ifthen}

\SetupKeyvalOptions{
	family=wiwwuwordartcl,
	prefix=wiwwuwordartcl@
}

\DeclareStringOption[is]{style}[is]
\DeclareStringOption[onehalfspacing]{spacing}[onehalfspacing]
\DeclareVoidOption{square}{%
	\PassOptionsToClass{square}{wiwwuartcl}
}
\DeclareStringOption[german]{language}[german]
\DeclareVoidOption{tabularx}{%
	\PassOptionsToClass{tabularx}{wiwwuartcl}%
}
\DeclareVoidOption{nobottomtitles}{%
    \PassOptionsToPackage{nobottomtitles}{wiwwuwordbasis}
}
\DeclareVoidOption{noinputenc}{%
  \PassOptionsToClass{noinputenc}{wiwwuwordbasis}
}
\DeclareDefaultOption{%
	\ClassWarning{wiwwuwordartcl}{Unknown Option: \CurrentOption}%
}
\ProcessKeyvalOptions{wiwwuwordartcl}

\newcommand{\wiwwuwordartcl@loadStyle}{}

% echtes Ausfuehren der Optionen
\ifthenelse{\equal{\wiwwuwordartcl@style}{pi}}{%
	\PassOptionsToClass{12pt,square}{wiwwuartcl}
	\renewcommand{\wiwwuwordartcl@loadStyle}{\RequirePackage{wiwwuword_pi}}
}{%
	\ifthenelse{\equal{\wiwwuwordartcl@style}{in}}{%
		\PassOptionsToClass{12pt,square,bibtopic}{wiwwuartcl}
		\renewcommand{\wiwwuwordartcl@loadStyle}{\RequirePackage{wiwwuword_in}}
	}{%
		\ifthenelse{\equal{\wiwwuwordartcl@style}{aw}}{%
			\PassOptionsToClass{12pt}{wiwwuartcl}
			\renewcommand{\wiwwuwordartcl@loadStyle}{\RequirePackage{wiwwuword_aw}}
		}{%
			\ifthenelse{\equal{\wiwwuwordartcl@style}{ercis}}{%
				\PassOptionsToClass{10pt,twoside,language=english}{wiwwuartcl}
   				\renewcommand{\wiwwuwordartcl@loadStyle}{\RequirePackage{wiwwuword_ercis}}
			}{%
				\ifthenelse{\equal{\wiwwuwordartcl@style}{is}}{%
					\PassOptionsToClass{12pt}{wiwwuartcl}
					\renewcommand{\wiwwuwordartcl@loadStyle}{\RequirePackage{wiwwuword_is}}
				}{%
					\PackageWarning{wiwwuwordartcl}{Unknown Style: \wiwwuwordartcl@style}
					\PackageInfo{wiwwuwordartcl}{Using: is}
					\PassOptionsToClass{12pt}{wiwwuartcl}
					\renewcommand{\wiwwuwordartcl@loadStyle}{\RequirePackage{wiwwuword_is}}
				}
			}
		}
	}
}
\DisableKeyvalOption{wiwwuwordartcl}{style}
\PassOptionsToClass{language=\wiwwuwordartcl@language}{wiwwuartcl}
\PassOptionsToClass{spacing=\wiwwuwordartcl@spacing}{wiwwuartcl}
\DisableKeyvalOption{wiwwuwordartcl}{language}
\DisableKeyvalOption{wiwwuwordartcl}{spacing}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Laden der "alten" Klasse
\LoadClass[wordstyle,liststotoc,bibtotoc]{wiwwuartcl}

%weitere Pakete
\RequirePackage{wiwwuwordbasis}
\wiwwuwordartcl@loadStyle