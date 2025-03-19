#!/bin/bash

filename="pst_quantum_networks_aupac2025"
lualatex -synctex=1 -interaction=nonstopmode -file-line-error "${filename}.tex"
lualatex -synctex=1 -interaction=nonstopmode -file-line-error "${filename}.tex"
exit 0