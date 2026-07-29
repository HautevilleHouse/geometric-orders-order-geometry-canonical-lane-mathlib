import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure GeometricOrderAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  orderRelation : space → space → Prop
  orderClosed : Prop
  conclusion : orderClosed

structure GeometricOrderWitnessClosed (O : GeometricOrderAdmittedObject) : Prop where
  closedProp : O.orderClosed

def GeometricOrderWitnessClosed (O : GeometricOrderAdmittedObject) : Prop :=
  O.orderClosed

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse