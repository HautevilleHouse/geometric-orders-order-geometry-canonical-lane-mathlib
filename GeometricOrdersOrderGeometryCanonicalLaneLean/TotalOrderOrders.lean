import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure TotalOrderStructure (A : AdmissibleClass) where
  carrier : Type u
  le : carrier → carrier → Prop
  partialOrder : PartialOrderStructure A
  total : ∀ x y : carrier, le x y ∨ le y x

structure TotalOrderEvidence {A : AdmissibleClass} (T : TotalOrderStructure A) where
  partialOrderClosed : PartialOrderClosed T.partialOrder
  totalClosed : T.total

def TotalOrderClosed {A : AdmissibleClass} (T : TotalOrderStructure A) : Prop :=
  PartialOrderClosed T.partialOrder ∧ T.total

theorem total_order_closed_from_evidence {A : AdmissibleClass} (T : TotalOrderStructure A)
    (E : TotalOrderEvidence T) : TotalOrderClosed T := by
  exact And.intro E.partialOrderClosed E.totalClosed

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse