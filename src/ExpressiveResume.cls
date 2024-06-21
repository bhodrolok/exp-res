\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ExpressiveResume}[2021/12/13 Expressive Resume Template]

%% ----- Options -----
% https://www.latex-project.org/help/documentation/clsguide.pdf

% None currently

%% ----- Parent Class -----
\LoadClass{Expressive}

%% ----- Required Packages -----
%% Define page layout
\RequirePackage[margin=0.5in]{geometry}
\pagestyle{empty}

%% ----- Custom Commands -----
% Header Block
\newkeycommand{\resumeheader}[
    firstname,middleinitial,lastname,
    email,
    website, % Personal website
    phone,  % Must be in XXX-XXX-XXXX format to become a valid link
    linkedin,
    github,
    city,  % Ignored if `state` is not also provided
    state,
    qrcode,  % Path to an image of a 1000x1000px QR Code
    fixobjectivespacing  % Fixes issues with vertical spacing when using QR Code + Objective statement.
]{
    \begin{flushleft}
        \nametitle{\commandkey{firstname}}{\ifcommandkey{middleinitial}{\commandkey{middleinitial}. }{}\commandkey{lastname}}
        % Order ==> Website | Email | Phone | LinkedIn | GitHub | City, State
        {%
            \ifcommandkey{website}%
            {%
                \website{\commandkey{website}}%
                \ifcommandkey{email}{\contactseparator}%
                {\ifcommandkey{phone}{\contactseparator}%
                    {\ifcommandkey{linkedin}{\contactseparator}%
                        {\ifcommandkey{github}{\contactseparator}%
                            {\ifcommandkey{state}{\contactseparator}{}}}}}%
            }%
            {}%
            \ifcommandkey{email}%
            {%
                \email{\commandkey{email}}%
                \ifcommandkey{phone}{\contactseparator}%
                {\ifcommandkey{linkedin}{\contactseparator}%
                    {\ifcommandkey{github}{\contactseparator}%
                        {\ifcommandkey{state}{\contactseparator}{}}}}
            }%
            {}%
            \ifcommandkey{phone}%
            {%
                \phone{\commandkey{phone}}%
                \ifcommandkey{linkedin}{\contactseparator}%
                {\ifcommandkey{github}{\contactseparator}%
                    {\ifcommandkey{state}{\contactseparator}{}}}%
            }%
            {}%
            \ifcommandkey{linkedin}%
            {%
                \linkedin{\commandkey{linkedin}}%
                \ifcommandkey{github}{\contactseparator}%
                {\ifcommandkey{state}{\contactseparator}{}}%
            }%
            {}%
            \ifcommandkey{github}%
            {%
                \github{\commandkey{github}}%
                \ifcommandkey{state}{\contactseparator}{}%
            }%
            {}%
            \ifcommandkey{state}%
            {\residence{\ifcommandkey{city}{\commandkey{city}, }{}\commandkey{state}}}%
            {}%
        }
    \end{flushleft}
    
    \ifcommandkey{qrcode}{%
        % QR Code - Generated with https://www.logodesign.net/qrcode-generator
        \begin{tikzpicture}[remember picture,overlay]%
            \node[anchor=north east,yshift=-.5in,xshift=-.5in]%
            at (current page.north east)%
            {\includegraphics[width=.1\linewidth]{\commandkey{qrcode}}};
        \end{tikzpicture}
        \vspace{-12pt}
        \ifcommandkey{fixobjectivespacing}{\vspace{-10pt}}{}
    }{}
}
\newcommand{\objective}[1]{%
    \begin{flushleft}
        \textsc{Objective}: #1
    \end{flushleft}
}

% Usage: \projectexperience{ProjectName}{ProjectType}{TechStack}{ProjectURL}
\newcommand{\projectexperience}[5]{%
    \noindent\role{#1}{#2} \pipe \emph{ {#3} }\hfill \href{#4}{\faIcon{terminal} Link}\par
    #5
    \vspace{7pt}
}

% Usage: \experience{Title}{Company}{StartDate}{EndDate}{Description}
\newcommand{\experience}[5]{%
    \noindent\role{#1}{#2}\hfill\tenure{#3}{#4}\par
    #5
    \vspace{7pt}
}

% Usage: \altexperience{CertificationName}{CertificationType}{Date}
\newcommand{\altexperience}[3]{%
    \noindent\role{#1}{#2}\hfill\parttenure{#3}\par
    \vspace{7pt}
}

% Usage: \workexperience{JobTitle}{Company}{StartDate}{EndDate}{Location}{Description}
\newcommand{\workexperience}[6]{%
    \noindent\textbf{#1}\hfill\tenure{#3}{#4}\newline
    \noindent\emph{#2}\hfill\location{#5}\par
    #6
    \vspace{7pt}
}

% Usage: \altworkexperience{JobTitle}{Company}{StartDate}{EndDate}{Location}{Description}
\newcommand{\altworkexperience}[7]{%
    \noindent\subrole{#1}{#2}{#3}{#4}\hfill\tenure{#5}{#6}\par
    #7
    \vspace{7pt}
}

% Usage: \achievement{Bullet point.}
\newcommand{\achievement}[1]{%
    \begin{itemize}
        \small{\item #1}
    \end{itemize}
}

% Usage: \education{Degree}{Major}{StartDate}{EndDate}{School}{Location}
\newcommand{\education}[7]{%
    \noindent\role{#1}{#2}\hfill\tenure{#3}{#4}\newline
    \noindent\emph{#5}\hfill\location{#6}\par
    #7
    \vspace{7pt}
}


%% ----- Four Required Configurations -----
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
\setlength{\textwidth}{7.5in}
\setlength{\textheight}{10in}
\pagenumbering{arabic}
