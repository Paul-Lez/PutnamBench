import Mathlib
open BigOperators

open Set Topology Filter Polynomial

abbrev putnam_1979_b3_solution : ℕ → ℤ := sorry
-- fun n ↦ (n - 1) / 2
theorem putnam_1979_b3
(F : Type*) [Field F] [Fintype F]
(n : ℕ := Fintype.card F)
(nodd : Odd n)
(b c : F)
(p : Polynomial F := X ^ 2 + (C b) * X + (C c))
(hp : Irreducible p)
: ({d : F | Irreducible (p + (C d))}.ncard = putnam_1979_b3_solution n) :=
sorry
