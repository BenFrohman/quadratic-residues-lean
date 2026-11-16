# Quadratic Residues Lean

## Kernel certificate

[certificates/CERTIFICATE.md](certificates/CERTIFICATE.md): commit `ff7d45b`, `leanprover/lean4:v4.14.0`. `lake build` passes; the sorry/axiom scan finds 0 hits; **2 theorems depend only on `propext`, `Classical.choice`, `Quot.sound`**; 1 of 1 modules replayed through the kernel, 0 failures ([CI run](https://github.com/BenFrohman/quadratic-residues-lean/actions/runs/43937053385)).

Polished Lean 4 interface to Mathlib's formalization of:
- Legendre symbol and basic properties
- Law of quadratic reciprocity
- Jacobi symbol
- Dirichlet characters

Plus a short modulus-42 observation relevant to the local sieve barrier papers.

Author: Benjamin Stanley Frohman (ORCID 0009-0006-7068-3718)
License: Apache-2.0

This is not a re-proof of classical results; it surfaces Mathlib theorems cleanly and adds a note separating the geometric residue certificates from modular quadratic residues.
