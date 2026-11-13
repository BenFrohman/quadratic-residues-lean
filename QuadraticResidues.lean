/* Copyright (c) 2026 Benjamin Stanley Frohman (@BenFrohman). Released under Apache-2.0.
Authors: Benjamin Stanley Frohman (@BenFrohman)
*/
import Mathlib.NumberTheory.LegendreSymbol.Basic
import Mathlib.NumberTheory.LegendreSymbol.QuadraticReciprocity
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.DirichletCharacter.Basic

/-!
# Quadratic Residues and Character Sums

This module surfaces the Mathlib formalizations of:
- the Legendre symbol and its basic properties,
- the law of quadratic reciprocity,
- the Jacobi symbol,
- Dirichlet characters.

All theorems are kernel-checked in Mathlib. This file contains no `sorry`.
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

end Frohman.QuadraticResidues
