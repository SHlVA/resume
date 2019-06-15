all: resume-shiva.html resume-shiva.pdf resume-shiva.docx symlnk

symlnk:
	rm -f index.html
	ln -s resume-shiva.html index.html

%.html:	%.md
	pandoc -t html -o $@ $< -c res/resume.css -A res/footer.html -B res/header.html

%.pdf:	%.md
	pandoc -o $@ --template=res/resume-template.tex --pdf-engine=xelatex \
        --variable mainfont="Georgia" \
        --variable sansfont="Georgia" \
        --variable monofont="Georgia" \
        --variable fontsize=12 $<

%.docx: %.md
	pandoc -t docx -o $@ $<

.PHONY: clean
clean:
	rm -f *~ *.html *.log *.pdf *.docx


