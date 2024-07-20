import Mathlib
open BigOperators

open Polynomial Filter Topology ProbabilityTheory MeasureTheory

theorem putnam_1976_b6
(σ : ℕ → ℤ := fun N : ℕ => ∑ d in Nat.divisors N, (d : ℤ))
(quasiperfect : ℕ → Prop := fun N : ℕ => σ N = 2*N + 1)
: ∀ N : ℕ, quasiperfect N → ∃ m : ℤ, Odd m ∧ m^2 = N :=
sorry
