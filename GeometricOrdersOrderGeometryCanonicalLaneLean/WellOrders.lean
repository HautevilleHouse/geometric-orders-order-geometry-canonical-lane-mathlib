import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure WellOrderStructure (A : AdmissibleClass) where
  carrier : Type u
  le : carrier → carrier → Prop
  partialOrder : PartialOrderStructure A
  totalOrder : TotalOrderStructure A
  wellFounded : ∀ (s : Set carrier), s.Nonempty → ∃ m ∈ s, ∀ x ∈ s, le m x

structure WellOrderEvidence {A : AdmissibleClass} (W : WellOrderStructure A) where
  partialOrderClosed : PartialOrderClosed W.partialOrder
  totalOrderClosed : TotalOrderClosed W.totalOrder
  wellFoundedClosed : W.wellFounded

def WellOrderClosed {A : AdmissibleClass} (W : WellOrderStructure A) : Prop :=
  PartialOrderClosed W.partialOrder ∧ TotalOrderClosed W.totalOrder ∧ W.wellFounded

theorem well_order_closed_from_evidence {A : AdmissibleClass} (W : WellOrderStructure A)
    (E : WellOrderEvidence W) : WellOrderClosed W := by
  exact And.intro (And.intro E.partialOrderClosed E.totalOrderClosed) E.wellFoundedClosed

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse