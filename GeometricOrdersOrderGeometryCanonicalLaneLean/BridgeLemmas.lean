import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  OrderGeometryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse