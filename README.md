# UniPi Assignment LaTeX Template

LaTeX template matching the University of Piraeus (UNIPI) course assignment Word template.

## Project Structure

```
latex-template/
├── main.tex                 # Main document — edit this
├── unipi-assignment.cls     # Document class (formatting rules)
├── .latexmkrc               # latexmk configuration
├── images/
│   ├── unipi-logo.png       # University logo (extracted from .docx)
│   └── example-image.png    # Placeholder image (replace with your own)
└── README.md
```

## Compilation

Run **twice** (for TOC, cross-references, etc.):

```bash
cd latex-template
pdflatex main.tex
pdflatex main.tex
```

Or use `latexmk` (handles multiple passes automatically):

```bash
latexmk main.tex
```

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

