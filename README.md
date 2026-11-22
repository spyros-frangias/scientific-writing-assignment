# University of Piraeus — Assignment Templates (LaTeX)
# Πρότυπα Εργασιών Πανεπιστημίου Πειραιώς (LaTeX)

This repository contains LaTeX templates for University of Piraeus course assignments, matching the official Word templates.

## Structure / Δομή

The repository is organized into two separate project directories:

- **[`english/`](./english)**: English version of the assignment template.
- **[`greek/`](./greek)**: Ελληνική έκδοση του προτύπου εργασίας (Greek version of the assignment template).

Each directory contains its own self-contained LaTeX project with its class file (`unipi-assignment.cls`), section files, images, bibliography, and build configuration.

## Compilation / Μεταγλώττιση

To compile either project, navigate to its directory and run:

```bash
# English version
cd english
latexmk main.tex

# Greek version
cd greek
latexmk main.tex
```

Or using `pdflatex`:
```bash
pdflatex -output-directory=build main.tex
```
