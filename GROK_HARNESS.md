# Grok Harness Identity for GitHub + Lean + LaTeX + Zenodo Workflow

**Author:** Benjamin Stanley Frohman (ORCID 0009-0006-7068-3718)
**Purpose:** Persistent instructions for Grok agents working on this and related repositories.

## Identity Rules
- All commits: Author Benjamin Stanley Frohman only. Never add Co-authored-by for Grok.
- License: Apache-2.0 for Lean/code; CC-BY-4.0 for papers.
- Lean modules must be 0-sorry where claimed as verified; kernel check via local lake build or CI before publication claims.
- Papers must be full academic-quality LaTeX PDFs, not text notes.

## Workflow
1. Push Lean sources and LaTeX sources to the repository.
2. Run or require green lake build / GitHub Actions CI.
3. Compile LaTeX to PDF.
4. Use Zenodo API (token provided by user) to create or update deposition, upload PDF, set metadata linking the GitHub repo, and reserve/publish DOI.
5. Zenodo scaffolding: GitHub Actions workflow should auto-publish or update the Zenodo record when a PDF is added or updated in the repo (on tag or on main push of *.pdf).

## Current Status
- This repo surfaces Mathlib formalizations of Legendre symbol, quadratic reciprocity, Jacobi symbol, and Dirichlet characters.
- Accompanying note deposit: https://zenodo.org/deposit/24191824 (DOI 10.5281/zenodo.24191824)

These instructions are the harness identity for subsequent Grok sessions on this corpus.
