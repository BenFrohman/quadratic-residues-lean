# Kernel certificate: quadratic-residues-lean

This file records a reproducible machine check of the Lean 4 development in this repository. Lean does not issue a signed "official" certificate. What is recorded here is the exact commit and toolchain, the complete `lake build` log, a scan for `sorry`/`admit`/`native_decide`/`axiom`, the `#print axioms` result for every theorem the build produces, and a replay of every module through Lean's kernel with the toolchain's `leanchecker`. Each check can be rerun with the command at the end.

| Item | Value |
|---|---|
| Repository | https://github.com/BenFrohman/quadratic-residues-lean |
| Certified commit | `ff7d45b36da604513c2ebec32f06bd881cb9804b` (branch `chore/kernel-certificate`) |
| Lean sources | identical to `main` at `744eeb957bf39d471895957a28f8f872ec928b62`: no `.lean`, lakefile, manifest or toolchain file differs; the certified commit only adds CI and the scripts in `certificates/tools/` |
| lean-toolchain | `leanprover/lean4:v4.14.0` |
| Lean | Lean (version 4.14.0, x86_64-unknown-linux-gnu, commit 410fab728470, Release) |
| Mathlib | `4bbdccd9c5f862bf90ff12f0a9e2c8be032b9a84` (lake-manifest.json; inputRev `v4.14.0`) |
| Date (UTC) | 2026-11-16T19:13:40Z |
| CI run | https://github.com/BenFrohman/quadratic-residues-lean/actions/runs/43937053385 |
| `lake build` | `Build completed successfully.` ([build.log](build.log)) |
| sorry / admit / native_decide / axiom scan | `RESULT: 0 hits` ([sorry-scan.txt](sorry-scan.txt)) |
| `#print axioms` | `AUDIT PASS: 2 theorems in 1 modules depend only on propext, Classical.choice, Quot.sound (or on no axioms)` ([axioms.txt](axioms.txt)) |
| Kernel replay (leanchecker) | `RESULT: 1 of 1 modules replayed through the kernel, 0 failures` ([leanchecker.txt](leanchecker.txt)) |

## What each check means

- **Build.** `lake build` of the default targets with the pinned toolchain. Mathlib comes from `lake exe cache get` (it is never rebuilt from source). The build elaborates every proof and sends each declaration to Lean's kernel.
- **Scan.** `certificates/tools/sorry_scan.py` strips comments and strings from every tracked `.lean` file and reports any `sorry`, `admit`, `native_decide` or `axiom` declaration. Result: RESULT: 0 hits.
- **Axioms.** `certificates/tools/gen_audit.py` imports all 1 built modules ([modules.txt](modules.txt)) and calls `Lean.collectAxioms`, the function behind `#print axioms`, on every theorem declared in them (2 theorems, auto-generated internal names excluded). `check_audit.py` fails unless each depends only on `propext`, `Classical.choice` and `Quot.sound`, or on no axioms. Raw output: [axioms.raw.txt](axioms.raw.txt); generated Lean file: [KernelCertificateAudit.lean.txt](KernelCertificateAudit.lean.txt).
- **Kernel replay.** checker: lean4checker tag v4.14.0 (bee437b6b8584f779bc20ab8b7e27934d4f711ac), Main.lean prefix match -> exact match. For each module, the checker loads the module's imports from their `.olean` files and replays every declaration of that module through the kernel. The stock checker treats its argument as a module-name prefix and replays all matching modules in parallel, which runs out of memory on a root module, so it is run once per module with exact matching (the one-line patch is printed in [leanchecker.txt](leanchecker.txt)). The checker's own documentation describes it as a tool to detect environment hacking, not an independent external verifier; imported Mathlib and core declarations are trusted from their `.olean` files.

## Scope

The axiom result says the listed theorems are proved from Lean's standard axioms. It does not by itself say what the theorems mean; read the statements in the sources. Conditional theorems remain conditional on their hypotheses.

Full `#print axioms` output (verbatim from `axioms.txt`):

```
'Frohman.QuadraticResidues.jacobi_reciprocity' depends on axioms: [propext, Classical.choice, Quot.sound]
'Frohman.QuadraticResidues.reciprocity' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Rebuild

```
git clone https://github.com/BenFrohman/quadratic-residues-lean.git && cd quadratic-residues-lean && git checkout ff7d45b36da604513c2ebec32f06bd881cb9804b && lake exe cache get && lake build && python3 certificates/tools/sorry_scan.py && python3 certificates/tools/gen_audit.py /tmp/KernelCertificateAudit.lean /tmp/modules.txt && lake env lean /tmp/KernelCertificateAudit.lean > /tmp/axioms.raw.txt && python3 certificates/tools/check_audit.py /tmp/axioms.raw.txt | tail -n 1
```
