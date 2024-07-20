import Mathlib
open BigOperators

open Filter Topology

-- Note: uses (ℕ → ℝ) instead of (Fin n → ℝ)
abbrev putnam_1991_a3_solution : Set (Polynomial ℝ) := sorry
-- {p : Polynomial ℝ | p.degree = 2 ∧ (∃ r1 r2 : ℝ, r1 ≠ r2 ∧ p.eval r1 = 0 ∧ p.eval r2 = 0)}
theorem putnam_1991_a3
(p : Polynomial ℝ)
(n : ℕ)
(pr : Prop)
(hn : n = p.degree)
(hpr : pr = ∃ r : ℕ → ℝ, (∀ i : Fin (n - 1), r i < r (i + 1)) ∧ (∀ i : Fin n, p.eval (r i) = 0) ∧ (∀ i : Fin (n - 1), (Polynomial.derivative p).eval ((r i + r (i + 1)) / 2) = 0))
: (n ≥ 2 ∧ pr) ↔ p ∈ putnam_1991_a3_solution :=
sorry
