import Lake
open Lake DSL

package «quadratic-residues-lean» where
  -- add package configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib QuadraticResidues where
  -- add library configuration options here
