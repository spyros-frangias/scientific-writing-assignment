$pdf_mode = 1;           # Use pdflatex
$out_dir = 'build';        # Route intermediate & output files to build/
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error %O %S';
$bibtex_use = 1;         # Set to 1 if using BibTeX
$clean_ext = 'aux bbl blg log out toc lof lot lod fls fdb_latexmk synctex.gz';
