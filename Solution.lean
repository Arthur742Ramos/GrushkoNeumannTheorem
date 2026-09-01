import GrushkoNeumann

/-!
# Checked Grushko--Neumann solution

The solution connects the closure-safe public statement to the kernel-checked
finite labelled-graph reduction in `MarshallHall/GrushkoFull.lean`.
-/

open Monoid.Coprod

universe u

theorem rank_freeProduct_eq_add {G H : Type u} [Group G] [Group H]
    [Group.FG G] [Group.FG H] :
    Group.rank (G ∗ H) = Group.rank G + Group.rank H := by
  exact GrushkoNeumann.rank_freeProduct_eq_add
