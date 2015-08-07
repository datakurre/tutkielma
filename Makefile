TEXFILE := esimerkki
CHAPTERS := $(wildcard $(luvut)/*.tex)

all: $(TEXFILE).pdf

$(TEXFILE).pdf: $(TEXFILE).tex $(CHAPTERS)
	@latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make -quiet $(TEXFILE)

watch:
	@latexmk -pvc -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make -quiet $(TEXFILE)

clean:
	@latexmk -CA -quiet
	@rm -f *.bbl

.PHONY: all clean
