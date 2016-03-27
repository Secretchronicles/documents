% LaTeX class for TSC GD document submissions
% Copyright (C) 2016 The TSC Team
% All Rights Reserved.
%
% You may use this LaTeX class freely for preparing documents
% you want to submit to the TSC team's General Discussions.
% Use for any other purpose is prohibited.
%
% This class is intended to be used with LuaLaTeX. It should
% also work with XeTeX, but it most likely won't work with
% pdfTeX (due to use of the fontspec package). The most important
% difference this makes is that you write your document in UTF-8
% and can directly input UTF-8 characters without any problems.
%
% The documents intentionally have a very large right margin. This
% is to allow you to print it out and make notes on the page with
% a pencil. The document size is US Letter, which should also print
% fine with an A4 printer. You can pass paper=a4 as an option to
% this class if you really need an A4 sheet.
%
% In order to use this LaTeX class, place it into your local TEXMF
% tree. By default, this should be ~/.texmf/tex/latex for a TeXLive
% distribution. You need to install the linux-libertine font family
% package (or use the defaultfont option documented below). The
% Libertine fonts are available as a package in any major Linux
% distribtion's repositories.
%
% This class includes several packages by default so you don't have to
% call \usepackage for them. The important ones from a user's point
% of view are:
%
% * babel, with english as language
% * fontspec
% * calc
% * lastpage
% * graphicx
%
% The inclusion of the 'graphicx' packages means you can include
% graphics with \includegraphics. That command works fine with
% PNG, GIF and JPEG image files. For including an entire PDF document,
% use \includepdf.
%
% This class provides the following options additionally to those
% of scrartcl:
%
% [defaultfont]
%   Use this option if you can't install the Libertine/Biolinum font
%   families, which this class makes use of. It will then use LaTeX's
%   default font to typeset the document.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Identification part

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gd-document}[2016/03/26 0.1 Document class for TSC GD submissions]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declaration of options

\RequirePackage{ifthen}

\newboolean{usedefault@font}
\setboolean{usedefault@font}{false}

\DeclareOption{defaultfont}{\setboolean{usedefault@font}{true}}
\PassOptionsToClass{11pt}{scrartcl}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Execution of options

%\ExecuteOptions
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Package loading

\LoadClass{scrartcl}
\RequirePackage[english]{babel}
\RequirePackage[headsepline]{scrpage2}
\RequirePackage{fontspec}
\RequirePackage{calc}
\RequirePackage{lastpage}
\RequirePackage[letterpaper,top=2cm,bottom=3cm,left=2cm,right=2cm]{geometry}
\RequirePackage{graphicx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start of the real code

% Default values for the values the user has to
% specify.
\newcommand\@docnr{00/00}
\newcommand\@abstract{You need to supply an abstract with the
  \textbackslash{}abstract command!}
\renewcommand\@author{No Author}
\renewcommand\@date{1970-01-01}

% The commands the user uses for defining these values.
\newcommand\docnr[1]{\renewcommand{\@docnr}{#1}}
\renewcommand\abstract[1]{\renewcommand{\@abstract}{#1}}

% Command for typesetting the title page.
\renewcommand\maketitle{\thispagestyle{scrplain}
\noindent
\begin{minipage}[t]{0.4\linewidth}\noindent
  The Secret Chronicles of Dr.\,M.

  \vspace{\baselineskip}
  \@author
\end{minipage}
\hfill
\begin{minipage}[t]{0.4\linewidth}
\begin{flushright}
  \@date\\
  DNr. \@docnr
\end{flushright}
\end{minipage}

\vspace{2cm}

\begin{minipage}{\linewidth}
  \begin{center}\Large\noindent
    \@title
  \end{center}

  \begin{center}\noindent\large
    Abstract
  \end{center}

  \vspace{\baselineskip}

  \hspace*{\fill}
  \begin{minipage}{0.66\linewidth}
    \noindent\@abstract
  \end{minipage}
  \hspace*{\fill}
\end{minipage}

% Start the main page body, adjusting the margins.
% Note we must set the header width here, otherwise
% scrpage2 uses the old geometry's dimensions, which
% is wrong.
\newpage\pagestyle{scrheadings}
\newgeometry{top=2cm,bottom=3cm,left=2cm,right=7cm,marginparwidth=5cm}
\setheadwidth[0pt]{textwithmarginpar}
}

% Define the values for the headers
\cfoot[\thepage/\pageref{LastPage}]{\thepage/\pageref{LastPage}}
\lohead{TSC}
\cohead{\@author, \@title}
\rohead{DNr. \@docnr}

% Font to use
\ifthenelse{\boolean{usedefault@font}}{}{
  \setmainfont{Linux Libertine O}
  \setsansfont{Linux Biolinum O}
}
