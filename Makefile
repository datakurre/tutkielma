TEXFILE := esimerkki
CHAPTERS := $(wildcard $(luvut)/*.tex)

all: $(TEXFILE).pdf

$(TEXFILE).pdf: $(TEXFILE).tex $(CHAPTERS)
	@latexmk -pdf -recorder -interaction=nonstopmode -use-make -quiet $(TEXFILE)

watch:
	@latexmk -pvc -pdf -recorder -interaction=nonstopmode -use-make -quiet $(TEXFILE)

clean:
	@latexmk -C -quiet
	@rm -f *.bbl

.PHONY: all clean
