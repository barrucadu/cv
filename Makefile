PDFs := $(patsubst %.tex,%.pdf,$(wildcard cv-*.tex))

.PHONY: all clean

all: $(PDFs)

clean:
	-@rm -r auto *.log *.aux *.out *.fdb_latexmk *.fls *.pdf 2>/dev/null

%.pdf: %.tex metacv.tex barrucadu-cv.cls extra-tex-files/*
	-@latexmk -xelatex $<
