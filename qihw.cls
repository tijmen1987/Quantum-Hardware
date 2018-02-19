% Class to create Quantum Information assignment
%
% @author Cica Gustiani (cicagustiani@gmail.com)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qihw}[2017/03/17 Homework for Quantum Information]

\LoadClass[a4paper,11pt]{article}

% styling packages
\RequirePackage{fancyhdr}
\RequirePackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{empheq}
\RequirePackage{ifthen}
\RequirePackage{titling}

% scientific writing packages
\RequirePackage{braket}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage[labelfont=bf,font={small,it}]{caption}
\RequirePackage{dsfont}
\RequirePackage{qcircuit}
\RequirePackage{stmaryrd}
\RequirePackage{tikz}

% predefined variables 
\newcommand{\rem}[1]{{\sc Note:} {\it #1}}
\newcommand{\const}{\mathrm{const}}
\newcommand{\R}{{\mathbb R}}
\newcommand{\bR}{{\mathbb R}}
\newcommand{\bH}{{\textbf{H}}}
\newcommand{\bC}{{\mathbb C}}
\newcommand{\bL}{{\mathbb L}}
\newcommand{\E}{{\mathbb E}}
\newcommand{\bN}{{\mathbb N}}
\newcommand{\bZ}{{\mathbb Z}}
\newcommand{\Ir}{{\mathbb Z}}
\newcommand{\A}{{\mathcal A}}
\newcommand{\cA}{{\mathcal A}}
\newcommand{\cB}{{\mathcal B}}
\newcommand{\cD}{{\mathcal D}}
\newcommand{\cH}{{\mathcal H}}
\newcommand{\cC}{{\mathcal C}}
\newcommand{\cF}{{\mathcal F}}
\newcommand{\cS}{{\mathcal S}}
\newcommand{\rd}{{\rm d}}
\newcommand{\cU}{{\mathcal U}}
\newcommand{\cX}{{\mathcal X}}
\newcommand{\cK}{{\mathcal K}}
\newcommand{\id}{\mathds {I}}

% predefined notations 
\def\up{\uparrow}
\def\down{\downarrow}
\def\ua{\hbox{$\; \uparrow \; $}}
\def\da{\hbox{$\; \downarrow \; $}}

% predefined operators 
\newcommand{\sign}{\mathop{\rm sign}}
\newcommand{\spec}{\mathop{\rm spec}}
\newcommand{\supp}{\mathop{\mathrm{supp}}}
\newcommand{\diam}{\mathop{\mathrm{diam}}}
\newcommand{\norm}[1]{\left\Vert #1 \right\Vert}
\newcommand{\bracke}[1]{\left( #1 \right)}
\newcommand{\bracket}[1]{\left[ #1 \right]}
\newcommand{\brackeT}[1]{\left\{ #1 \right\}}
\newcommand{\brackET}[1]{\left| #1 \right|}
\newcommand{\eps}{\varepsilon}
\newcommand{\loc}{_{\text{loc}}}
\newcommand{\myproof}{\noindent {\bf Proof.}\quad}
\newcommand{\myendproof}{\hspace*{\fill}{{\bf \small Q.E.D.}} \vspace{10pt}}
\newcommand{\boxendproof}{\hspace*{\fill}{{$\Box$}} \vspace{10pt}}
\newcommand{\nn}{\nonumber}
\newcommand{\be}{\begin{equation}}
\newcommand{\ee}{\end{equation}}
\newcommand{\bea}{\begin{eqnarray}}
\newcommand{\eea}{\end{eqnarray}}
\newcommand{\beann}{\begin{eqnarray*}}
\newcommand{\eeann}{\end{eqnarray*}}
\newcommand{\eq}[1]{(\ref{#1})}
\newcommand{\bp}{{\bf p}}
\newcommand{\bq}{{\bf q}}
\newcommand{\bv}{{\bf v}}
\newcommand{\bu}{{\bf u}}
\newcommand{\bk}{{\bf k}}
\newcommand{\bx}{{\bf x}}
\newcommand{\by}{{\bf y}}
\newcommand{\bz}{{\bf z}}
\newcommand{\tb}{{\widetilde{b}}}
\newcommand{\tH}{{\widetilde{H}}}
\newcommand{\lb}{{\lambda}}
\newcommand{\e}{\mathrm{e}}
\newcommand{\db}{{\mkern2mu\mathchar'26\mkern-2mu\mkern-9mud}}
\newcommand{\abs}[1]{\lvert#1\rvert}

\newcommand{\hsp}[1]{\mathcal{H}_{#1}}
\DeclareMathOperator{\tr}{Tr}


%%%%%%%%%%% Commands   %%%%%%%%%%%%%%%%%%%%%

%% define entries \lecture, \duedate, \hwno, \university
\newcommand\lecture[1]{\renewcommand\@lecture{#1}}
\newcommand\@lecture{\@latex@error{No \noexpand\lecture given}\@ehc}

\newcommand\hwno[1]{\renewcommand\@hwno{#1}}
\newcommand\@hwno{\@latex@error{No \noexpand\hwno given}\@ehc}

\newcommand\duedate[1]{\renewcommand\@duedate{#1}}
\newcommand\@duedate{\@latex@error{No \noexpand\duedate given}\@ehc}

\newcommand\university[1]{\renewcommand\@university{#1}}
\newcommand\@university{\@latex@error{No \noexpand\university given}\@ehc}

%%%%%%%%%%% Header and titling things %%%%%%%%%%%%%%%%%
%% title 
 \renewcommand*{\maketitle}{%
 \begin{center}
 {\LARGE\bfseries Exercise Sheet \@hwno\unskip\strut\par\vspace{-.5em}}
 {\large\itshape\@title\unskip\strut\par\vspace{-.8em}}
 {\itshape\@university\unskip\strut\par}
 {\@author\unskip\strut\par\vspace{-.5em}}
 {Due: \@duedate}
 \end{center}
 }

 \setlength{\headheight}{18pt}
 \lhead{\itshape Exercise sheet \@hwno}
 \chead{\itshape\@lecture}
 \rhead{\itshape\@duedate}
 \lfoot{}\cfoot{\thepage}\rfoot{}

 \pagestyle{fancy}

 %%paragraph setting
 \setlength{\parskip}{.8em}
 \setlength\parindent{0pt}

 %%description inside item
 \newcommand\descr[1]{%
   \begingroup
   \par
   \parshape0
   #1\par
   \endgroup
 }

 %%figures captions afterward are just too much
 \setlength{\belowcaptionskip}{-.5em}


 %%%%%%%%% compilings %%%%%%%%%%%%%%%%
\ifx\pdfoutput\undefined                         %LaTeX
  \RequirePackage[ps2pdf,bookmarks=true]{hyperref}
  \hypersetup{ %
    pdfauthor   = {\@author},
    pdftitle    = {\@title},
    pdfcreator  = {LaTeX with hyperref package},
    pdfproducer = {dvips + ps2pdf}
  }
\else                                            %PDFLaTeX
  \RequirePackage[pdftex,bookmarks=true]{hyperref}
  \hypersetup{ %
    pdfauthor   = {\@author},
    pdftitle    = {\@title},
    pdfcreator  = {LaTeX with hyperref package},
    pdfproducer = {dvips + ps2pdf}
  }
\pdfadjustspacing=1
\fi

% Set up counters for problems and subsections
\newcounter{ProblemNum}
\newcounter{SubProblemNum}[ProblemNum]

\renewcommand{\theProblemNum}{\arabic{ProblemNum}}
\renewcommand{\theSubProblemNum}{\alph{SubProblemNum}}

\newcommand*{\anyproblem}[1]{\subsection*{#1}}

\newcommand*{\problem}[1]{\stepcounter{ProblemNum} %
\anyproblem{Problem \theProblemNum.\;#1\vspace{-.5em}}}

\newcommand*{\soln}[1]{\subsubsection*{#1}}
\newcommand*{\solution}{\soln{Solution}}

%\renewcommand*{\part}{\stepcounter{SubProblemNum} %
   % \soln{\theSubProblemNum)}}
   
  \renewcommand*{\part}{\stepcounter{SubProblemNum} %
    {\bf (\theSubProblemNum) }}

\renewcommand\labelenumi{{(\bfseries\theenumi)}}
