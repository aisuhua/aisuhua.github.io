# ref

- https://pandoc.org/MANUAL.html#variables-for-latex
- https://pandoc.org/MANUAL.html#metadata-blocks
- https://rsdoiel.github.io/blog/2020/11/11/Pandoc-Metadata.html
- https://pandoc.org/MANUAL.html#metadata-variables
- https://github.com/adobe-fonts/source-code-pro/tree/release
- https://github.com/adobe-fonts/source-han-sans
- https://github.com/adobe-fonts/source-sans
- [LaTeX代码： 下划线与删除线 ← 利用 ulem 宏包](https://blog.csdn.net/hnjzsyjyj/article/details/122923719)
- https://www.latex-project.org/help/documentation/
- https://ctan.org/
- https://www.cnblogs.com/Undefined443/p/18156668
- https://www.tug.org/texlive/upgrade.html
- https://pandoc.org/MANUAL.html#defaults-files
- [Ubuntu 20.04 安装宋体](https://blog.csdn.net/LclLsh/article/details/132509872)
- [正确打开LaTeX的姿势](https://muyuuuu.github.io/2019/08/06/latex-feel-stonezeng/)
- [Pandoc Syntax Highlighting Examples](https://www.garrickadenbuie.com/blog/pandoc-syntax-highlighting-examples/)

```sh
# markdown 转 html
# https://www.arthurkoziel.com/convert-md-to-html-pandoc/
# https://github.com/danmar/cppcheck/pull/2360/files
pandoc demo07.md -o demo07.html  --toc --number-sections -s

pandoc demo01.md demo02.md -o demo02.pdf --pdf-engine=xelatex -V documentclass="ctexrep" --table-of-contents --toc-depth=3 --number-sections  --include-in-header rewrite.tex --highlight-style pygments.theme

# \emph 无法实现中文斜体

# 帮助手册
texdoc ulem


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

pandoc \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="Source Han Sans SC" \
    -V sansfont="Source Code Pro" \
    -V monofont="Source Code Pro" \
    -V mathfont="Source Code Pro" \
    -V fontsize=12pt \
    --pdf-engine=xelatex \
    --toc \
    --toc-depth=3 \
    -o demo.pdf \
    demo.md 
```


