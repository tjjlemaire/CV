%----------------------------------------------------------------------------------------
%	CLASS OPTIONS
%----------------------------------------------------------------------------------------

\ProvidesClass{cv}[2016/04/26 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\newif\ifenglish

%----------------------------------------------------------------------------------------
%   REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\usepackage[hmargin=0.5cm, vmargin=0.75cm]{geometry} % Specifies horizontal and vertical page margins
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
\usepackage{array}
\RequirePackage{fix-cm}
\usepackage[hidelinks]{hyperref} % Required for links

%----------------------------------------------------------------------------------------
%   BIBLIOGRAPHY
%----------------------------------------------------------------------------------------

\bibliographystyle{plain}
\usepackage{bibentry} % For publications list
\makeatletter\let\saved@bibitem\@bibitem\makeatother
\makeatletter\let\@bibitem\saved@bibitem\makeatother

%----------------------------------------------------------------------------------------
%   PATHS
%----------------------------------------------------------------------------------------

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
%   EXPLICIT SECTIONS WITH ASSOCIATED ICONS
%----------------------------------------------------------------------------------------



\newcommand{\details}{
    \vspace{-5pt}
    \address{Rue des Maraîchers 46}{1205 Genève}{CH}\ \ \ \email{theo.lemaire1@gmail.com}\ \ \ \mobilephone{+41 79 629 39 05}\ \ \ \linkedin{https://ch.linkedin.com/in/theolemaire}{theolemaire}
}

\newcommand{\experience}{
    \section{\texorpdfstring{\faBriefcase}\ \ \ifenglish experience \else expérience \fi}\sectionline}

\newcommand{\techskills}{
    \section{\texorpdfstring{\faWrench}\ \ \ifenglish technical Skills \else compétences techniques \fi}\sectionline}

\newcommand{\gpa}{
    \ifenglish GPA: \else Moyenne: \fi
}

\newcommand{\education}{
    \section{\texorpdfstring{\faGraduationCap} \ \ \ifenglish education \else formation \fi}\sectionline

    \subsection{\ifenglish MSc in Bioengineering \else Master en Bioingénierie \fi}
    \subsection{\ifenglish Minor in Neuroprosthetics \else Mineur en Neuroprothèses \fi}
    \descript{\href{http://www.epfl.ch}{EPF Lausanne}}
    \timeplace{Sept 2013 - Sept 2015}{Lausanne, CH}
    \gpa5.34 / 6.0
    \sectionspace

    \subsection{\ifenglish BSc in Life Sciences \& Technologies\else Bachelor en Sciences \& Technologies du Vivant \fi}
    \descript{\href{http://www.epfl.ch}{EPF Lausanne}}
    \timeplace{Sept 2009 -July 2012}{Lausanne, CH}
    \gpa4.92 / 6.0
    \sectionspace

    \subsection{\ifenglish Scientific baccalaureate \else Baccalauréat scientifique \fi}
    \descript{Lycée Int. Ferney Voltaire}
    \timeplace{Sept 2006 - July 2009}{Ferney, FR}
    \gpa18.71 / 20.0
    \sectionspace
}

\newcommand{\coursework}{
    \section{\texorpdfstring{\faBook} \ \ \ifenglish coursework \else cours suivis \fi}\sectionline}

\newcommand{\languages}{
    \section{\texorpdfstring{\faComments} \ \ \ifenglish languages \else langues \fi}\sectionline

    \noindent\begin{tabular}{@{}ll}
    \textbf{\ifenglish French \else Français \fi} & \fivecircles \\
    \textbf{\ifenglish English \else Anglais \fi} & \fivecircles \\
    \textbf{\ifenglish German \else Allemand \fi} & \threecircles \\
    \textbf{\ifenglish Russian \else Russe \fi} & \onecircle \\
    \end{tabular}
    \sectionspace
}

\newcommand{\hobbies}{
    \section{\texorpdfstring{\faHeart}\ \ hobbies}\sectionline

    \noindent\begin{tabular}{@{}c@{}c@{}c@{}c@{}}
        \glyph{atom.pdf}{Science} &
        \glyph{taekwondo.pdf}{Taekwondo} &
        \glyph{football.pdf}{Football} &
        \glyph{television.pdf}{\ifenglish TV Shows \else Séries TV \fi}\\
        \glyph{skiing.pdf}{\ifenglish Skiing \else Ski  \fi} &
        \glyph{mountains.pdf}{\ifenglish Hiking \else Randonnée \fi} &
        \glyph{cycling.pdf}{\ifenglish Cycling \else Vélo \fi} &
        \glyph{travel.pdf}{\ifenglish Travels \else Voyages \fi}
    \end{tabular}
}

\newcommand{\publications}{
    \section{\texorpdfstring{\faFileText}\ \ publications}\sectionline
    \nobibliography{mypublications}
    \begin{itemize}
        \item \bibentry{lemaire_understanding_2019} \weblink{https://tnewebnice.epfl.ch/viewer/}{Web app}
    \end{itemize}
}

\newcommand{\projects}{
    \section{\texorpdfstring{\faClipboard} \ \ \ifenglish academic projects \else projets académiques \fi}\sectionline}

\newcommand{\otherskills}{
    \centering{
        \cvskill{git.pdf}{Git} \tbl{}
        \cvskill{illustrator.pdf}{Illustrator} \tbl{}
        \cvskill{blank.pdf}{\hspace{-5pt}\LaTeX} \tbl{}
        \cvskill{labview.pdf}{LabVIEW}
    }
}


%----------------------------------------------------------------------------------------
%   TABLES
%----------------------------------------------------------------------------------------

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

%----------------------------------------------------------------------------------------
%	CIRCLE RATINGS
%----------------------------------------------------------------------------------------

\newcommand{\onecircle}{\faCircle\ \faCircleO\ \faCircleO\ \faCircleO\ \faCircleO}
\newcommand{\twocircles}{\faCircle\ \faCircle\ \faCircleO\ \faCircleO\ \faCircleO}
\newcommand{\threecircles}{\faCircle\ \faCircle\ \faCircle\ \faCircleO\ \faCircleO}
\newcommand{\fourcircles}{\faCircle\ \faCircle\ \faCircle\ \faCircle\ \faCircleO}
\newcommand{\fivecircles}{\faCircle\ \faCircle\ \faCircle\ \faCircle\ \faCircle}

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

