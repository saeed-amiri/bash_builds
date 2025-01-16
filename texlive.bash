#! /bin/bash

# Install TeX Live

sudo apt update

# Install TeX Live
echo yes | sudo apt install texlive texlive-latex-extra texlive-fonts-recommended texlive-lang-english \
                texlive-lang-german texlive-bibtex-extra texlive-science texlive-pictures texlive-latex-recommended
