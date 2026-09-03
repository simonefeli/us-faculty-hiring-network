#!/usr/bin/env bash
# Re-run the analysis notebook from scratch, writing the outputs back into it.
# Needs a Python environment with the packages listed in requirements.txt.
set -euo pipefail
cd "$(dirname "$0")"

python -m jupyter nbconvert \
  --to notebook --execute --inplace \
  --ExecutePreprocessor.timeout=900 \
  Assignment.ipynb

echo "notebook executed; figures in figures/, numbers in results.json"
