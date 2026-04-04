#!/usr/bin/env bash
set -euo pipefail

TEX_MAIN="main"

clean() {
    echo "==> Cleaning auxiliary files..."
    rm -f "${TEX_MAIN}".{aux,bbl,blg,brf,fdb_latexmk,fls,log,lof,lot,out,toc,synctex.gz,pdf}
    find tex -name '*.aux' -delete 2>/dev/null || true
    echo "    Done."
}

build() {
    echo "==> Building ${TEX_MAIN}.tex ..."
    pdflatex -interaction=nonstopmode -halt-on-error "${TEX_MAIN}.tex"
    bibtex "${TEX_MAIN}"
    pdflatex -interaction=nonstopmode "${TEX_MAIN}.tex"
    pdflatex -interaction=nonstopmode "${TEX_MAIN}.tex"
    echo "==> Build finished: ${TEX_MAIN}.pdf"
}

case "${1:-rebuild}" in
    clean)   clean ;;
    build)   build ;;
    rebuild) clean; build ;;
    *)       echo "Usage: $0 {clean|build|rebuild}"; exit 1 ;;
esac
