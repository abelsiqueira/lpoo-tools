MANUAIS= network.pdf \
	 test-pc.pdf \
	 test-run.pdf \
	 user-pc.pdf

all: ${MANUAIS}

%.pdf: %.tex
	latexmk -pdf $<
