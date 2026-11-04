# UniPi Assignment LaTeX Template

LaTeX template matching the University of Piraeus (UNIPI) course assignment Word template.

## Project Structure

```
latex-template/
├── main.tex                 # Main document orchestrator
├── unipi-assignment.cls     # Document class (formatting rules)
├── .latexmkrc               # latexmk configuration
├── references.bib           # BibTeX bibliography
├── images/
│   ├── unipi-logo.png       # University logo (extracted from .docx)
│   └── example-image.png    # Placeholder image (replace with your own)
├── sections/                # Modular sections & subsections
│   ├── abstract/
│   │   └── abstract.tex
│   ├── introduction/
│   │   └── introduction.tex
│   ├── section-1/
│   │   ├── section-1.tex
│   │   ├── subsection-1.tex
│   │   ├── subsection-2.tex
│   │   └── subsection-3.tex
│   ├── section-2/
│   │   ├── section-2.tex
│   │   ├── subsection-1.tex
│   │   ├── subsection-2.tex
│   │   └── subsection-3.tex
│   ├── section-3/
│   │   ├── section-3.tex
│   │   ├── subsection-1.tex
│   │   ├── subsection-2.tex
│   │   └── subsection-3.tex
│   ├── section-4/
│   │   ├── section-4.tex
│   │   ├── subsection-1.tex
│   │   ├── subsection-2.tex
│   │   └── subsection-3.tex
│   ├── conclusions/
│   │   └── conclusions.tex
│   └── appendices/
│       ├── appendices.tex
│       ├── appendix-a.tex
│       └── appendix-b.tex
└── README.md
```

## Compilation

All build artifacts are directed to a `build/` directory to keep the root directory clean.

### Using pdflatex + bibtex

```bash
mkdir -p build
pdflatex -interaction=nonstopmode -output-directory=build main.tex
bibtex build/main
pdflatex -interaction=nonstopmode -output-directory=build main.tex
pdflatex -interaction=nonstopmode -output-directory=build main.tex
```

### Using latexmk

`latexmk` reads `.latexmkrc` and automatically outputs to `build/` with all passes handled:

```bash
latexmk main.tex
```

### Using VS Code

The LaTeX Workshop extension is preconfigured in `.vscode/settings.json` to build directly into `build/` and view the PDF in a tab viewer.

## Formatting Summary

| Element             | Font          | Size  | Color    | Notes                                  |
|----------------------|---------------|-------|----------|----------------------------------------|
| Body text            | Arial (Helv.) | 10pt  | Black    | Justified, single-spaced               |
| Heading 1 (numbered) | Arial Black   | 12pt  | `#2E74B5`| Blue underline rule                    |
| Heading 2 (numbered) | Arial Black   | 11pt  | Black    |                                        |
| Heading 3 (numbered) | Arial Black   | 10pt  | Black    |                                        |
| Unnumbered headings  | Arial Black   | 12pt  | `#2E74B5`| Same as H1 without number              |
| Captions             | Arial Bold    | 9pt   | Black    | Centered                               |
| Header               | Arial         | 8pt   | Black    | Left: title, Right: author name        |
| Footer               | Arial         | 8pt   | Black    | Right-aligned page number              |
| Keywords             | Arial Italic  | 10pt  | `#2E74B5`|                                        |

**Page:** A4 (21 × 29.7 cm), all margins 3 cm

**Numbering:** Sections `1`, `1.1`, `1.1.1`; Figures/Tables numbered per chapter (`1.1`, `2.1`...)

**Page numbers:** Front matter in roman (i, ii, ...), main matter in arabic (1, 2, ...)

## Key Commands

| Command                       | Purpose                                       |
|-------------------------------|-----------------------------------------------|
| `\maketitlepage`              | Generates the title page                      |
| `\makecopyrightpage`          | Generates the copyright page                  |
| `\frontmatter`                | Switches to roman page numbering              |
| `\mainmatter`                 | Switches to arabic page numbering from 1      |
| `\sectionunnumbered{Title}`   | Unnumbered H1 heading (with page break)       |
| `\sectionunnumberednoclear{}` | Unnumbered H1 heading (without page break)    |
| `\begin{indented}...\end{indented}` | Indented body text block               |
| `\makeappendixheading{Title}` | Creates lettered appendix heading (A, B, ...) |

## Dependencies

Standard TeX Live packages — no exotic dependencies:

```
texlive-latex-base
texlive-latex-recommended
texlive-latex-extra
texlive-fonts-recommended
```

Install on Ubuntu/Debian:
```bash
sudo apt install texlive-latex-extra texlive-fonts-recommended
```

