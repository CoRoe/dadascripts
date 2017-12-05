%.pdf:	%.tex
	pdflatex $<

%.tex:	%.pb
	dada -DLATEX $< >$@

clean:
	-rm *.tex *.pdf

tags:
	etags -r '/^\([a-zA-Z0-9-]+\):/\1/' *.pb
