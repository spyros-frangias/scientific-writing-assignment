# UniPi Assignment LaTeX Templates

LaTeX templates matching the University of Piraeus (UNIPI) course assignment Word template for the course "Scientific Writing in Education".

## Project Structure

```
scientific-writing-assignment/
├── english/                 # English template version
│   ├── main.tex             # Main document orchestrator
│   ├── unipi-assignment.cls # Document class (formatting rules)
│   ├── .latexmkrc           # latexmk configuration
│   ├── references.bib       # BibTeX bibliography
│   ├── assignment-template.docx
│   ├── images/              # Document figures, diagrams & logo
│   │   ├── unipi-logo.png
│   │   ├── figure-1.1.jpg
│   │   ├── figure-1.2.jpg
│   │   ├── figure-2.1.jpg
│   │   ├── figure-3.1.jpg
│   │   ├── diagram-4.1.jpg
│   │   └── diagram-4.2.jpg
│   └── sections/            # Modular sections & subsections
│       ├── abstract/
│       │   └── abstract.tex
│       ├── introduction/
│       │   └── introduction.tex
│       ├── section-1/
│       │   ├── section-1.tex
│       │   ├── subsection-1.tex
│       │   ├── subsection-2.tex
│       │   └── subsection-3.tex
│       ├── section-2/
│       │   ├── section-2.tex
│       │   ├── subsection-1.tex
│       │   ├── subsection-2.tex
│       │   └── subsection-3.tex
│       ├── section-3/
│       │   ├── section-3.tex
│       │   ├── subsection-1.tex
│       │   ├── subsection-2.tex
│       │   └── subsection-3.tex
│       ├── section-4/
│       │   ├── section-4.tex
│       │   ├── subsection-1.tex
│       │   ├── subsection-2.tex
│       │   └── subsection-3.tex
│       ├── conclusions/
│       │   └── conclusions.tex
│       └── appendices/
│           ├── appendices.tex
│           ├── appendix-a.tex
│           └── appendix-b.tex
├── greek/                   # Greek template version (Ελληνική έκδοση)
│   ├── main.tex
│   ├── unipi-assignment.cls
│   ├── .latexmkrc
│   ├── references.bib
│   ├── Πρότυπο Εργασίας.docx
│   ├── images/
│   │   ├── unipi-logo.png
│   │   ├── figure-1.1.jpg
│   │   ├── figure-1.2.jpg
│   │   ├── figure-2.1.jpg
│   │   ├── figure-3.1.jpg
│   │   ├── diagram-4.1.jpg
│   │   └── diagram-4.2.jpg
│   └── sections/
│       ├── abstract/
│       │   └── abstract.tex
│       ├── introduction/
│       │   └── introduction.tex
│       ├── section-1/
│       │   ├── section-1.tex
│       │   ├── subsection-1.tex
│       │   ├── subsection-2.tex
│       │   └── subsection-3.tex
│       ├── section-2/
│       │   ├── section-2.tex
│       │   ├── subsection-1.tex
│       │   ├── subsection-2.tex
│       │   └── subsection-3.tex
│       ├── section-3/
│       │   ├── section-3.tex
│       │   ├── subsection-1.tex
│       │   ├── subsection-2.tex
│       │   └── subsection-3.tex
│       ├── section-4/
│       │   ├── section-4.tex
│       │   ├── subsection-1.tex
│       │   ├── subsection-2.tex
│       │   └── subsection-3.tex
│       ├── conclusions/
│       │   └── conclusions.tex
│       └── appendices/
│           ├── appendices.tex
│           ├── appendix-a.tex
│           └── appendix-b.tex
├── .gitignore
└── README.md
```

## Structure Overview

The repository is organized into two separate project directories:
- **[`english/`](./english)**: English version of the assignment template.
- **[`greek/`](./greek)**: Ελληνική έκδοση του προτύπου εργασίας (Greek version of the assignment template).

Each directory contains its own self-contained LaTeX project with its class file (`unipi-assignment.cls`), section files, images, bibliography, and build configuration.
