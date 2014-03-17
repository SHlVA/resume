all:	resume-phil.html resume-phil.pdf

%.html:	%.md
	pandoc -t html -o $@ $< -c resume.css -A footer.html -B header.html

%.pdf:	%.md
	pandoc -o $@ --template=resume-template.tex --latex-engine=xelatex \
        --variable mainfont="Times New Roman" \
        --variable fontsize=12 $<

clean:
	rm -f *~ *.html *.log *.pdf
