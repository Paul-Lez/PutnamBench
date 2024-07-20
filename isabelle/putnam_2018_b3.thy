theory putnam_2018_b3 imports Complex_Main
begin

definition putnam_2018_b3_solution::"int set" where "putnam_2018_b3_solution \<equiv> undefined"
(* {2^2, 2^4, 2^8, 2^16} *)
theorem putnam_2018_b3:
  shows "putnam_2018_b3_solution \<equiv> {n::int. n > 3 \<and> n < 10^100 \<and> 
    n dvd 2^(nat n) \<and> (n-1) dvd (2^(nat n) - 1) \<and> (n-2) dvd (2^(nat n) - 2)}"
  sorry

end