/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.NumberTheory.LegendreSymbol.Basic
import Mathlib.NumberTheory.LegendreSymbol.QuadraticReciprocity
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.DirichletCharacter.Basic
import QuadraticResidues.Basic

/-!
# Quadratic Residues and Character Sums

This module surfaces the Mathlib formalizations of:
- the Legendre symbol and its basic properties,
- the law of quadratic reciprocity,
- the Jacobi symbol,
- Dirichlet characters.

All theorems in this file are kernel-checked (0 `sorry`, standard axioms only).
The sieve-barrier claim about the truncated operator `Ω_R` is recorded below
as a named hypothesis and is not proved here.
-/

namespace Frohman.QuadraticResidues

/-- Re-export of the Legendre symbol definition. -/
abbrev Legendre := legendreSym

/-- Quadratic reciprocity as stated in Mathlib. -/
theorem reciprocity (p q : ℕ) [Fact p.Prime] [Fact q.Prime]
    (hp : p ≠ 2) (hq : q ≠ 2) (hpq : p ≠ q) :
    legendreSym q p * legendreSym p q = (-1) ^ (p / 2 * (q / 2)) :=
  legendreSym.quadratic_reciprocity hp hq hpq

/-- Jacobi symbol reciprocity. -/
theorem jacobi_reciprocity (a b : ℕ) (ha : Odd a) (hb : Odd b) :
    jacobiSym a b = (-1) ^ (a / 2 * (b / 2)) * jacobiSym b a :=
  jacobiSym.quadratic_reciprocity ha hb

/-- A residue class modulo 42 determines divisibility by 2, 3 and 7,
since `42 = 2 * 3 * 7`. This is the short kernel-checked modular observation
relevant to the local sieve-barrier analysis; it does not mention the
Legendre or Jacobi symbol. -/
theorem mod42_determines_divisibility_by_two_three_seven
    (n m : ℕ) (h : n % 42 = m % 42) :
    (2 ∣ n ↔ 2 ∣ m) ∧ (3 ∣ n ↔ 3 ∣ m) ∧ (7 ∣ n ↔ 7 ∣ m) := by
  have h2 : 2 ∣ 42 := ⟨21, rfl⟩
  have h3 : 3 ∣ 42 := ⟨14, rfl⟩
  have h7 : 7 ∣ 42 := ⟨6, rfl⟩
  refine ⟨?_, ?_, ?_⟩
  · rw [Nat.dvd_iff_mod_eq_zero, Nat.dvd_iff_mod_eq_zero,
      ← Nat.mod_mod_of_dvd n h2, ← Nat.mod_mod_of_dvd m h2, h]
  · rw [Nat.dvd_iff_mod_eq_zero, Nat.dvd_iff_mod_eq_zero,
      ← Nat.mod_mod_of_dvd n h3, ← Nat.mod_mod_of_dvd m h3, h]
  · rw [Nat.dvd_iff_mod_eq_zero, Nat.dvd_iff_mod_eq_zero,
      ← Nat.mod_mod_of_dvd n h7, ← Nat.mod_mod_of_dvd m h7, h]

/-!
## Named hypothesis (not proved in this repository)

The accompanying note records the following claim from the sieve-barrier
papers: the truncated operator `Ω_R` is blind to prime factors larger than
the sieve level, independently of the Legendre or Jacobi symbol, and the
associated generating function therefore takes the same value on genuine
twin primes and on high-magnitude pseudo-primes in the same residue class
modulo 42.

Those sieve-theoretic objects are not formalized here. The claim is kept as
a named hypothesis. This module does not construct a proof of it, and it
introduces no `sorry`, `admit`, `native_decide`, or custom `axiom`. Any later
theorem that depends on the claim must take it as an explicit hypothesis
once `Ω_R` is formalized.
-/

end Frohman.QuadraticResidues
