.PHONY: all clean

all: paper.pdf

paper.pdf: paper.tex
	LANG= latexmk -lualatex $<

clean:
	latexmk -C
	rm -f *.bbl *.run.xml
