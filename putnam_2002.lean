import Mathlib
open BigOperators

open Nat
abbrev putnam_2002_a1_solution : ℕ → ℕ → ℝ := sorry
-- (fun k n : ℕ => (-k) ^ n * (n)!)
theorem putnam_2002_a1
(k : ℕ)
(P : ℕ → Polynomial ℝ)
(kpos : k > 0)
(Pderiv : ∀ n : ℕ, ∀ x : ℝ, iteratedDeriv n (fun x' : ℝ => 1 / (x' ^ k - 1)) x = ((P n).eval x) / ((x ^ k - 1) ^ (n + 1)))
: ∀ n : ℕ, (P n).eval 1 = putnam_2002_a1_solution k n :=
sorry

theorem putnam_2002_a2
(sphere : Set (Fin 3 → ℝ) := {P : Fin 3 → ℝ | Euclidean.dist 0 P = 1})
(hemi : (Fin 3 → ℝ) → Set (Fin 3 → ℝ) := fun V ↦ {P : Fin 3 → ℝ | Matrix.dotProduct P V ≥ 0})
: (∀ (S : Set (Fin 3 → ℝ)), S ⊆ sphere ∧ S.encard = 5 → ∃ V : (Fin 3 → ℝ), V ≠ 0 ∧ (S ∩ hemi V).encard = 4) :=
sorry

theorem putnam_2002_a3
(n : ℤ)
(hn : n ≥ 2)
(Tn : ℤ)
(hTn : Tn = Set.ncard {S : Set ℤ | S ⊆ Set.Icc 1 n ∧ Nonempty S ∧ ∃ k : ℤ, k = ((1 : ℝ) / S.ncard) * (∑' s : S, s.1)})
: Even (Tn - n) :=
sorry

open Set

theorem putnam_2002_a5
(a : ℕ → ℚ)
(ha : a 0 = 1 ∧ ∀ n : ℕ, a (2*n + 1) = a n ∧ a (2*n + 2) = a n + a (n + 1))
: ∀ q : ℚ, q > 0 → q ∈ {a (n - 1) / a n | n ∈ Ici 1} :=
sorry

open Topology Filter

abbrev putnam_2002_a6_solution : Set ℕ := sorry
-- {2}
theorem putnam_2002_a6
(f : ℕ → ℕ → ℝ)
(hf : ∀ b : ℕ, f b 1 = 1 ∧ f b 2 = 2 ∧ ∀ n ∈ Ici 3, f b n = n * f b (Nat.digits b n).length)
: {b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} = putnam_2002_a6_solution :=
sorry

theorem putnam_2002_b3
(e : ℝ := Real.exp 1)
(f : ℤ → ℝ := fun n : ℤ => 1/e - (1 - 1/n)^n)
: ∀ n : ℤ, n > 1 → 1/(2*n*e) < f n ∧ f n < 1/(n*e) :=
sorry

theorem putnam_2002_b5
: ∃ n : ℕ, {b : ℕ | (Nat.digits b n).length = 3 ∧ List.Palindrome (Nat.digits b n)}.ncard ≥ 2002 :=
sorry

open Matrix
open MvPolynomial

theorem putnam_2002_b6
(p : ℕ)
(hp : Nat.Prime p)
(M : Matrix (Fin 3) (Fin 3) (MvPolynomial (Fin 3) ℤ) := fun r : Fin 3 => fun c : Fin 3 => (X c)^(p^(r : ℕ)))
(cong : ℕ → MvPolynomial (Fin 3) ℤ × MvPolynomial (Fin 3) ℤ → Prop := fun p : ℕ => fun (f, g) => ∀ n : Fin 3 →₀ ℕ, Int.ModEq p (f.coeff n) (g.coeff n))
: ∃ S : Finset (MvPolynomial (Fin 3) ℤ), cong p ((det M), (∏ s in S, s)) ∧ ∀ s ∈ S, (∃ a b c : ℤ, s = (C a)*(X 0) + (C b)*(X 1) + (C c)*(X 2)) :=
sorry
