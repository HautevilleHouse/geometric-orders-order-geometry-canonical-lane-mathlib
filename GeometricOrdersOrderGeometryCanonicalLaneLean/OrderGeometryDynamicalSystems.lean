import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure OrderPreservingFlowSystem where
  phaseSpace : Type u
  orderRelation : phaseSpace → phaseSpace → Prop
  flowMap : phaseSpace → phaseSpace
  preservesOrder : ∀ x y, orderRelation x y → orderRelation (flowMap x) (flowMap y)
  idempotent : ∀ x, flowMap (flowMap x) = flowMap x

structure OrderPreservingFlowSystemEvidence (S : OrderPreservingFlowSystem) where
  preservesOrderClosed : S.preservesOrder
  idempotentClosed : S.idempotent

def OrderPreservingFlowSystemClosed (S : OrderPreservingFlowSystem) : Prop :=
  S.preservesOrder ∧ S.idempotent

theorem order_preserving_flow_system_closed_from_evidence (S : OrderPreservingFlowSystem)
    (E : OrderPreservingFlowSystemEvidence S) : OrderPreservingFlowSystemClosed S := by
  exact And.intro E.preservesOrderClosed E.idempotentClosed

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse