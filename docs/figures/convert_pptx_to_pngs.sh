#! /bin/bash

# First use powerpoint to export the slides to PDF 
# Note: export to PDF, not print to PDF, otherwise trimming will not work.

if [[ -e "~\$figures.pptx" ]]; then
    echo "Close powerpoint (or delete old ~\$figures.pptx) before running this script"
    exit 1
fi

if [[ ! -e figures.pdf ]]; then
    echo "PDF does not exist; export Powerpoint to PDF first (export, don't print!)"
    exit 1
fi

if [[ figures.pptx -nt figures.pdf ]]; then
    echo "Powerpoint is newer than PDF; export Powerpoint to PDF first (export, don't print!)"
    exit 1
fi

echo "Converting PDF to PNG"
magick convert -density 300 -units pixelsperinch -trim +profile "icc" figures.pdf figures.png

echo "Renaming files"
mv figures-0.png quantum-processor-registers.png
