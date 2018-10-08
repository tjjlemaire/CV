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
\includegraphics[width=0.4cm,height=0.4cm,keepaspectratio]{{#1}}\ {#2}}
\normalfont \small}

\newcommand{\weblink}[2]{ % Used for web links
\color{blue1}\fontspec[Path = fonts/lato/]{Lato-RegIta}\fontsize{9pt}{9pt}\selectfont\ {\href{#1}{\faChain\ #2}} \normalfont \small}


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


%----------------------------------------------------------------------------------------
%	MULTILINE FRAMES
%----------------------------------------------------------------------------------------

\mdfdefinestyle{MultilineOvalBox}{
	rightmargin=0pt,
    leftmargin=0pt,
    skipabove=0pt,
    skipbelow=0pt,
    linecolor=blue1,
    outerlinewidth=0.1pt,
    roundcorner=2pt,
    innertopmargin=3pt,
    innerbottommargin=3pt,
    innerrightmargin=5pt,
    innerleftmargin=5pt,
    backgroundcolor=white}

\newcommand\mlovalbox[1]{ % Multiline oval box
    \begin{mdframed}[style=MultilineOvalBox] {#1} \end{mdframed} \vspace{-5pt}}

%----------------------------------------------------------------------------------------
%   WHEELCHART
%----------------------------------------------------------------------------------------

\newcommand{\wheelchart}[3]{%
    \begingroup\centering
    \def\innerradius{#2}%
    \def\outerradius{#1}%
    % Calculate total
    \pgfmathsetmacro{\totalnum}{0}%
    \foreach \value/\colour/\name in {#3} {%
        \pgfmathparse{\value+\totalnum}%
        \global\let\totalnum=\pgfmathresult%
    }%
    \begin{tikzpicture}

      % Calculate the thickness and the middle line of the wheel
      \pgfmathsetmacro{\wheelwidth}{\outerradius-\innerradius}
      \pgfmathsetmacro{\midradius}{(\outerradius+\innerradius)/2}

      % Rotate so we start from the top
      \begin{scope}[rotate=-90]

      % Loop through each value set. \cumnum keeps track of where we are in the wheel
      \pgfmathsetmacro{\cumnum}{0}
      \foreach \value/\width/\colour/\name in {#3} {
            \pgfmathsetmacro{\newcumnum}{\cumnum + \value/\totalnum*360}

            % Calculate the percent value
            \pgfmathsetmacro{\percentage}{\value/\totalnum*100}
            % Calculate the mid angle of the colour segments to place the labels
            \pgfmathsetmacro{\midangle}{-(\cumnum+\newcumnum)/2}

            % This is necessary for the labels to align nicely
            \pgfmathparse{
               (-\midangle>180?"west":"east")
            } \edef\textanchor{\pgfmathresult}
            \pgfmathparse{
               (-\midangle>180?"flush left":"flush right")
            } \edef\textalign{\pgfmathresult}
            \pgfmathsetmacro\labelshiftdir{1-2*(-\midangle<180)}

            % Draw the color segments. Somehow, the \midrow units got lost, so we add 'pt' at the end. Not nice...
            \filldraw[draw=white,fill=\colour] (-\cumnum:\outerradius) arc (-\cumnum:-(\newcumnum):\outerradius) --
            (-\newcumnum:\innerradius) arc (-\newcumnum:-(\cumnum):\innerradius) -- cycle;

            % Draw the data labels
            \draw  [*-,thin,black] node [append after command={(\midangle:\midradius pt) -- (\midangle:\outerradius + 1ex) -- (\tikzlastnode)}] at (\midangle:\outerradius + 1ex) [xshift=\labelshiftdir*0.5cm,inner sep=1ex, outer sep=0pt, text width=\width,anchor=\textanchor,align=\textalign,font=\small,text=darkgrey]{\name};
            % Set the old cumulated angle to the new value
            \global\let\cumnum=\newcumnum
        }
      \end{scope}

      % Glyhpicon in the center of the wheelchart
      %\node [color=black]{\huge{\faCode}};

    \end{tikzpicture}\par
    \endgroup
}


\newcommand{\pageframe}{\begin{tikzpicture}[overlay,remember picture]
\draw [line width=5pt,color=blue1]
    ($ (current page.north west) + (0.1cm, -0.1cm) $)
    rectangle
    ($ (current page.south east) + (-0.1cm, 0.1cm) $);
\draw [line width=2pt,color=blue1]
    ($ (current page.north west) + (0.3cm, -0.3cm) $)
    rectangle
    ($ (current page.south east) + (-0.3cm, 0.3cm) $);
\end{tikzpicture}}