import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure OrderGeometryPackage where
  space : Type
  topology : TopologicalSpace space
  preorder : space → space → Prop
  partialOrder : Prop
  orderTopology : Prop
  continuousOrder : Prop

structure OrderGeometryEvidence (P : OrderGeometryPackage) where
  partialOrderClosed : P.partialOrder
  orderTopologyClosed : P.orderTopology
  continuousOrderClosed : P.continuousOrder

def OrderGeometryClosed (P : OrderGeometryPackage) : Prop :=
  P.partialOrder ∧ P.orderTopology ∧ P.continuousOrder

theorem order_geometry_closed_from_evidence (P : OrderGeometryPackage)
    (E : OrderGeometryEvidence P) : OrderGeometryClosed P := by
  exact And.intro E.partialOrderClosed
    (And.intro E.orderTopologyClosed E.continuousOrderClosed)

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse