\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simplecv}[2023/09/18 Roberto Olvera Hernández - Simple CV]

% Class Options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{letterpaper,8pt}
\ProcessOptions\relax

% Load base class
\LoadClass{article}

\RequirePackage{fontawesome}
\RequirePackage{enumitem}

\setlength{\parindent}{0pt}

% Packages
\RequirePackage{fontspec} % Nuevas fuentes
\RequirePackage{setspace}

% --------------------------
% Global Definitions
% --------------------------
\def\name#1{\gdef\@name{#1}}
\def\title#1{\gdef\@title{#1}}
\def\email#1{\gdef\@email{#1}}
\def\location#1#2#3{\gdef\@location{#1, #2, #3}}
\def\phone#1#2{\gdef\@phone{(#1) #2}}
\def\linkedin#1{\gdef\@linkedin{#1}}
\def\github#1{\gdef\@github{#1}}

% --------------------------
% Symbols
% --------------------------
\newcommand{\interests}{\faLightbulbO\hspace{0.5em}}
\newcommand{\competences}{\faGroup\hspace{0.5em}}
\newcommand{\education}{\faGraduationCap\hspace{0.5em}}
\newcommand{\research}{\faFlask\hspace{0.5em}}
\newcommand{\job}{\faBriefcase\hspace{0.5em}}
\newcommand{\hardskill}{\faGears\hspace{0.5em}}
\newcommand{\group}{\faGroup\hspace{0.5em}}
\newcommand{\other}{\faPlusCircle\hspace{0.5em}}
\newcommand{\volunteer}{\faHeart\hspace{0.5em}}
\newcommand{\publications}{\faBook\hspace{0.5em}}
\newcommand{\achievement}{\faTrophy\hspace{0.5em}}
\newcommand{\lang}{\faLanguage\hspace{0.5em}}
\newcommand{\code}{\faCode\hspace{0.5em}}
\newcommand{\courses}{\faCertificate\hspace{0.5em}}

% --------------------------
% Colors
% --------------------------
\RequirePackage{xcolor}
\definecolor{AccentBlue}{HTML}{003844}
\definecolor{AccentTeal}{HTML}{42858c}
\definecolor{AccentYellow}{HTML}{f0c05a}
\definecolor{AccentPurple}{HTML}{776A83}
\definecolor{TitleBlack}{HTML}{2E2E2E}

% --------------------------
% CV Header
% --------------------------
\newcommand{\makecvheader}[1]{
    \begin{center}
        {\Huge\color{AccentBlue}\sffamily 
            \bfseries\@name
        }\\ \medskip
        {\color{darkgray}\sffamily \@title}\\ \bigskip
        {\small
            {\faEnvelope\hspace{0.1em} \href{mail.to//\@email}{\@email} } \hspace{0.25em}
            {\faPhone\hspace{0.1em} \@phone} \hspace{0.25em}

            \ifstrequal{#1}{L}{
                {\faMapMarker\hspace{0.1em} \@location\nobreak{}} \hspace{0.25em}
              }{}

            {\faLinkedin\hspace{0.1em} \@linkedin} \hspace{0.25em}
            {\faGithub\hspace{0.1em} \@github}
        }
    \end{center}
}

% --------------------------
% CV Section
% --------------------------
\newcommand{\cvsection}[1]{
    %\begin{center}
        {\large\bfseries\color{AccentBlue}\sffamily #1}\\
        %{\color{AccentBlue}\rule{\linewidth}{1.25pt}\par}
        {\color{AccentBlue}\rule{\linewidth}{1.25pt}\smallskip}
    %\end{center}
}

% --------------------------
% CV Subsection
% --------------------------
\newcommand{\cvsubsection}[1]{
    \smallskip
    {\normalsize\bfseries\color{AccentTeal}\sffamily #1}
    \medskip
}

% --------------------------
% CV Event
% --------------------------
\newcommand{\cvevent}[6]{
\begin{tabular*}{\linewidth}{p{0.12\linewidth} p{0.83\linewidth}}
    \ifstrequal{#4}{}{\small #5}{\small #4 - #5} % Any Text (not required)                          
    & {\small\bf #1}\\
    {} 
    & {\sffamily\footnotesize #2 \hfill #3}
    \ifstrequal{#6}{}{}{\\&{\footnotesize #6}} % Any Text (not required)                          
\end{tabular*}
\vspace{-0.5em}
%    \begin{tabular*}{\linewidth}{p{0.125\linewidth} p{0.85\linewidth}}
%        {\small\it #4 - #5} & {\bf #1}\\ % Position
%                            & {\sffamily\footnotesize\color{gray} #2 \hfill  #3}
%        \ifstrequal{#6}{}{}{\\&{\footnotesize #6}} % Any Text (not required)                          
%    \end{tabular*}
%    \vspace{-0.5em}
}

% --------------------------
% CV Skill
% --------------------------
\newcommand{\cvskill}[2]{%
{\small\color{darkgray}\sffamily #1}\hfill
\foreach \x in {1,...,5}{%
  \space{\ifnumgreater{\x}{#2}{\color{black!30}}{\color{AccentTeal}}\faCircle}}\par%
} 

% --------------------------
% CV Skill
% --------------------------
\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=black!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{\small\sffamily #1};
}

% --------------------------
% Document Header
% --------------------------
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{tikzpagenodes}

\pagestyle{fancy}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhead[L]{\begin{tikzpicture}[remember picture,overlay]
            \draw  let \p1=($(current page.north)-(current page header area.south)$),
                \n1={veclen(\x1,\y1)} in
            node [inner sep=0,outer sep=0,below right] 
                at (current page.north west){\includegraphics[width=\paperwidth]{foot.png}};
            \end{tikzpicture}}
    \cfoot{}

    \fancypagestyle{firstpage}{%
        \fancyhead[L]{\begin{tikzpicture}[remember picture,overlay]
            \draw  let \p1=($(current page.north)-(current page header area.south)$),
                \n1={veclen(\x1,\y1)} in
            node [inner sep=0,outer sep=0,below right] 
                at (current page.north west){\includegraphics[width=\paperwidth]{header.png}};
            \end{tikzpicture}}

        %\fancyfoot[R]{\begin{tikzpicture}[remember picture,overlay]
            %\draw  let \p1=($(current page footer area.north)-(current page.south)$),
                    %\n1={veclen(\x1,\y1)} in
            %node [inner sep=0,outer sep=0,above right] 
                    %at (current page.south west){\includegraphics[width=\paperwidth]{foot.png}};
            %\end{tikzpicture}}
    }

\endinput
