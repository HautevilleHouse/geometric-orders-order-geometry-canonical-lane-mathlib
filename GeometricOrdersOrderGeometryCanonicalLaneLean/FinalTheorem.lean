import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

def ConstrainedGeometricOrdersClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_geometric_orders_endgame (A : AdmissibleClass) :
    ConstrainedGeometricOrdersClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse