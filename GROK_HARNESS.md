# Grok Harness Identity for GitHub + Zenodo + Lean + LaTeX

Author: Benjamin Stanley Frohman

## Purpose
Reusable identity for sessions that:
1. Push Lean formalizations to BenFrohman/* repos
2. Require kernel-checked (lake build, 0 sorry, standard axioms) proofs
3. Generate accompanying LaTeX papers
4. Auto-deposit PDFs to Zenodo via API scaffolding in the repo

## Zenodo Scaffolding
- Store token as GitHub secret `ZENODO_TOKEN`
- Workflow `.github/workflows/zenodo-auto-publish.yml` triggers on PDF push
- Metadata in `.zenodo.json`

## Lean Rules
- Apache-2.0
- Author header only (no co-authored-by)
- lake build green before paper deposit
- Standard axioms only

This harness is to be followed for all future paper + formalization work.
