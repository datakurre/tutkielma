BASH = /bin/bash
SED = /usr/bin/sed
DARCS = /sw/bin/darcs
BIBTEX = /sw/bin/bibtex
PDFLATEX = /sw/bin/pdflatex
DOT = ~/../Shared/Applications/Graphviz.app/Contents/MacOS/dot
CIRCO = ~/../Shared/Applications/Graphviz.app/Contents/MacOS/circo

%.pdf: %.dot

	$(DOT) -Gmargin=0.01 -Nheight=0 -Gfontname=Palatino-Roman -Nfontname=Palatino-Roman -Efontname=Palatino-Roman -Gfontsize=10.00 -Nfontsize=10.00 -Efontsize=10.00 -Gresolution=72.50 "$<" -Tepdf -o`echo "$<"|$(SED) -e "s/\.dot//"`.pdf

%.pdf: %.circo

	$(CIRCO) -Gmargin=0.01 -Nheight=0 -Gfontname=Palatino-Roman -Nfontname=Palatino-Roman -Efontname=Palatino-Roman -Gfontsize=10.00 -Nfontsize=10.00 -Efontsize=10.00 -Gresolution=72.50 "$<" -Tepdf -o`echo "$<"|$(SED) -e "s/\.circo//"`.pdf

%.pdf: %.tex luvut/*.tex

	$(PDFLATEX) "$<"
	$(BIBTEX) `echo "$<"|$(SED) -e "s/\.tex//"`
	$(PDFLATEX) "$<"
	$(BIBTEX) `echo "$<"|$(SED) -e "s/\.tex//"`
	$(PDFLATEX) "$<"
	$(PDFLATEX) "$<"

	find . -name "*.out"|xargs rm
	find . -name "*.log"|xargs rm
	find . -name "*.toc"|xargs rm
	find . -name "*.blg"|xargs rm
	find . -name "*.bbl"|xargs rm
	find . -name "*.aux"|xargs rm

all:
	ls -1 kuviot/*.dot|$(SED) -e "s/\.dot/\.pdf/"|xargs -I foo make foo
	ls -1 kuviot/*.circo|$(SED) -e "s/\.circo/\.pdf/"|xargs -I foo make foo
	ls -1 *.tex|$(SED) -e "s/\.tex/\.pdf/"|xargs -I foo make foo

clean:
	find . -name "*.out"|xargs rm
	find . -name "*.log"|xargs rm
	find . -name "*.toc"|xargs rm
	find . -name "*.blg"|xargs rm
	find . -name "*.bbl"|xargs rm
	find . -name "*.aux"|xargs rm

	ls -1 kuviot/*.dot|$(SED) -e "s/\.dot/\.pdf/"|xargs -I foo $(BASH) -c "if [ -f foo ]; then rm foo; fi"
	ls -1 kuviot/*.circo|$(SED) -e "s/\.circo/\.pdf/"|xargs -I foo $(BASH) -c "if [ -f foo ]; then rm foo; fi"

	ls -1 *.tex|$(SED) -e "s/\.tex/\.pdf/"|xargs -I foo $(BASH) -c "if [ -f foo ]; then rm foo; fi"

sync:
	ls -1 *.tex|$(SED) -e "s/\.tex/\.pdf/"|xargs -I foo $(BASH) -c "if [ -f foo ]; then cp foo _repo/; fi"
	rsync -Hauv --times --delete-after _repo/ atsoukka@jalava.cc.jyu.fi:html/pub/tutkielma
