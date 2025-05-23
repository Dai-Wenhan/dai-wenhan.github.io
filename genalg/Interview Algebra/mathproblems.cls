\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mathproblems}[pku Maths problem sheet class]

\LoadClass[12pt,a4paper]{exam} 

%space out the lines by 25% more than the default (basically 1.5 line spacing)
\linespread{1}

% General thinking is that 12pt font, with 1.25 spread, black on white text,
% gives a good readable document for most people. For those that benefit
% from larger fonts many will be best zooming / expanding the document on
% screen or simply printing enlarged on A3 as that will best preserve the
% formatting rather than enlarging the font whilst still fitting into an A4
% sized space.  For those that benefit from a different background colour
% this is likely easiest achieved if the document is on white and then
% software or a film is used to change the white to cream, blue etc

%load in some commonly needed packages 
\RequirePackage{ifthen,amsmath,amssymb,amsthm,bm,graphicx,color}

%increase the printed page area width
\extrawidth{0.5cm}

%increase header space on title page only
\extraheadheight[1.5cm]{0cm}

%setup page headers/footers for first and subsequent pages
\pagestyle{headandfoot}
\lhead{}
\chead[\bf \thecourse \vspace{4pt}  \\
    \it \thestudentname \\]{}
\rhead[]{\bfseries \thecourse}
\lfoot{\footnotesize BICMR, Peking University.\\ \thecontact}
\cfoot{}
\rfoot{Page \thepage{} of \numpages}
\footrule

% define newcommands for user set page header details
\newcommand*{\pkuterm}[1]{\def\thepkuterm{#1}}
\newcommand*{\id}[1]{\def\theid{#1}}
\newcommand*{\course}[1]{\def\thecourse{#1}}
\newcommand*{\sheetnumber}[1]{\def\thesheetnumber{#1}}
\newcommand*{\studentname}[1]{\def\thestudentname{#1}}
\newcommand*{\sheettitle}[1]{\def\thesheettitle{#1}}
\pkuterm{}\course{}\sheetnumber{}\sheettitle{}

% define a command for user to set some contact info in the footer
\newcommand*{\contact}[1]{\def\thecontact{#1}}
\contact{}

% revised question command that tries to encourage page breaks
% to lie between questions rather than within questions
\newcommand{\miquestion}[1][]{
  \ifthenelse{\equal{#1}{}}{\question}{\question[#1]}
}

% do not put a box/frame around printed solutions
\unframedsolutions

\renewcommand{\subpartlabel}{(\thesubpart)}

%if you produce a problem sheet with solutions but want to strip the
%solutions from the tex file (e.g. to give to a student who needs to use a
%screen reader) you could run one of
%sed '/\\begin{solution}/,/\\end{solution}/d' file.tex > file-nosoln.tex
%perl -ne 'print unless /^\\begin\{solution\}/ .. /^\\end\{solution\}/' file.tex > file-nosoln.tex
