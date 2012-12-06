\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wiwwuartcl}[2009/03/02 Article-Class Basis fuer alle Stile (von Stephan Dlugosz) Vers. 0.5.5]

\RequirePackage{kvoptions}
\RequirePackage{ifthen}

\SetupKeyvalOptions{
	family=wiwwuartcl,
	prefix=wiwwuartcl@
}

\newcommand{\wiwwuartcl@RequiredPackages}{}

\DeclareStringOption{style}
\DeclareStringOption[german]{language}[german]
\DeclareStringOption[onehalfspacing]{spacing}[onehalfspacing]
\DeclareVoidOption{liststotoc}{%
	\PassOptionsToClass{listof=totoc}{scrartcl}%
}
\DeclareVoidOption{bibtotoc}{%
	\PassOptionsToClass{bibliography=totoc}{scrartcl}%
}
\DeclareVoidOption{square}{%
	\PassOptionsToPackage{square}{wiwwubasis}%
}
\DeclareVoidOption{wordstyle}{%
	\PassOptionsToPackage{wordstylefootnotes}{wiwwubasis}
	\PassOptionsToClass{smallheadings}{scrartcl}
}
\DeclareVoidOption{numbers}{%
	\PassOptionsToPackage{numbers}{wiwwubasis}%
}
\DeclareVoidOption{onehalfspacing}{%
	\PassOptionsToPackage{onehalfspacing}{wiwwubasis}%
}
\DeclareVoidOption{tabularx}{%
	\PassOptionsToPackage{tabularx}{wiwwubasis}%
}
\DeclareVoidOption{bibtopic}{%
	\PassOptionsToPackage{bibtopic}{wiwwubasis}%
}
\DeclareVoidOption{toctotoc}{%
	\PassOptionsToPackage{toctotoc}{wiwwubasis}%
}
\DeclareStringOption[12pt]{size}[12pt]
\DeclareVoidOption{noinputenc}{%
  \PassOptionsToClass{noinputenc}{wiwwuwordbasis}
}
\DeclareDefaultOption{%
	\PackageWarning{wiwwuartcl}{Option unknown: \CurrentOption}%
}
\ProcessKeyvalOptions{wiwwuartcl}

% echtes Ausfuehren
\ifthenelse{\equal{\wiwwuartcl@style}{}}{}{%
	\ifthenelse{\equal{\wiwwuartcl@style}{pi}}{%
		\g@addto@macro\wiwwuartcl@RequiredPackages{\RequirePackage{wiwwulatex_pi}}
	}{%
		\ifthenelse{\equal{\wiwwuartcl@style}{qm}}{%
			\g@addto@macro\wiwwuartcl@RequiredPackages{\RequirePackage{wiwwulatex_qm}}
		}{%
			\PackageWarning{wiwwuartcl}{Unknown Style: \wiwwuartcl@style}
			\PackageInfo{wiwwuartcl}{Using: none}
		}
	}
}
\PassOptionsToClass{\wiwwuartcl@size}{scrartcl}

\DisableKeyvalOption{wiwwuartcl}{style}
\DisableKeyvalOption{wiwwuartcl}{size}
\PassOptionsToClass{language=\wiwwuartcl@language}{wiwwubasis}
\DisableKeyvalOption{wiwwuartcl}{language}
\PassOptionsToPackage{spacing=\wiwwuartcl@spacing}{wiwwubasis}%
\DisableKeyvalOption{wiwwuartcl}{spacing}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Laden der "alten" Klasse
\LoadClass[12pt,a4paper,parskip,numbers=noenddot,captions=tablesignature]{scrartcl}
\RequirePackage{wiwwubasis}
\wiwwuartcl@RequiredPackages
