$pdf_previewer = 'open -a Skim';
$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode';
$pdf_mode = 1;
$postscript_mode = $dvi_mode = 0;
@generated_exts = (@generated_exts, 'synctex.gz');
$clean_ext = 'synctex.gz synctex.gz(busy) run.xml tex.bak bbl bcf fdb_latexmk run tdo %R-blx.bib'

