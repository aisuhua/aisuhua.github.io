# ref

- https://pandoc.org/MANUAL.html#variables-for-latex
- https://pandoc.org/MANUAL.html#metadata-blocks
- https://rsdoiel.github.io/blog/2020/11/11/Pandoc-Metadata.html
- https://pandoc.org/MANUAL.html#metadata-variables
- https://github.com/adobe-fonts/source-code-pro/tree/release
- https://github.com/adobe-fonts/source-han-sans

```sh
fc-list :lang=zh

sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv

pandoc \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="Source Han Sans SC" \
    -V sansfont="Source Code Pro" \
    -V monofont="Source Code Pro" \
    -V mathfont="Source Code Pro" \
    -V fontsize=12pt \
    --pdf-engine=xelatex \
    --listings \
    --toc \
    --toc-depth=3 \
    --highlight-style="pygments.theme" \
    --include-in-header="tex/inline_code.tex" \
    -o demo.pdf \
    demo.md 
```


