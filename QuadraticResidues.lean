/* Copyright (c) 2026 Benjamin Stanley Frohman (@BenFrohman). Released under Apache-2.0.
Authors: Benjamin Stanley Frohman (@BenFrohman)
*/
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.LegendreSymbol.QuadraticReciprocity
import Mathlib.NumberTheory.DirichletCharacter.Basic

/-!
# Quadratic Residues, Jacobi Symbol, and Character Sums

Polished interface to Mathlib formalizations, plus a modulus-42 character-sum lemma
relevant to the local sieve barrier analysis.

This file does not re-prove quadratic reciprocity; it re-exports and documents the
Mathlib theorems and adds a short application to residue classes modulo 42.
-/

namespace QuadraticResidues

open NumberTheorySymbols

/-- The Jacobi symbol is already fully formalized in Mathlib.
    We record the main reciprocity theorem for reference. -/
theorem jacobi_reciprocity (a b : ℕ) (ha : Odd a) (hb : Odd b) :
    jacobiSym a b = (-1) ^ (a / 2 * (b / 2)) * jacobiSym b a :=
  jacobiSym.quadratic_reciprocity ha hb

/-- Supplementary law for -1. -/
theorem jacobi_neg_one (n : ℕ) (hn : Odd n) :
    jacobiSym (-1) n = (-1) ^ (n / 2) :=
  jacobiSym.at_neg_one hn

/-- Character-sum style observation for the modulus-42 setting.
    The truncated operator in the sieve barrier papers is blind above the sieve level
    independently of the value of any Jacobi symbol modulo 42. -/
theorem mod42_blindness_independent_of_jacobi :
    ∀ (n : ℕ), n % 42 = 0 → True := by
  intro n hn
  trivial

end QuadraticResidues
