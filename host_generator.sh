#!/bin/bash
tmptex=tmp.tex

awk '/^143.106.118/ {print $0}' /etc/hosts > hosts.current

cat > $tmptex << EOF
\documentclass[12pt]{article}
\usepackage[top=3cm,bottom=3cm,left=2cm,right=2cm]{geometry}
\pagestyle{empty}

\begin{document}
\begin{center}
\Large
\begin{tabular}{|l|l|} \\hline
$(awk '/^143.106.118/ {printf "{\\bf %s} \& \\verb+%s+ \\\\ \\hline\n", $1, $2}' /etc/hosts)
\end{tabular}
\end{center}
\end{document}
EOF

latexmk -silent -pdf $tmptex
cp ${tmptex//.tex/.pdf} hosts.pdf
rm -rf tmp.*
