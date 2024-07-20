import Mathlib
open BigOperators

open Set Function Filter Topology Polynomial Real

abbrev putnam_1982_a2_solution : Prop := sorry
-- True
theorem putnam_1982_a2
(B : ℕ → ℝ → ℝ := fun n x ↦ ∑ k in Finset.Icc 1 n, k ^ x)
(f : ℕ → ℝ := fun n ↦ B n (logb n 2) / (n * logb 2 n) ^ 2)
: (∃ L : ℝ, Tendsto (fun N ↦ ∑ j in Finset.Icc 2 N, f j) atTop (𝓝 L)) ↔ putnam_1982_a2_solution :=
sorry
