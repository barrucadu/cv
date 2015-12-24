.PHONY: all clean

all: cv.pdf

clean:
	-@rm -r auto *.log *.aux *.out *.fdb_latexmk *.fls *.pdf 2>/dev/null

%.pdf: %.tex cv.cls
	-@latexmk -xelatex -pdf $<
