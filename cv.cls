%----------------------------------------------------------------------------------------
%	CLASS OPTIONS AND REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\ProvidesClass{cv}[2016/04/26 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\usepackage[hmargin=0.5cm, vmargin=0.75cm]{geometry} % Specifies horizontal and vertical page margins
\usepackage[hidelinks = true]{hyperref} % Required for links
\usepackage[usenames,dvipsnames]{xcolor} % Required for custom colors
\usepackage{fontspec} % Required for specifying custom fonts in XeLaTeX
\usepackage{titlesec} % Required for customizing section/subsection/etc titles
\usepackage{fontawesome, marvosym} % For symbols
\usepackage{graphicx} % For graphics
\usepackage{tikz} % For geometrical shapes
\usetikzlibrary{arrows} % For arrows
\usetikzlibrary{calc} % For page frames
\usepackage{fancybox} % For oval boxes
\usepackage[framemethod=TikZ]{mdframed} % For multiline oval boxes
\usepackage{xifthen} % For optional command arguments
%\usepackage{pagecolor} % Background color of the document
\usepackage{array}
\RequirePackage{fix-cm}


\graphicspath{{./images/}} % Path to graphic files


%----------------------------------------------------------------------------------------
%   SHORTCUTS
%----------------------------------------------------------------------------------------

\def\tbl{\textbullet}
\def\approx{\textasciitilde}
\def\CC{{C\nolinebreak[4]\hspace{-.05em}{\large\bf ++}}}

%----------------------------------------------------------------------------------------
%   COLORS
%----------------------------------------------------------------------------------------

\definecolor{white}{HTML}{FFFFFF} % For document background
\definecolor{darkgrey}{HTML}{2b2b2b} % For main title, subsection and text content
\definecolor{lightgrey}{HTML}{6A6A6A} % For details
\definecolor{blue1}{HTML}{0057CC} % For sections, descriptions and non-text content
\definecolor{blue2}{HTML}{1F487F} % Monochromatic variant
\definecolor{blue3}{HTML}{006CFF} % Monochromatic variant
\definecolor{blue4}{HTML}{4C98FF} % Monochromatic variant
\definecolor{blue5}{HTML}{B0D3FF} % Monochromatic variant
\definecolor{bg}{HTML}{FCFCFC}

%----------------------------------------------------------------------------------------
%   FONTS
%----------------------------------------------------------------------------------------

% The primary font for content text; defines bold, italic and bold-italic as well
\setmainfont[Color=darkgrey,
    Path = fonts/lato/,
    BoldItalicFont=Lato-RegIta,
    BoldFont=Lato-Reg,
    ItalicFont=Lato-LigIta]
    {Lato-Lig}

%----------------------------------------------------------------------------------------
%	HEADER
%----------------------------------------------------------------------------------------

\newcommand{\name}[1]{ % Used for the name
    \color{darkgrey}\fontspec[Path = fonts/raleway/]{Raleway-Bold}\fontsize{50pt}{50pt}\selectfont {#1} \normalfont \normalsize \vspace{5pt}}

\newcommand{\tag}[1]{ % Used for the tag line under the name
    \color{blue1}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{13pt}{14pt}\selectfont #1 \normalfont \normalsize \vspace{10pt}}

\newcommand\address[3]{% Used for the postal address, with glyphicon
    \color{blue1} \faHome\ \textbf{#1} \tbl{} \textbf{#2} \tbl{} \textbf{#3}}

\newcommand\email[1]{% Used for the email, with glyphicon
    \color{blue1} \faAt\ \href{mailto:#1}{\textbf{#1}}}

\newcommand\mobilephone[1]{% Used for the mobile phone, with glyphicon
    \color{blue1} \faMobilePhone\ \textbf{#1}}

\newcommand\linkedin[2]{% Used for the Linkedin profile, with glyphicon
    \color{blue1} \faLinkedinSquare\ //\href{#1}{\textbf{#2}}}


%----------------------------------------------------------------------------------------
%   COLUMN ORGANISATION
%----------------------------------------------------------------------------------------

\newcommand\hspaceleft{\noindent\hspace{10pt}}
\newcommand\hsepcol{\hspace{20pt}}

%----------------------------------------------------------------------------------------
%	SECTIONS, SUBSECTIONS, DESCRIPTIONS & DETAILS STYLING AND SPACING
%----------------------------------------------------------------------------------------

\titlespacing{\section}{0pt}{0pt}{0pt} % Removes the spacing around the main section titles
\titlespacing{\subsection}{0pt}{0pt}{0pt} % Removes the spacing around the subsections
\newcommand{\sectionspace}{\vspace{8pt}} % Defines a command to add a set amount of space after sections and subsections
\newcommand{\sectionline}{\color{blue1} \vspace{-5pt}\noindent\rule{1.0\columnwidth}{2.0pt}\vspace{6pt}} % Custom line under the section title

\titleformat{\section}{ % Customize the large section titles
\color{blue1}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{}{0em}{}

\titleformat{\subsection}{ % Customize the subsections
\color{darkgrey}\fontspec[Path = fonts/raleway/]{Raleway-Bold}\fontsize{11pt}{12pt}\selectfont}{}{0em}{}

\newcommand{\descript}[1]{ % Used for the descriptions
\color{blue1}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-SemiBold}\fontsize{10pt}{10pt}\selectfont {#1 \\} \normalfont \normalsize}

\newcommand{\runsubsection}[1]{ % Used for subsections with description on the same line
\color{darkgrey}\fontspec[Path = fonts/raleway/]{Raleway-Bold}\fontsize{11pt}{12pt}\selectfont {#1} \normalfont \normalsize}

\newcommand{\timeplace}[2]{ % Used for times and places
\color{lightgrey}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{9pt}{12pt}\selectfont {\faCalendar\ #1 \ \ \ \faMapMarker\ #2\\} \normalfont \normalsize}

\newcommand{\cvskill}[2]{ % Used for skills title
\color{darkgrey}\fontspec[Path = fonts/raleway/]{Raleway-Bold}\fontsize{11pt}{12pt}\selectfont {
\includegraphics[width=0.4cm,height=0.4cm,keepaspectratio]{{#1}}\ {#2}} \normalfont \small}

\newcommand{\weblink}[2]{ % Used for web links
\color{blue1}\fontspec[Path = fonts/lato/]{Lato-RegIta}\fontsize{9pt}{9pt}\selectfont\ {\href{#1}{\faChain\ #2}} \normalfont \small}


%----------------------------------------------------------------------------------------
%   TABLES
%----------------------------------------------------------------------------------------

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

%----------------------------------------------------------------------------------------
%	STAR RATINGS
%----------------------------------------------------------------------------------------

\newcommand{\halfstar}{\faStarHalfFull\ \faStarO\ \faStarO\ \faStarO\ \faStarO}
\newcommand{\onestar}{\faStar\ \faStarO\ \faStarO\ \faStarO\ \faStarO}
\newcommand{\onestarhalf}{\faStar\ \faStarHalfFull\ \faStarO\ \faStarO\ \faStarO}
\newcommand{\twostars}{\faStar\ \faStar\ \faStarO\ \faStarO\ \faStarO}
\newcommand{\twostarshalf}{\faStar\ \faStar\ \faStarHalfFull\ \faStarO \faStarO}
\newcommand{\threestars}{\faStar\ \faStar\ \faStar\ \faStarO\ \faStarO}
\newcommand{\threestarshalf}{\faStar\ \faStar\ \faStar\ \faStarHalfFull\ \faStarO}
\newcommand{\fourstars}{\faStar\ \faStar\ \faStar\ \faStar\ \faStarO}
\newcommand{\fourstarshalf}{\faStar\ \faStar\ \faStar\ \faStar\ \faStarHalfFull}
\newcommand{\fivestars}{\faStar\ \faStar\ \faStar\ \faStar\ \faStar}

%----------------------------------------------------------------------------------------
%	ICONS
%----------------------------------------------------------------------------------------

\newcommand*\glyph[2]{ % glyphicon with text below
    \tikz
    \node [minimum size=0.6cm, text=white,label=below:{#2},
        path picture={\node at (path picture bounding box.center){
            \color{blue1}
            \includegraphics[width=0.5cm,height=0.5cm,keepaspectratio]{{#1}}
    };}]{};}

\newcommand*\cglyph[2]{ % glyphicon in circle with text below
	\tikz
	\node [circle, draw, minimum size=0.8cm, text=white,label=below:{#2},
		path picture={\node at (path picture bounding box.center){
			\includegraphics[width=0.5cm,height=0.5cm,keepaspectratio]{{#1}}
	};}]{};}

\newcommand*\flag[1] { % country flag
    \includegraphics[width=.3cm]{{#1}}}

