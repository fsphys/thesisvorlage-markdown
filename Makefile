target = -t latex
filters = -F pandoc-crossref -F pandoc-citeproc
pandocflags = $(target) $(filters)


thesis: config.yaml references.yaml chapter*.md appendix*.md
	pandoc $(pandocflags) \
		-o thesis.pdf \
		--number-sections \
		config.yaml \
		chapter*.md \
		appendix*.md

references.yaml: refs/*.bib
	pandoc-citeproc --bib2yaml $^ > $@

%.pdf: %.md
	pandoc $(target) -o $@ $<

all: thesis

.PHONY: all thesis
