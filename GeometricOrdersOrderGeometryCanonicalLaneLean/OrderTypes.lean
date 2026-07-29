import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure LinearOrderType where
  carrier : Type
  le : carrier → carrier → Prop
  linearOrder : Prop
  denseOrder : Prop
  orderComplete : Prop
  separable : Prop

structure LinearOrderTypeEvidence (L : LinearOrderType) where
  linearOrderClosed : L.linearOrder
  denseOrderClosed : L.denseOrder
  orderCompleteClosed : L.orderComplete
  separableClosed : L.separable

def LinearOrderTypeClosed (L : LinearOrderType) : Prop :=
  L.linearOrder ∧ L.denseOrder ∧ L.orderComplete ∧ L.separable

theorem linear_order_type_closed_from_evidence (L : LinearOrderType)
    (E : LinearOrderTypeEvidence L) : LinearOrderTypeClosed L := by
  exact And.intro E.linearOrderClosed
    (And.intro E.denseOrderClosed
      (And.intro E.orderCompleteClosed E.separableClosed))

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse