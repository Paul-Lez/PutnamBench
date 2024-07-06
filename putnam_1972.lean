import Mathlib

open BigOperators EuclideanGeometry Filter Topology Set

theorem putnam_1972_a1
(n : ℕ)
(hn : n > 0)
(fourAP : ℤ → ℤ → ℤ → ℤ → Prop := fun n1 n2 n3 n4 => ∃ o1 o2 o3 o4 : ℤ, {n1, n2, n3, n4} = ({o1, o2, o3, o4} : Set ℤ) ∧ o1 ≤ o2 ∧ o2 ≤ o3 ∧ o3 ≤ o4 ∧ o4-o3 = o3-o2 ∧ o3-o2 = o2-o1)
: ¬ ∃ r : ℕ, r > 0 ∧ r + 3 ≤ n ∧ fourAP (n.choose r) (n.choose (r+1)) (n.choose (r+2)) (n.choose (r+3)) :=
sorry

theorem putnam_1972_a2
: (∀ (S : Type*) (_ : Mul S), (∀ x y : S, x * (x * y) = y ∧ ((y * x) * x) = y) → (∀ x y : S, x * y = y * x)) ∧ ∃ (S : Type*) (_ : Mul S), (∀ x y : S, x * (x * y) = y ∧ ((y * x) * x) = y) ∧ ¬(∀ x y z : S, x * (y * z) = (x * y) * z) :=
sorry

-- Note: uses (ℝ → ℝ) instead of (Set.Icc 0 1 → ℝ)
abbrev putnam_1972_a3_solution : Set (ℝ → ℝ) := sorry
-- {f | ∃ A B : ℝ, ∀ x ∈ Set.Icc 0 1, f x = A * x + B}
theorem putnam_1972_a3
(x : ℕ → ℝ)
(climit_exists : (ℕ → ℝ) → Prop := fun x => ∃ C : ℝ, Tendsto (fun n => (∑ i in Finset.range n, (x i))/(n : ℝ)) atTop (𝓝 C))
(supercontinuous : (ℝ → ℝ) → Prop := fun f => ∀ (x : ℕ → ℝ), (∀ i : ℕ, x i ∈ Icc 0 1) → climit_exists x → climit_exists (fun i => f (x i)))
: {f | supercontinuous f} = putnam_1972_a3_solution :=
sorry

theorem putnam_1972_a5
(n : ℕ)
(hn : n > 1)
: ¬((n : ℤ) ∣ 2^n - 1) :=
sorry

open MeasureTheory
theorem putnam_1972_a6
(f : ℝ → ℝ)
(n : ℤ)
(hn : n ≥ 0)
(hfintegrable: IntegrableOn f (Icc 0 1))
(hfint : ∀ i ∈ Icc 0 (n-1), ∫ x in Icc 0 1, x^i*(f x) = 0)
(hfintlast : ∫ x in Icc 0 1, x^n*(f x) = 1)
: ∃ S, S ⊆ Icc (0 : ℝ) 1 ∧ MeasurableSet S ∧ volume S > 0 ∧ ∀ x ∈ S, |f x| ≥ 2^n * (n + 1) :=
sorry

open Metric

theorem putnam_1972_b1
(S : ℝ → ℝ := fun x : ℝ => ∑' n : ℕ, x^n * (x - 1)^(2*n) / (Nat.factorial n))
(p : ℕ → ℝ)
(hp : ∃ a : ℝ, a > 0 ∧ ∀ x ∈ ball 0 a, ∑' n : ℕ, (p n)*x^n = S x)
: ¬∃ n : ℕ, p n = 0 ∧ p (n + 1) = 0 ∧ p (n + 2) = 0 :=
sorry

noncomputable abbrev putnam_1972_b2_solution : ℝ → ℝ → ℝ := sorry
-- fun s v : ℝ ↦ 2 * s / v
theorem putnam_1972_b2
(s v : ℝ)
(hs : s > 0)
(hv : v > 0)
(valid : ℝ → (ℝ → ℝ) → Prop := fun (t : ℝ) (x : ℝ → ℝ) ↦
DifferentiableOn ℝ x (Set.Icc 0 t) ∧ DifferentiableOn ℝ (deriv x) (Set.Icc 0 t)
 ∧ AntitoneOn (deriv (deriv x)) (Set.Icc 0 t) ∧ deriv x 0 = 0 ∧ deriv x t = v ∧ x t - x 0 = s)
: (∃ x : ℝ → ℝ, valid (putnam_1972_b2_solution s v) x) ∧
∀ t > putnam_1972_b2_solution s v, ¬(∃ x : ℝ → ℝ, valid t x) :=
sorry

theorem putnam_1972_b3
(G : Type*) [Group G]
(A B : G)
(hab : A * B * A = B * A^2 * B ∧ A^3 = 1 ∧ (∃ n : ℤ, n > 0 ∧ B^(2*n - 1) = 1))
: B = 1 :=
sorry

theorem putnam_1972_b4
(n : ℤ)
(hn : n > 1)
(vars : ℝ → ℝ → ℝ → (Fin 3 → ℝ) := fun a b c ↦ fun i ↦ ite (i = 0) a (ite (i = 1) b c))
: ∃ P : MvPolynomial (Fin 3) ℝ, ∀ x : ℝ, x = MvPolynomial.eval (vars (x^n) (x^(n+1)) (x + x^(n+2))) P :=
sorry

theorem putnam_1972_b5
(A B C D : EuclideanSpace ℝ (Fin 3))
(hnonplanar : ¬Coplanar ℝ {A, B, C, D})
(hangles : ∠ A B C = ∠ C D A ∧ ∠ B C D = ∠ D A B)
: Euclidean.dist A B = Euclidean.dist C D ∧ Euclidean.dist B C = Euclidean.dist D A :=
sorry

open Metric
theorem putnam_1972_b6
(k : ℕ)
(hk : k ≥ 1)
(n : Fin k → ℤ)
(hn : ∀ i : Fin k, n i > 0)
(hn' : ∀ i j : Fin k, i < j → n i < n j)
(zpoly : ℂ → ℂ := fun z => 1 + ∑ i : Fin k, z^(n i))
: ∀ z : ℂ, z ∈ ball 0 ((Real.sqrt 5 - 1)/2) → zpoly z ≠ 0 :=
sorry
