PROJECT = 'X'
MAIN = test
SHELL =/bin/zsh
DATE = $(shell date +"%d%b%Y")

all: $(MAIN).pdf

TEX_SOURCES = Makefile \
	$(MAIN).tex

# FIGURES := $(shell find images/* -type f)
$(MAIN).pdf: $(TEX_SOURCES)
	pdflatex $(MAIN)

targz:
	$(MAIN) clean
	$(MAIN) all
	$(MAIN) clean
	tar czf $(PROJECT)_$(DATE).tgz $(TEX_SOURCES)

zip:
	$(MAIN) clean
	$(MAIN) all
	$(MAIN) clean
	zip -q $(PROJECT)_$(DATE).zip $(TEX_SOURCES)

clean:
	rm -f $(MAIN).{aux,fdb_latexmk,fls,log,nav,snm,toc}
	@echo "intermediate files removed" 
	
rzip:
	@rm -f *.zip
	@echo "zip file removed" 

rtargz:
	@rm -f *.tgz
	@echo "tgz file removed" 

.PHONY: clean all