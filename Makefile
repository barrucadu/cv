LATEX := xelatex
PDF := cv.pdf

.PHONY: all clean

all: $(PDF)

clean:
	-@rm -r $(PDF) auto *.log *.aux

%.pdf: %.tex
	@$(LATEX) $^
	@$(LATEX) $^
