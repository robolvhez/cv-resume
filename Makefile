# ==============================================================================
# Makefile for CCG Beamer Template
# Compiler: LuaLaTeX | Bibliography: Biber
# ==============================================================================

# --- Configuration ------------------------------------------------------------
MAIN      := main
TEX       := lualatex
BIB       := biber
TEXFLAGS  := -shell-escape -interaction=nonstopmode -halt-on-error
OUTDIR    := build

# Source files (used for dependency tracking)
TEX_FILES := $(MAIN).tex $(wildcard slides/*.tex) $(wildcard slides/**/*.tex)
STY_FILES := $(wildcard *.sty)
BIB_FILES := $(wildcard *.bib)
IMG_FILES := $(shell find img -type f 2>/dev/null)

ALL_DEPS  := $(TEX_FILES) $(STY_FILES) $(BIB_FILES) $(IMG_FILES)

# --- Targets ------------------------------------------------------------------

.PHONY: all clean purge watch help

## Build the PDF (full compile cycle: tex → bib → tex → tex)
all: $(OUTDIR)/$(MAIN).pdf

$(OUTDIR)/$(MAIN).pdf: $(ALL_DEPS) | $(OUTDIR)
	$(TEX) $(TEXFLAGS) -output-directory=$(OUTDIR) $(MAIN).tex
	$(BIB) $(OUTDIR)/$(MAIN)
	$(TEX) $(TEXFLAGS) -output-directory=$(OUTDIR) $(MAIN).tex
	$(TEX) $(TEXFLAGS) -output-directory=$(OUTDIR) $(MAIN).tex
	@echo "✓ Build complete → $(OUTDIR)/$(MAIN).pdf"

$(OUTDIR):
	mkdir -p $(OUTDIR)

## Quick single-pass compile (no bibliography update)
quick: | $(OUTDIR)
	$(TEX) $(TEXFLAGS) -output-directory=$(OUTDIR) $(MAIN).tex
	@echo "✓ Quick build complete → $(OUTDIR)/$(MAIN).pdf"

## Watch for changes and rebuild (requires latexmk)
watch:
	latexmk -pvc -lualatex -outdir=$(OUTDIR) \
		-latexoption="$(TEXFLAGS)" $(MAIN).tex

## Remove build artifacts but keep the PDF
clean:
	@echo "Cleaning auxiliary files..."
	rm -f $(OUTDIR)/$(MAIN).{aux,bbl,bcf,blg,fdb_latexmk,fls,log,nav,out,run.xml,snm,toc,vrb}
	@echo "✓ Clean complete"

## Remove everything in the build directory (including the PDF)
purge:
	@echo "Purging build directory..."
	rm -rf $(OUTDIR)
	@echo "✓ Purge complete"

## Show available targets
help:
	@echo ""
	@echo "  CCG Beamer Template — Makefile targets"
	@echo "  ───────────────────────────────────────"
	@echo "  make          Build the PDF (full compile cycle)"
	@echo "  make quick    Single-pass compile (skip bibliography)"
	@echo "  make watch    Watch for changes and rebuild (needs latexmk)"
	@echo "  make clean    Remove auxiliary files, keep PDF"
	@echo "  make purge    Delete entire build/ directory"
	@echo "  make help     Show this help message"
	@echo ""
