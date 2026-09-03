#!/usr/bin/env bash
# Build the written report: paper.md -> paper.pdf
# Requires pandoc and a LaTeX engine (both already installed on this machine).
set -euo pipefail
cd "$(dirname "$0")"

pandoc paper.md \
  --pdf-engine=pdflatex \
  --number-sections \
  --syntax-highlighting=tango \
  -V colorlinks=true \
  -o paper.pdf

echo "built $(pwd)/paper.pdf"
