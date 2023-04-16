NAME=template
LATEXMKOPTS=-pdf #enable for forcing pdflatex
LATEXMK=latexmk $(LATEXMKOPTS)

all:
	$(LATEXMK) $(NAME)

clean:
	$(LATEXMK) -C
