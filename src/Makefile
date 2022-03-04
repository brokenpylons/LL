.PHONY: all clean

all: paper.pdf

paper.pdf: paper.tex
	latexmk -lualatex $<

clean:
	latexmk -C
	rm -f *.bbl *.run.xml
