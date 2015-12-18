.PHONY: all clean

all: cv.tex
	-@latexmk -xelatex -pdf cv.tex

clean:
	-@rm -r auto *.log *.aux *.out *.fdb_latexmk *.fls *.pdf 2>/dev/null
