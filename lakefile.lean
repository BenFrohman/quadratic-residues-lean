/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Lake

/-!
# lakefile

Machine-checked Lean 4 module.
-/

open Lake DSL

package «quadratic-residues-lean» where
  -- add package configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.14.0"

@[default_target]
lean_lib QuadraticResidues where
  -- QuadraticResidues.lean and QuadraticResidues/Basic.lean (via import)

@[default_target]
lean_lib QuadraticResiduesFull
