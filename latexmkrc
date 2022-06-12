#!/usr/bin/env perl

$latex = 'uplatex %O -interaction=nonstopmode -file-line-error -halt-on-error %S';
$pdflatex = 'pdflatex %O -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error %S';
$lualatex = 'lualatex -interaction=nonstopmode -file-line-error -halt-on-error %S';
$xelatex = 'xelatex %O -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error %S';

$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'pbibtex -kanji=utf8 %O %B';
$makeindex = 'upmendex %O -o %D %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
$rs2pdf = 'ps2pdf %O %S %D';
$clean_ext = 'dvi bbl synctex.gz';
# $out_dir = 'out';
$pdf_mode = 3;
if ($^O eq 'darwin') {
  $pvc_view_file_via_temporary = 0;
  # $pdf_previewer = 'open -ga /Applications/Skim.app';
  $pdf_previewer = 'code';

} else {
  $pdf_previewer = 'xdg-open';
}
