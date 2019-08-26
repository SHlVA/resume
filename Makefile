all: resume-shiva.html symlnk

symlnk:
	rm -f index.html
	ln -s resume-shiva.html index.html

%.html:	%.md
	pandoc -t html -o $@ $< -c "https://fonts.googleapis.com/css?family=Merriweather&display=swap" -c res/resume.css -A res/footer.html -B res/header.html

%.pdf:	%.md
	pandoc -o $@ --template=res/resume-template.tex --pdf-engine=xelatex \
        --variable mainfont="Merriweather" \
        --variable sansfont="Open Sans" \
        --variable monofont="Roboto Mono" \
        --variable fontsize=12 $<

%.docx: %.md
	pandoc -t docx -o $@ $<

.PHONY: clean
clean:
	rm -f *~ *.html *.log 


