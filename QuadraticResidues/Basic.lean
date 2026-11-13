/-
Copyright (c) 2026 Benjamin Stanley Frohman (@BenFrohman). Released under Apache-2.0.
Authors: Benjamin Stanley Frohman (@BenFrohman)
-/
import Mathlib.NumberTheory.LegendreSymbol.Basic
import Mathlib.NumberTheory.LegendreSymbol.QuadraticReciprocity
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.DirichletCharacter.Basic

/-!
# Legendre symbol, quadratic reciprocity, Jacobi symbol, and Dirichlet characters

Clean interface to the Mathlib formalizations. All theorems below are kernel-checked in Mathlib
(0 sorry, standard axioms only).
-/

namespace Frohman.NumberTheory

open Mathlib

/-- Legendre symbol. -/
def legendre (p : ℕ) [Fact p.Prime] (a : ℤ) : ℤ := legendreSym p a

theorem legendre_euler (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (a : ℤ) (ha : ¬ (p : ℤ) ∣ a) :
    legendre p a ≡ a ^ (p / 2) [ZMOD p] :=
  legendreSym.eq_pow ha

theorem legendre_reciprocity (p q : ℕ) [Fact p.Prime] [Fact q.Prime]
    (hp : p ≠ 2) (hq : q ≠ 2) (hpq : p ≠ q) :
    legendre p q * legendre q p = (-1) ^ ((p / 2) * (q / 2)) :=
  legendreSym.quadratic_reciprocity hp hq hpq

/-- Jacobi symbol. -/
def jacobi (a : ℤ) (n : ℕ) : ℤ := jacobiSym a n

theorem jacobi_reciprocity (a b : ℕ) (ha : Odd a) (hb : Odd b) :
    jacobi a b = (-1) ^ (a / 2 * (b / 2)) * jacobi b a :=
  jacobiSym.quadratic_reciprocity ha hb

/-- Dirichlet character sum (complete). -/
theorem dirichlet_complete_sum (n : ℕ) (χ : DirichletCharacter ℂ n) (h : χ ≠ 1) :
    ∑ x, χ x = 0 :=
  DirichletCharacter.sum_eq_zero_of_nontrivial h

end Frohman.NumberTheory
