FILE=book_main

LATEX=lualatex
BIBTEX=bibtex

LANG=_PORT

LATEX_OPTS=-interaction=nonstopmode -halt-on-error

all: document

document: $(FILE)$(LANG).pdf

$(FILE).pdf: $(FILE)$(LANG).tex
	$(LATEX) $(LATEX_OPTS) $(FILE)$(LANG).tex;

again:
	$(LATEX) $(LATEX_OPTS) $(FILE)$(LANG).tex;

twice:
	$(LATEX) $(LATEX_OPTS) $(FILE)$(LANG).tex && $(LATEX) $(LATEX_OPTS) $(FILE)$(LANG).tex;

view:
	evince $(FILE)$(LANG).pdf &

cover-front:
	$(LATEX) $(LATEX_OPTS) cover_front$(LANG).tex

cover-back:
	$(LATEX) $(LATEX_OPTS) cover_back$(LANG).tex

cover-spine:
	$(LATEX) $(LATEX_OPTS) cover_spine$(LANG).tex
	+pdftk cover_spine$(LANG).pdf cat 1-endL output cover_spine$(LANG)_L.pdf

cover:
	$(LATEX) $(LATEX_OPTS) cover$(LANG).tex

cover-all:
	make cover-front
	make cover-back
	make cover-spine
	make cover

clean:
	+rm -fv $(FILE)$(LANG).{dvi,ps,pdf,aux,log,bbl,blg}

