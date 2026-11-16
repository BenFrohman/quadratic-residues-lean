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
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib QuadraticResidues where
  -- add library configuration options here
