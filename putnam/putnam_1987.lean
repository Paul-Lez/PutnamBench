import Mathlib
open BigOperators


theorem putnam_1987_a1
(A B C D : Set (ℝ × ℝ))
(hA : A = {(x, y) : ℝ × ℝ | x ^ 2 - y ^ 2 = x / (x ^ 2 + y ^ 2)})
(hB : B = {(x, y) : ℝ × ℝ | 2 * x * y + y / (x ^ 2 + y ^ 2) = 3})
(hC : C = {(x, y) : ℝ × ℝ | x ^ 3 - 3 * x * y ^ 2 + 3 * y = 1})
(hD : D = {(x, y) : ℝ × ℝ | 3 * x ^ 2 * y - 3 * x - y ^ 3 = 0})
: A ∩ B = C ∩ D := sorry

abbrev putnam_1987_a2_solution : ℕ := sorry
-- 1984
theorem putnam_1987_a2
(seqind : ℕ → ℕ)
(seqsize : ℕ → ℕ)
(f : ℕ → ℕ)
(hseqind : seqind 1 = 1 ∧ ∀ i ≥ 2, seqind i = seqind (i - 1) + (Nat.digits 10 (i - 1)).length)
(hseqsize : ∀ i ≥ 1, ∀ j : Fin ((Nat.digits 10 i).length), seqsize (seqind i + j) = (Nat.digits 10 i).length)
(hf : ∀ n : ℕ, f n = seqsize (10 ^ n))
: f 1987 = putnam_1987_a2_solution :=
sorry


open MvPolynomial Real

noncomputable abbrev putnam_1987_a4_solution : ℂ := sorry
-- (5 / 3) * sqrt 30
theorem putnam_1987_a4
(P : MvPolynomial (Fin 3) ℂ)
(hPreal : ∀ i : Fin 3 →₀ ℕ, (coeff i P).im = 0)
(F : ℝ → ℝ → ℝ)
(vars : ℂ → ℂ → ℂ → (Fin 3 → ℂ) := fun a b c ↦ fun i ↦ ite (i = 0) a (ite (i = 1) b c))
(h : ∀ x y z u : ℝ, eval (vars (u * x) (u * y) (u * z)) P = u ^ 2 * F (y - x) (z - x))
(hPval : eval (vars 1 0 0) P = 4 ∧ eval (vars 0 1 0) P = 5 ∧ eval (vars 0 0 1) P = 6)
(A B C : ℂ)
(hPABC : eval (vars A B C) P = 0)
(habs : ‖B - A‖ = 10)
: (‖C - A‖ = putnam_1987_a4_solution) :=
sorry

abbrev putnam_1987_a5_solution : Prop := sorry
-- False
theorem putnam_1987_a5
(vec2 : ℝ → ℝ → (Fin 2 → ℝ))
(vec3 : ℝ → ℝ → ℝ → (Fin 3 → ℝ))
(G : (Fin 2 → ℝ) → (Fin 3 → ℝ) := (fun v : Fin 2 → ℝ => vec3 (-v 1 / ((v 0) ^ 2 + 4 * (v 1) ^ 2)) (v 0 / ((v 0) ^ 2 + 4 * (v 1) ^ 2)) 0))
(vrepl : (Fin 3 → ℝ) → Fin 3 → ℝ → (Fin 3 → ℝ) := (fun (v : Fin 3 → ℝ) (i : Fin 3) (vi : ℝ) => (fun j : Fin 3 => if j = i then vi else v j)))
(contdiffv : ((Fin 3 → ℝ) → ℝ) → Fin 3 → (Fin 3 → ℝ) → Prop := (fun (Fi : (Fin 3 → ℝ) → ℝ) (j : Fin 3) (v : Fin 3 → ℝ) => ContDiffAt ℝ 1 (fun vj : ℝ => Fi (vrepl v j vj)) (v j)))
(partderiv : ((Fin 3 → ℝ) → ℝ) → Fin 3 → ((Fin 3 → ℝ) → ℝ) := (fun (Fi : (Fin 3 → ℝ) → ℝ) (j : Fin 3) => (fun v : Fin 3 → ℝ => deriv (fun vi : ℝ => Fi (vrepl v j vj)) (v j))))
(Fprop1 : (Fin 3 → ((Fin 3 → ℝ) → ℝ)) → Prop := (fun F : Fin 3 → ((Fin 3 → ℝ) → ℝ) => ∀ i : Fin 3, ∀ j : Fin 3, ∀ v ≠ 0, contdiffv (F i) j v))
(Fprop2 : (Fin 3 → ((Fin 3 → ℝ) → ℝ)) → Prop := (fun F : Fin 3 → ((Fin 3 → ℝ) → ℝ) => ∀ v ≠ 0, vec3 ((partderiv (F 2) 1 - partderiv (F 1) 2) v) ((partderiv (F 0) 2 - partderiv (F 2) 0) v) ((partderiv (F 1) 0 - partderiv (F 0) 1) v) = 0))
(Fprop3 : (Fin 3 → ((Fin 3 → ℝ) → ℝ)) → Prop := (fun F : Fin 3 → ((Fin 3 → ℝ) → ℝ) => ∀ x y : ℝ, vec3 ((F 0) (vec3 x y 0)) ((F 1) (vec3 x y 0)) ((F 2) (vec3 x y 0)) = G (vec2 x y)))
(hvec2 : ∀ x y : ℝ, (vec2 x y) 0 = x ∧ (vec2 x y) 1 = y)
(hvec3 : ∀ x y z : ℝ, (vec3 x y z) 0 = x ∧ (vec3 x y z) 1 = y ∧ (vec3 x y z) 2 = z)
: (∃ F : Fin 3 → ((Fin 3 → ℝ) → ℝ), Fprop1 F ∧ Fprop2 F ∧ Fprop3 F) ↔ putnam_1987_a5_solution :=
sorry

open Nat Real

abbrev putnam_1987_a6_solution : Set ℝ := sorry
-- {x : ℝ | x > 0 ∧ x < 25}
theorem putnam_1987_a6
(a : ℕ → ℕ := fun n ↦ {i | (digits 3 n).get i = 0}.ncard)
: ({x : ℝ | x > 0 ∧ Summable (fun n ↦ x ^ (a n) / (n ^ 3))} = putnam_1987_a6_solution) :=
sorry

abbrev putnam_1987_b1_solution : ℝ := sorry
-- 1
theorem putnam_1987_b1
: (∫ x in (2)..4, sqrt (log (9 - x)) / (sqrt (log (9 - x)) + sqrt (log (x + 3))) = putnam_1987_b1_solution) :=
sorry

open Nat

theorem putnam_1987_b2
(r s t : ℕ)
(hsum : r + s ≤ t)
: (∑ i : Finset.range (s + 1), (choose s i : ℚ) / (choose t (r + i)) = ((t + 1) : ℚ) / ((t + 1 - s) * choose (t - s) r)) :=
sorry

theorem putnam_1987_b3
(F : Type*) [Field F]
(hF : (1 : F) + 1 ≠ 0)
: {(x, y) : F × F | x ^ 2 + y ^ 2 = 1} = {(1, 0)} ∪ {((r ^ 2 - 1) / (r ^ 2 + 1), (2 * r) / (r ^ 2 + 1)) | r ∈ {r' : F | r' ^ 2 ≠ -1}} :=
sorry

open Filter Topology

abbrev putnam_1987_b4_solution : Prop × ℝ × Prop × ℝ := sorry
-- (True, -1, True, 0)
theorem putnam_1987_b4
(x y : ℕ → ℝ)
(hxy1 : (x 1, y 1) = (0.8, 0.6))
(hx : ∀ n ≥ 1, x (n + 1) = (x n) * cos (y n) - (y n) * sin (y n))
(hy : ∀ n ≥ 1, y (n + 1) = (x n) * sin (y n) + (y n) * cos (y n))
: let (existsx, limx, existsy, limy) := putnam_1987_b4_solution
(((∃ c : ℝ, Tendsto x atTop (𝓝 c)) → existsx) ∧ (existsx → Tendsto x atTop (𝓝 limx)) ∧ ((∃ c : ℝ, Tendsto y atTop (𝓝 c)) → existsy) ∧ (existsy → Tendsto y atTop (𝓝 limy))) :=
sorry

theorem putnam_1987_b5
(n : ℕ)
(npos : n > 0)
(O : Matrix (Fin 1) (Fin n) ℂ := 0)
(M : Matrix (Fin (2 * n)) (Fin n) ℂ)
(hM : ∀ z : Matrix (Fin 1) (Fin (2 * n)) ℂ, z * M = O → (¬∀ i : Fin (2 * n), z 0 i = 0) → ∃ i : Fin (2 * n), (z 0 i).im ≠ 0)
: (∀ r : Matrix (Fin (2 * n)) (Fin 1) ℝ, ∃ w : Matrix (Fin n) (Fin 1) ℂ, ∀ i : (Fin (2 * n)), ((M * w) i 0).re = r i 0) :=
sorry

theorem putnam_1987_b6
(p : ℕ)
(podd : Odd p ∧ Nat.Prime p)
(F : Type*) [Field F] [Fintype F]
(Fcard : Fintype.card F = p ^ 2)
(S : Set F)
(Snz : ∀ x ∈ S, x ≠ 0)
(Scard : S.ncard = ((p : ℤ) ^ 2 - 1) / 2)
(hS : ∀ a : F, a ≠ 0 → Xor' (a ∈ S) (-a ∈ S))
(N : ℕ := (S ∩ {x | ∃ a ∈ S, x = 2 * a}).ncard)
: (Even N) :=
sorry
