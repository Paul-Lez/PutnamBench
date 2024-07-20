import Mathlib
open BigOperators

open Set Function Filter Topology

theorem putnam_1964_b1
(a : ℕ → ℤ)
(apos : a > 0)
(ha : ∃ L : ℝ, Tendsto (fun N ↦ ∑ n in Finset.range N, (1 : ℝ) / a n) atTop (𝓝 L))
(b : ℕ → ENNReal := fun n ↦ {k : ℕ | a k ≤ n}.encard)
: (Tendsto (fun n : ℕ ↦ b n / n) atTop (𝓝 0)) :=
sorry
