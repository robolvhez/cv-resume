# Roberto Olvera-Hernandez CV/Resume

This repository contains the LaTeX source code for the Curriculum Vitae of Roberto Olvera-Hernandez, Ph.D. student in Biomedical Sciences & Computational Genomics at UNAM.

The CV is built using a custom `simplecv.cls` class and compiled with LuaLaTeX to produce a clean, professional PDF document.

## Prerequisites

To build the CV from source, you will need a modern TeX distribution (like TeX Live or MiKTeX) with the following tools installed:

- **LuaLaTeX**: The primary typesetting engine.
- **Biber**: The bibliography processing tool.
- **latexmk** (Optional): Useful for the `make watch` target to continuously build on file changes.

You will also need the fonts specified in the document:
- `XCharter` (Serif font used for body text)
- `Cabin` (Sans-serif font used for headings)

## Compilation

A `Makefile` is provided for convenient compilation. The following targets are available:

- `make` (or `make all`): Builds the complete PDF, including a full compile cycle (tex → bib → tex → tex) to resolve all references and bibliography items. The output will be in the `build/` directory.
- `make quick`: Performs a single-pass compile. Useful for fast iterations when citations haven't changed.
- `make watch`: Uses `latexmk` to watch for file changes and automatically recompile.
- `make clean`: Removes auxiliary build files (`.aux`, `.log`, etc.) but keeps the generated PDF.
- `make purge`: Completely removes the `build/` directory and all its contents.
- `make help`: Shows a list of available commands.

## Project Structure

- `main.tex`: The main document containing the content of the CV.
- `simplecv.cls`: The custom LaTeX document class defining the layout and styling.
- `mybiblio.bib`: Bibliography file containing references/publications.
- `Makefile`: Automates the compilation process.
- `img/`: Directory for images (if any).
- `build/`: The output directory where the final PDF and auxiliary files are generated (created automatically).

## License

Personal project. All rights reserved by the author.
