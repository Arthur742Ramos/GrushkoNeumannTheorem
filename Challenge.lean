import Mathlib.GroupTheory.Coprod.Basic
import Mathlib.GroupTheory.Finiteness
import Mathlib.GroupTheory.Rank

/-!
# Grushko--Neumann rank additivity

The public statement is deliberately small: the substantive proof is kept in
the implementation library and the Comparator checks this exact theorem
against `Solution.lean`.
-/

open Monoid.Coprod
open Set

universe u

namespace MarshallHall
namespace GeneralGrushko

variable {G H : Type*} [Group G] [Group H]

instance coprod_fg [Group.FG G] [Group.FG H] : Group.FG (G ∗ H) := by
  rcases Group.fg_iff.mp (show Group.FG G from inferInstance) with ⟨S, hS, hSf⟩
  rcases Group.fg_iff.mp (show Group.FG H from inferInstance) with ⟨T, hT, hTf⟩
  refine Group.fg_iff.mpr ⟨inl '' S ∪ inr '' T, ?_, hSf.image _ |>.union (hTf.image _)⟩
  have hleftSub : Subgroup.closure ((inl : G →* G ∗ H) '' S) =
      MonoidHom.range (inl : G →* G ∗ H) := by
    rw [← MonoidHom.map_closure, hS, MonoidHom.range_eq_map]
  have hrightSub : Subgroup.closure ((inr : H →* G ∗ H) '' T) =
      MonoidHom.range (inr : H →* G ∗ H) := by
    rw [← MonoidHom.map_closure, hT, MonoidHom.range_eq_map]
  have hrangeleft : Subgroup.closure (Set.range (inl : G →* G ∗ H)) =
      MonoidHom.range (inl : G →* G ∗ H) := by
    rw [← MonoidHom.coe_range, Subgroup.closure_eq]
  have hrangeright : Subgroup.closure (Set.range (inr : H →* G ∗ H)) =
      MonoidHom.range (inr : H →* G ∗ H) := by
    rw [← MonoidHom.coe_range, Subgroup.closure_eq]
  rw [← closure_range_inl_union_inr]
  rw [Subgroup.closure_union, Subgroup.closure_union,
    hleftSub, hrightSub, hrangeleft, hrangeright]

end GeneralGrushko
end MarshallHall

/-- The rank of a binary free product is the sum of the factor ranks. -/
theorem rank_freeProduct_eq_add {G H : Type u} [Group G] [Group H]
    [Group.FG G] [Group.FG H] :
    Group.rank (G ∗ H) = Group.rank G + Group.rank H := by
  sorry
