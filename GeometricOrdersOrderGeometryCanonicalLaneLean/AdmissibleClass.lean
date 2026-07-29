import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedOrderGeometryObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  OrderGeometryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse