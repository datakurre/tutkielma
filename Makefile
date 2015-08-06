TEXFILE := esimerkki
CHAPTERS := $(wildcard $(luvut)/*.tex)

all: $(TEXFILE).pdf

$(TEXFILE).pdf: $(TEXFILE).tex $(CHAPTERS)
	latexmk -pdf -use-make -quiet $(TEXFILE)

clean:
	latexmk -CA -quiet
	rm -fv *.bbl

.PHONY: all clean $(TEXFILE).pdf
