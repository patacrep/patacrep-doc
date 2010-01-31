SOURCES	:= $(shell egrep -l '^[^%]*\\begin\{document\}' *.tex)
CIBLE = $(SOURCES:%.tex=%)
AUX = $(SOURCES:%.tex=%.aux)

# Sources for image files
FIG_DIR = fig

# Destination directories for generated images
EPS_DIR = $(FIG_DIR)/eps
PDF_DIR = $(FIG_DIR)/pdf
TEX_DIR = $(FIG_DIR)/tex

# Various sources files
XFIGS  = $(wildcard $(FIG_DIR)/*.fig)
IMAGES = $(wildcard $(FIG_DIR)/*.gif) $(wildcard $(FIG_DIR)/*.jpg) $(wildcard $(FIG_DIR)/*.eps) $(wildcard $(FIG_DIR)/*.pdf) $(wildcard $(FIG_DIR)/*.svg)

IMG_PNG = $(wildcard $(FIG_DIR)/*.png)

EPS  = $(foreach file, $(XFIGS), $(EPS_DIR)/$(basename $(notdir $(file))).eps)
EPS += $(foreach file, $(IMAGES), $(EPS_DIR)/$(basename $(notdir $(file))).eps)
EPS += $(foreach file, $(IMG_PNG), $(EPS_DIR)/$(basename $(notdir $(file))).eps)

PDF  = $(foreach file, $(XFIGS), $(PDF_DIR)/$(basename $(notdir $(file))).pdf)
PDF += $(foreach file, $(IMAGES), $(PDF_DIR)/$(basename $(notdir $(file))).pdf)
PDF += $(foreach file, $(IMG_PNG), $(PDF_DIR)/$(basename $(notdir $(file))).png)

TEX  = $(foreach file, $(XFIGS), $(TEX_DIR)/$(basename $(notdir $(file))).tex)

############################################################
### Cibles

default: pdf

ps: LATEX = latex
ps: $(CIBLE).ps.gz
	gv $<

pdf: LATEX = pdflatex
pdf: $(CIBLE).pdf
	xpdf $<

clean:
	@rm -f $(AUX) $(CIBLE).toc
	@rm -f $(CIBLE).dvi $(CIBLE).out $(CIBLE).log $(CIBLE).nav $(CIBLE).snm

cleanall: clean
	@rm -f $(EPS) $(PDF) $(TEX)
	@rm -f $(CIBLE).ps.gz $(CIBLE).pdf

############################################################

$(AUX): $(SOURCES)
	$(LATEX) $(SOURCES)


$(CIBLE).ps.gz: $(CIBLE).ps
	gzip -f $(CIBLE).ps

$(CIBLE).ps: $(CIBLE).dvi
	dvips $(CIBLE).dvi -o

$(CIBLE).dvi: $(EPS) $(TEX) $(AUX) $(BIB)
	$(LATEX) $(CIBLE).tex

$(CIBLE).pdf: $(PDF) $(TEX) $(AUX) $(BIB)
	$(LATEX) $(CIBLE).tex

$(EPS_DIR)/%.eps: $(FIG_DIR)/%.fig
	fig2dev -L pstex $< $@

$(EPS_DIR)/%.eps: $(FIG_DIR)/%.jpg
	convert $< EPS:$@

$(EPS_DIR)/%.eps: $(FIG_DIR)/%.png
	convert $< EPS:$@

$(EPS_DIR)/%.eps: $(FIG_DIR)/%.gif
	convert $< EPS:$@

$(EPS_DIR)/%.eps: $(FIG_DIR)/%.eps
	cp $< $@

$(EPS_DIR)/%.eps: $(FIG_DIR)/%.svg
	inkscape $< --export-eps=$@

$(PDF_DIR)/%.pdf: $(FIG_DIR)/%.fig
	fig2dev -L pdftex $< $@

$(PDF_DIR)/%.pdf: $(FIG_DIR)/%.jpg
	convert $< EPDF:$@

$(PDF_DIR)/%.pdf: $(FIG_DIR)/%.eps
	convert $< EPDF:$@

$(PDF_DIR)/%.pdf: $(FIG_DIR)/%.pdf
	cp $< $@

$(PDF_DIR)/%.pdf: $(FIG_DIR)/%.svg
	inkscape $< --export-pdf=$@

$(PDF_DIR)/%.png: $(FIG_DIR)/%.png
	cp $< $@

$(TEX_DIR)/%.tex: $(FIG_DIR)/%.fig
	fig2dev -L pdftex_t -p $(*F) $< $@
