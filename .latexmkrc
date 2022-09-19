#!/usr/bin/env perl

$latex = 'uplatex %O -interaction=nonstopmode -file-line-error -halt-on-error %S';
$lualatex = 'lualatex %O -interaction=nonstopmode -file-line-error -halt-on-error %S';

$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'pbibtex -kanji=utf8 %O %B';
$makeindex = 'upmendex %O -o %D %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
$pdf_mode = 3;

$pdf_previewer = 'code';
