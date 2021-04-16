\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2021/04/11 Lecture Notes Class]
\LoadClass{scrbook}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% PACKAGES                           %%%%%
%%%%% NO CONFIGURATION YET (IF POSSIBLE) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% colors (load before gitinfo2)
\RequirePackage[dvipsnames]{xcolor}

% date formatting of git information
% must be loaded before gitinfo2
\RequirePackage[en-GB]{datetime2}

% git informations in the document
\RequirePackage{gitinfo2}

% header design
\RequirePackage[automark]{scrlayer-scrpage}

% margin notes
\RequirePackage{marginnote}

% bibliography
\RequirePackage[
	backend     = biber,
	style       = alphabetic,
	dateabbrev  = false,
	urldate     = long
]{biblatex}

% index
\RequirePackage[original]{imakeidx}
\RequirePackage{multicol}

\RequirePackage{customtex}

% list of symbols
% needs to be loaded after hyperref
\RequirePackage{tabu}
\RequirePackage[
	symbols,
	sort = use
]{glossaries-extra}







%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% CONFIGURATION %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%% CLASS CONFIGURATION

% Sets the page size
\KOMAoptions{paper = a4}

% Sets the font size
\KOMAoptions{fontsize = 11pt}

% Adds the words
%   Chapter #number
% at the beginning of a chapter
\KOMAoptions{chapterprefix = true}

% No trailing period in chapter/section/… titles
\KOMAoptions{numbers = noenddot}

% Same margins left and right
\KOMAoptions{twoside = semi}

% Makes the titlepage into the cover page
\KOMAoptions{titlepage = firstiscover}



%%%%% FONT CONFIGURATION

% no sans serif for titles
\addtokomafont{disposition}{\rmfamily}
\addtokomafont{descriptionlabel}{\rmfamily}
% change font size for the field "publishers" on the title page
\addtokomafont{publishers}{\normalsize}



%%%%% REFERENCING CONFIGURATION

\crefname{equation}{equation}{equations}

\hypersetup{
	colorlinks,
	linkcolor = {MidnightBlue},
	% alternative for citecolor: RedViolet
	citecolor = {BrickRed},
	urlcolor  = {BrickRed}
}



%%%%% HEADER CONFIGURATION

% remove numbers from headmark
\renewcommand*{\chaptermarkformat}{\thechapter.\enspace}
\renewcommand*{\sectionmarkformat}{\thesection.\enspace}

% pagenumber in bold
%\addtokomafont{pagenumber}{\bfseries}

% even pages header
\lehead{\pagemark}
\rehead{\upshape{\headmark}}

% odd pages header
\rohead{\pagemark}
\lohead{\upshape{\headmark}}

% make foot empty
\ofoot{}
\cfoot{}
\ifoot{}



%%%%% TITLEPAGE CONFIGURATION

\newcommand{\lectureHeader}{}
\newcommand{\lectureTitle}{}
\newcommand{\lectureSubtitle}{}
\newcommand{\authorname}{}
\newcommand{\onlineadress}{}
\newcommand{\emailadress}{}

\subject{\lectureHeader}

\title{\textsc{\lectureTitle}}
\subtitle{\lectureSubtitle}

\author{
	{\normalsize written by}
	\\
	\authorname
}

\date{
	{\normalsize version}
	\\
	\textrm{\gitAbbrevHash}
	\\
	\bigbreak
	{\normalsize last changed}
	\\
	\textrm{\DTMusedate{gitdate}}
}

\publishers{
	Available at
	\url{\onlineadress}.
	\\
	Please send comments and corrections to
	\href{mailto:\emailadress}{\emailadress}.
}



%%%%% TABLE OF CONTENTS CONFIGURATION

% no subsections in the toc
\setcounter{tocdepth}{1}

% don’t number subsections
\setcounter{secnumdepth}{2}

% more space for page numbers in the toc, default is 1.55
\renewcommand{\@pnumwidth}{2em}



%%%%% BIBLIOGRAPHY CONFIGURATION

\newcommand{\bibliographyfile}{}

% add the bibliography to the table of contents
% for KOMA-Script classes
\KOMAoptions{bibliography = totoc}




%%%%% LIST OF SYMBOLS CONFIGURATION

% set the style of the list of symbols
\setglossarystyle{long}

% adjust the table width to fill out the whole page
% use longtabu from the tabu package for this
%\renewenvironment{theglossary}%
%{%
%	\begin{longtabu} to \textwidth {{@{}lX[l]}}
%}%
%{%
%	\end{longtabu}
%}
% THE ABOVE IS SOMEHOW BROKEN

% fill space after description with dots
\renewcommand{\glspostdescription}{\dotfill}

% allow for newly defined macros in the list of symbols
\glsnoexpandfields

% creating the actual list fo symbols
\makenoidxglossaries



%%%%% INDEX CONFIGURATION

% add the index to the table of contents
% for KOMA-script classes
\KOMAoptions{index = totoc}

% trying to fix the positing of the index title
% see https://tex.stackexchange.com/questions/510724/

\renewcommand{\idx@heading}{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\@chaptertolistsfalse
	\idx@@heading{\indexname}%
	\ifidx@leveldown
		\addsecmark{\indexname}%
	\else
		\@mkdouble{\MakeMarkcase{\indexname}}%
	\fi
}
\apptocmd{\theindex}{\setlength{\multicolsep}{0pt}\begin{multicols*}{2}}{}{}
\pretocmd{\endtheindex}{\end{multicols*}}{}{}

% making the index
\makeindex





%%%%% LECTURE COUNTER

% initializing the list of lectures
\addtotoclist{lol}
\newcommand{\listoflectures}{\listoftoc{lol}}
\newcommand{\listoflolname}{List of Lectures}
\setuptoc{lol}{totoc}

% initializing a lecture counter
\newcounter{lecture}
\renewcommand{\thelecture}{Lecture \arabic{lecture}}


% auxiliary command for adding descriptions to the list of lectures
% NOTE: the standard indentation for sections in the toc is 1.5em,
% see KOMA-Script manual, value tocindent for section,
% in Chapter 21 (Additional Information about the Main Classes and scrextend)
\newcommand{\texttolol}[1]{%
	\addtocontents{lol}{\smallskip\hspace{1.5em}\protect\parbox{\linewidth - \@pnumwidth - 1.5em}{\detokenize{#1}}\par}
}

% printing margin notes on the left side
\reversemarginpar

% the main command
\NewDocumentCommand%
	{\nextlecture}
	{mo} % date as optional argument
	{%
		% increase the counter
		\refstepcounter{lecture}%
		% print in on the left side margin
	\marginnote{\usekomafont{disposition} \thelecture \\ \normalfont #1}
		\addcontentsline{lol}{chapter}{{\thelecture} (#1)}
		% print information in the list of lectures
		\IfValueTF{#2}{ \texttolol{#2} }{ }
	}



%%%%% THEORIM-LIKE ENVIRONMENT CONFIGURATION

% adjust the counter
\renewcommand{\theeverything}{\arabic{chapter}.\arabic{everything}}

