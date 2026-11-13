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
theorem legendre_mul {p : \u2115} [Fact (Nat.Prime p)] (a b : \u2124) :
    legendreSym p (a * b) = legendreSym p a * legendreSym p b :=
  legendreSym.mul_left _ _

/-- Quadratic reciprocity (Mathlib version). -/
theorem reciprocity {p q : \u2115} [Fact (Nat.Prime p)] [Fact (Nat.Prime q)]
    (hp : p \u2260 2) (hq : q \u2260 2) (hpq : p \u2260 q) :
    legendreSym q (\u2191p) * legendreSym p (\u2191q) = (-1) ^ (p / 2 * (q / 2)) :=
  legendreSym.quadratic_reciprocity hp hq hpq

/-- Jacobi reciprocity. -/
theorem jacobi_reciprocity {a b : \u2115} (ha : Odd a) (hb : Odd b) :
    jacobiSym (\u2191a) b = (-1) ^ (a / 2 * (b / 2)) * jacobiSym (\u2191b) a :=
  jacobiSym.quadratic_reciprocity ha hb

end Frohman.Quadratic
