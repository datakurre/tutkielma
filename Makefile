%.pdf: %.tex luvut/*.tex

	pdflatex "$<"
	bibtex `echo "$<"|sed -e "s/\.tex//"`
	pdflatex "$<"
	bibtex `echo "$<"|sed -e "s/\.tex//"`
	pdflatex "$<"
	pdflatex "$<"

all:
	ls -1 *.tex|sed -e "s/\.tex/\.pdf/g"|xargs -I foo make foo

clean:
	ls -1 *.tex|sed -e "s/\.tex/\.pdf/g"|xargs -I foo rm -f foo
	find . -name "*.out" -print0|xargs -0 rm
	find . -name "*.log" -print0|xargs -0 rm
	find . -name "*.toc" -print0|xargs -0 rm
	find . -name "*.blg" -print0|xargs -0 rm
	find . -name "*.bbl" -print0|xargs -0 rm
	find . -name "*.aux" -print0|xargs -0 rm
