/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.NumberTheory.LegendreSymbol.Basic
import Mathlib.NumberTheory.LegendreSymbol.QuadraticReciprocity
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.Data.Complex.Basic

/-!
# Legendre symbol, quadratic reciprocity, Jacobi symbol, and Dirichlet characters

Clean interface to the Mathlib formalizations. All theorems below are kernel-checked in Mathlib
(0 sorry, standard axioms only).
-/

namespace Frohman.NumberTheory

open Mathlib
open scoped BigOperators

/-- Legendre symbol. -/
def legendre (p : ℕ) [Fact p.Prime] (a : ℤ) : ℤ := legendreSym p a

/-- Euler's criterion, as an integer congruence, from Mathlib's `legendreSym.eq_pow`. -/
theorem legendre_euler (p : ℕ) [Fact p.Prime] (_hp : p ≠ 2) (a : ℤ) (_ha : ¬ (p : ℤ) ∣ a) :
    legendre p a ≡ a ^ (p / 2) [ZMOD p] := by
  rw [← ZMod.intCast_eq_intCast_iff, legendre, Int.cast_pow]
  exact legendreSym.eq_pow p a

/-- Quadratic reciprocity, matching Mathlib's statement `(q / p) * (p / q)`. -/
theorem legendre_reciprocity (p q : ℕ) [Fact p.Prime] [Fact q.Prime]
    (hp : p ≠ 2) (hq : q ≠ 2) (hpq : p ≠ q) :
    legendre q p * legendre p q = (-1) ^ ((p / 2) * (q / 2)) :=
  legendreSym.quadratic_reciprocity hp hq hpq

/-- Jacobi symbol. -/
def jacobi (a : ℤ) (n : ℕ) : ℤ := jacobiSym a n

theorem jacobi_reciprocity (a b : ℕ) (ha : Odd a) (hb : Odd b) :
    jacobi a b = (-1) ^ (a / 2 * (b / 2)) * jacobi b a :=
  jacobiSym.quadratic_reciprocity ha hb

/-- Complete sum of a nontrivial Dirichlet character (Mathlib: `MulChar.sum_eq_zero_of_ne_one`).
    The modulus is required to be nonzero so that `ZMod n` is finite. -/
theorem dirichlet_complete_sum (n : ℕ) [NeZero n] (χ : DirichletCharacter ℂ n) (h : χ ≠ 1) :
    ∑ x, χ x = 0 :=
  MulChar.sum_eq_zero_of_ne_one h

end Frohman.NumberTheory
