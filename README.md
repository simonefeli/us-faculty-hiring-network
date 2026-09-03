# Hierarchy without hierarchy

**Is the US academic job market a hierarchy — and can the network alone prove it?**

Final project for *Graph Algorithms* (Prof. Stefano Guarino), Master in Data Analytics,
Roma Tre University. Simone Felicioni.

---

## The result in one paragraph

The network of faculty hiring among 368 US universities turns out **not** to be hierarchical in its
topology: 363 of them sit inside a single strongly connected component, the density is 0.273, and
random null models reproduce most of the structure. The hierarchy lives in the **direction and
volume of the flow** instead. Reversing every edge and running PageRank produces a prestige score
that recovers Harvard, Berkeley, Stanford and MIT with no external ranking supplied, and **78.2% of
the 212,266 hires between distinct institutions move down that ranking**.

Two widely expected properties fail. A Kolmogorov-Smirnov test rejects the power law wherever the
tail is long enough to test it. And the near-acyclic structure the raw data appears to show is an
artefact of which faculty rosters were collected, not a property of academia — correcting for it
reverses the conclusion.

## The data

`faculty_hiring_us` (network `academia`) from
[networks.skewed.de](https://networks.skewed.de/net/faculty_hiring_us), released with
Wapman, Zhang, Clauset & Larremore, *Nature* **610**, 120–127 (2022).

A node is a university. A directed edge *i → j* weighted *w* records that *w* people earned a PhD at
*i* and held a tenure-track post at *j* between 2011 and 2020. Edge weights are also split by
gender. 3,284 nodes, 61,936 edges, 274,474 individual hires.

## What is here

| | |
|---|---|
| `paper.pdf` | the report: 11 pages, 5 figures, 6 tables |
| `Assignment.ipynb` | the analysis, 15 sections, executed |
| `paper.md` | source of the report |
| `data/` | the dataset, three CSV files |
| `figures/` | figures written by the notebook |
| `results.json` | every number the notebook computes; the report quotes from here |
| `toy.ipynb` | a five-node graph used to work out the concepts by hand |
| `requirements.txt` | the Python packages needed |

Course material — lecture notebooks and my own notes — is deliberately not in this repository: it
belongs to the professor.

## Reproducing it

```bash
pip install -r requirements.txt
./run_notebook.sh    # runs the analysis, refreshes figures/ and results.json
./build_paper.sh     # rebuilds paper.pdf from paper.md (needs pandoc + a LaTeX engine)
```

The notebook runs end to end in under ten seconds. Every random step is seeded, so repeated runs
give identical numbers.

## What was implemented by hand

Two pieces are not library calls, and are declared as such in the paper:

- **the power-law test**, following Clauset, Shalizi & Newman: maximum-likelihood estimation of the
  exponent by numerical search, the Kolmogorov-Smirnov distance, and selection of the tail start by
  minimising it. It was validated against the reference `powerlaw` package, and that comparison
  exposed a real defect in an earlier version of the code.
- **the net-flow, self-hiring and gender analysis**, together with the prestige-ladder figure.

## A note on how this was made

The analysis code and a first draft of the prose were produced with the assistance of an AI tutor
over several weeks of guided work. The choice of what to measure, the interpretation of the results,
and the decisions about what to report and what to leave out are mine. This is stated in the paper's
acknowledgements as well.
