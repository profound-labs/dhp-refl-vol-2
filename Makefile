FILE=book_main

LATEX=lualatex
BIBTEX=bibtex

LATEX_OPTS=-interaction=nonstopmode -halt-on-error

all: book

book:
	$(LATEX) $(LATEX_OPTS) $(FILE).tex;

twice:
	$(LATEX) $(LATEX_OPTS) $(FILE).tex && $(LATEX) $(LATEX_OPTS) $(FILE).tex;

print-specs:
	org-ruby print-specs.org --translate textile | pandoc --from=textile --to=odt -o print-specs.odt;

view:
	evince $(FILE).pdf &

cover-front:
	$(LATEX) $(LATEX_OPTS) cover_front.tex

cover-back:
	$(LATEX) $(LATEX_OPTS) cover_back.tex

cover-spine:
	$(LATEX) $(LATEX_OPTS) cover_spine.tex
	+pdftk cover_spine.pdf cat 1-endL output cover_spine_L.pdf

cover:
	$(LATEX) $(LATEX_OPTS) cover.tex

cover-all:
	make cover-front
	make cover-back
	make cover-spine
	make cover

clean:
	+rm -fv $(FILE).{dvi,ps,pdf,aux,log,bbl,blg}

