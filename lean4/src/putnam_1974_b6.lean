import Mathlib
open BigOperators

open Set Nat Polynomial Filter Topology

abbrev putnam_1974_b6_solution : (ℕ × ℕ × ℕ) := sorry
-- ((2^1000 - 1)/3, (2^1000 - 1)/3, 1 + (2^1000 - 1)/3)
theorem putnam_1974_b6
(n : ℤ := 1000)
(count0 : ℕ := {S | S ⊆ Finset.Icc 1 n ∧ S.card ≡ 0 [MOD 3]}.ncard)
(count1 : ℕ := {S | S ⊆ Finset.Icc 1 n ∧ S.card ≡ 1 [MOD 3]}.ncard)
(count2 : ℕ := {S | S ⊆ Finset.Icc 1 n ∧ S.card ≡ 2 [MOD 3]}.ncard)
: (count0, count1, count2) = putnam_1974_b6_solution :=
sorry
