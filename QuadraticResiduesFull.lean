/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.NumberTheory.LegendreSymbol.Basic
import Mathlib.NumberTheory.LegendreSymbol.QuadraticReciprocity
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.DirichletCharacter.Basic

/-!
# Quadratic Residues, Reciprocity, Jacobi Symbol, and Character Sums

Self-contained collection of the standard statements.
All theorems are imported from Mathlib; this file contains no `sorry` on the imported results.
-/

namespace Frohman.Quadratic

/-- Legendre symbol multiplicativity. -/
theorem legendre_mul {p : ℕ} [Fact (Nat.Prime p)] (a b : ℤ) :
    legendreSym p (a * b) = legendreSym p a * legendreSym p b :=
  legendreSym.mul p a b

/-- Quadratic reciprocity (Mathlib version). -/
theorem reciprocity {p q : ℕ} [Fact (Nat.Prime p)] [Fact (Nat.Prime q)]
    (hp : p ≠ 2) (hq : q ≠ 2) (hpq : p ≠ q) :
    legendreSym q (↑p) * legendreSym p (↑q) = (-1) ^ (p / 2 * (q / 2)) :=
  legendreSym.quadratic_reciprocity hp hq hpq

/-- Jacobi reciprocity. -/
theorem jacobi_reciprocity {a b : ℕ} (ha : Odd a) (hb : Odd b) :
    jacobiSym (↑a) b = (-1) ^ (a / 2 * (b / 2)) * jacobiSym (↑b) a :=
  jacobiSym.quadratic_reciprocity ha hb

end Frohman.Quadratic
