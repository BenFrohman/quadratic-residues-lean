# Classical Quadratic Residues: Summary and Connections to Residue Algebra Certificates and Sieve Barriers

**Author:** Benjamin Stanley Frohman (ORCID: 0009-0006-7068-3718)  
**Date:** 16 November 2026  
**Status:** Zenodo draft note  
**Related repository:** BenFrohman/quadratic-residues-lean  
**License:** Apache-2.0

## Classical quadratic residues

A nonzero integer \(a\) is a quadratic residue modulo an odd prime \(p\) if the congruence
\[ x^2 \equiv a \pmod{p} \]
has a solution. Equivalently, the Legendre symbol satisfies
\[ \left( \frac{a}{p} \right) = 1. \]
(The symbol is \(0\) if \(p \mid a\) and \(-1\) if \(a\) is a non-residue.)

### Key properties

- Exactly \((p-1)/2\) residues and \((p-1)/2\) non-residues modulo \(p\).
- Multiplicativity: \(\left( \frac{ab}{p} \right) = \left( \frac{a}{p} \right)\left( \frac{b}{p} \right)\).
- Euler’s criterion: \(\left( \frac{a}{p} \right) \equiv a^{(p-1)/2} \pmod{p}\).
- Law of quadratic reciprocity (for distinct odd primes \(p,q\)):
  \[ \left( \frac{p}{q} \right)\left( \frac{q}{p} \right) = (-1)^{(p-1)/2 \cdot (q-1)/2}. \]
- Supplementary laws for \(-1\) and \(2\).

The Jacobi symbol \(\left( \frac{a}{n} \right)\) extends the Legendre symbol to odd composite \(n\). It is multiplicative and can be computed efficiently without factoring, but \(\left( \frac{a}{n} \right) = 1\) does not imply that \(a\) is a square modulo \(n\) when \(n\) is composite.

## Connection to existing materials

The residue notes (`note1-residue-algebra-stage1.pdf`, `note2-residue-certificates-stage2.pdf`) are **not** about classical quadratic residues. They are Lean 4 algebraic certificates for an explicit sextic section in the HODGE repository (Stage 1/2): two-pair decompositions, Jacobian determinant factorizations, non-vanishing of a degree-24 modulus, Wronskian identities, and Bézout certificates. They live at commit `e207394a9ed4255ad804860b8f69fde7e940dd54` in BenFrohman/HODGE and explicitly disclaim geometric cycle-class or residue-cycle theorems.

The sieve-barrier papers (including the bbff deposit at https://zenodo.org/deposit/24191007) use local residue classes modulo 42. The truncated operator \(\Omega_R\) is blind above the sieve level, so the generating function collapses identically on true twin primes and high-magnitude pseudo-primes in the same residue class. The quadratic commutation barrier then preserves the classical Selberg parity error. This is modular arithmetic on residue classes, not quadratic residuosity.

Related public work includes the \((p^2 q)\) jump constraints (Zenodo 10.5281/zenodo.22713135 / later versions, repo BenFrohman/p2q-jumps-lean) and Collatz teaming lemmas, both of which involve modular constraints but not Legendre/Jacobi symbols as the primary object.

## Where quadratic residuosity appears in sieve / twin-prime literature

- Character sums and the Jacobi symbol are used in some weighted or spectral sieve approaches to the twin-prime problem (to detect quadratic non-residues that obstruct certain decompositions).
- The classical parity barrier (Selberg, etc.) is orthogonal to quadratic residuosity; the local sieve barrier papers correctly isolate the blindness of the truncated operator to large prime factors as the obstruction, independent of Legendre symbols.

## Lean interface

The companion repository BenFrohman/quadratic-residues-lean provides a polished Lean 4 interface to Mathlib’s formalizations of the Legendre symbol, quadratic reciprocity, Jacobi symbol, and Dirichlet characters, plus a short modulus-42 observation relevant to the local sieve barrier.

---

This note is a draft for a short technical Zenodo deposit clarifying the distinction between classical quadratic residuosity and the algebraic residue certificates / modular residue-class work in the related repositories.
