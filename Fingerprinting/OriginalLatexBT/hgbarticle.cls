%% hgbarticle.cls
%% LaTeX class for creating lab and term reports as well as other forms of academic documentation.
%% This file is part of the Hagenberg Thesis package for creating bachelors's and masters's theses
%% Author: Wolfgang Hochleitner (wolfgang.hochleitner@fh-hagenberg.at)
%% GitHub: https://github.com/Digital-Media/HagenbergThesis
%% File encoding: ASCII

%% Package Information --------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hgbarticle}[2018/10/14]

\RequirePackage{xifthen}

\RequirePackage{ifpdf}	% for checking PDF mode 
\ifpdf{}% \typeout{hgbarticle: *** LaTeX in PDF mode ***}
\else{\errmessage{hgbarticle: *** LaTeX NOT running in PDF mode ***}}
\fi


%% Command for language defintion ---------------------------------------------

\newcommand{\hgb@MainLanguage}{german}	% also referenced in hgb.sty


%% Class options --------------------------------------------------------------

\DeclareOption{twocolumn}{%
	\PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{english}{%
	\renewcommand{\hgb@MainLanguage}{english}
}

\DeclareOption{german}{%
	\renewcommand{\hgb@MainLanguage}{german}
}

\DeclareOption*{%
	\ClassWarning{hgbarticle}{Unknown document option '\CurrentOption'.}
}

\ProcessOptions


%% Paper options and style file -----------------------------------------------

\LoadClass[a4paper,11pt]{article}

%Adjust margins only in single-column mode
\if@twocolumn%
\else%
\RequirePackage[top=36mm,bottom=40mm,left=32mm,right=32mm]{geometry} %showframe
\fi%

\RequirePackage{hgb}	% load associated style file hgb.sty


%% Set title font to SF
\RequirePackage{titling}
\renewcommand{\maketitlehooka}{\sffamily}

%% Set abstract name to bold (single column format only)
\if@twocolumn%
\else%
\RequirePackage{abstract}
\renewcommand{\abstractnamefont}{\sffamily\small\bfseries}
\fi%

% Add PDF meta data

\AtBeginDocument{%
	\hypersetup{
		pdftitle={\@title},
		pdfauthor={\@author},
		pdfsubject={},
		pdfcreator={LaTeX using class hgbarticle [\hgbDate]},
		pdfproducer={pdflatex},
		pdfkeywords={}
	}%
}%


%% Additional Hagenberg packages ----------------------------------------------

\RequirePackage{hgbmath}
\RequirePackage{hgbalgo}
\RequirePackage{hgbheadings}
\RequirePackage{hgbabbrev}
\RequirePackage{hgblistings}
\RequirePackage{hgbbib}

\endinput