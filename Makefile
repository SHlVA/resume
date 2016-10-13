all: resume-shiva.html resume-shiva.pdf symlnk

symlnk:
	rm -f index.html
	ln -s resume-shiva.html index.html

%.html:	%.md
	pandoc -t html -o $@ $< -c res/resume.css -A res/footer.html -B res/header.html

%.pdf:	%.md
	pandoc -o $@ --template=res/resume-template.tex --latex-engine=xelatex \
        --variable mainfont="Georgia" \
        --variable sansfont="Helvetica Neue" \
        --variable fontsize=12 $<

clean:
	rm -f *~ *.html *.log *.pdf
