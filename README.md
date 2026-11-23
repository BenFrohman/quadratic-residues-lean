# Quadratic Residues Lean

## Kernel certificate

[certificates/CERTIFICATE.md](certificates/CERTIFICATE.md): commit `ff7d45b`, `leanprover/lean4:v4.14.0`. `lake build` passes; the sorry/axiom scan finds 0 hits; **2 theorems depend only on `propext`, `Classical.choice`, `Quot.sound`**; 1 of 1 modules replayed through the kernel, 0 failures ([CI run](https://github.com/BenFrohman/quadratic-residues-lean/actions/runs/43937053385)).

Polished Lean 4 interface to Mathlib's formalization of:
- Legendre symbol and basic properties
- Law of quadratic reciprocity
- Jacobi symbol
- Dirichlet characters

Plus a short kernel-checked lemma that a residue class modulo 42 determines
divisibility by 2, 3 and 7 (`mod42_determines_divisibility_by_two_three_seven`).
The sieve-barrier claim that the truncated operator Ω_R is blind above the
sieve level independently of the Legendre or Jacobi symbol is recorded as a
named hypothesis; it is not proved in this repository.

Author: Benjamin Stanley Frohman (ORCID 0009-0006-7068-3718)
License: Apache-2.0

This is not a re-proof of classical results; it surfaces Mathlib theorems cleanly and adds a note separating the geometric residue certificates from modular quadratic residues.
