\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wiwwurprt}[2009/03/02 Report-Class Basis fuer alle Stile (von Stephan Dlugosz) Vers. 0.5.5]

\RequirePackage{kvoptions}
\RequirePackage{ifthen}

\SetupKeyvalOptions{
	family=wiwwurprt,
	prefix=wiwwurprt@
}

\newcommand{\wiwwurprt@RequiredPackages}{}

\DeclareStringOption{style}
\DeclareStringOption[german]{language}[german]
\DeclareStringOption[onehalfspacing]{spacing}[onehalfspacing]
\DeclareVoidOption{liststotoc}{%
	\PassOptionsToClass{listof=totoc}{scrreprt}%
}
\DeclareVoidOption{bibtotoc}{%
	\PassOptionsToClass{bibliography=totoc}{scrreprt}%
}
\DeclareVoidOption{square}{%
	\PassOptionsToPackage{square}{wiwwubasis}%
}
\DeclareVoidOption{wordstyle}{%
	\PassOptionsToPackage{wordstylefootnotes}{wiwwubasis}
	\PassOptionsToClass{smallheadings}{scrrprt}
}
\DeclareVoidOption{numbers}{%
	\PassOptionsToPackage{numbers}{wiwwubasis}%
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
\DeclareVoidOption{twoside}{%
    \PassOptionsToClass{twoside}{scrreprt}
}
\DeclareStringOption[12pt]{size}[12pt]
\DeclareVoidOption{noinputenc}{%
  \PassOptionsToClass{noinputenc}{wiwwubasis}
}
\DeclareDefaultOption{%
	\PackageWarning{wiwwurprt}{Option unknown: \CurrentOption}%
}
\ProcessKeyvalOptions{wiwwurprt}

% echtes Ausfuehren
\ifthenelse{\equal{\wiwwurprt@style}{}}{}{%
	\ifthenelse{\equal{\wiwwurprt@style}{pi}}{%
		\g@addto@macro\wiwwurprt@RequiredPackages{\RequirePackage{wiwwulatex_pi}}
	}{%
		\ifthenelse{\equal{\wiwwurprt@style}{qm}}{%
			\g@addto@macro\wiwwurprt@RequiredPackages{\RequirePackage{wiwwulatex_qm}}
		}{%
			\PackageWarning{wiwwurprt}{Unknown Style: \wiwwurprt@style}
			\PackageInfo{wiwwurprt}{Using: none}
		}
	}
}
\PassOptionsToClass{\wiwwurprt@size}{scrreprt}

\DisableKeyvalOption{wiwwurprt}{style}
\DisableKeyvalOption{wiwwurprt}{size}
\PassOptionsToClass{language=\wiwwurprt@language}{wiwwubasis}
\DisableKeyvalOption{wiwwurprt}{language}
\PassOptionsToPackage{spacing=\wiwwurprt@spacing}{wiwwubasis}%
\DisableKeyvalOption{wiwwurprt}{spacing}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Laden der "alten" Klasse
\LoadClass[a4paper,parskip,numbers=noenddot,captions=tablesignature]{scrreprt}
\RequirePackage{wiwwubasis}
\wiwwurprt@RequiredPackages
