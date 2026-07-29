import GeometricOrdersOrderGeometryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure GeometricOrdersSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GeometricOrdersAdmittedObject where
  space : GeometricOrdersSpace
  orderStructure : Prop
  geometricProperty : Prop
  witness : Prop
  conclusion : witness

structure GeometricOrdersEndgameState where
  object : GeometricOrdersAdmittedObject

def GeometricOrdersWitnessClosed (O : GeometricOrdersAdmittedObject) : Prop :=
  O.witness

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse