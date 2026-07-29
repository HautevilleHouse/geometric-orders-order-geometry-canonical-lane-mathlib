import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometry

structure FixedPointTheoremPackage (G : GeometricOrderPackage) where
  monotoneFunction : G.carrier → G.carrier
  isotoneProperty : Prop
  leastFixedPointExists : Prop
  greatestFixedPointExists : Prop

structure FixedPointTheoremEvidence {G : GeometricOrderPackage} (F : FixedPointTheoremPackage G) where
  isotonePropertyClosed : F.isotoneProperty
  leastFixedPointExistsClosed : F.leastFixedPointExists
  greatestFixedPointExistsClosed : F.greatestFixedPointExists

def FixedPointTheoremClosed {G : GeometricOrderPackage} (F : FixedPointTheoremPackage G) : Prop :=
  F.isotoneProperty ∧ F.leastFixedPointExists ∧ F.greatestFixedPointExists

theorem fixed_point_theorem_closed_from_evidence {G : GeometricOrderPackage} (F : FixedPointTheoremPackage G) (E : FixedPointTheoremEvidence F) :
    FixedPointTheoremClosed F := by
  exact And.intro E.isotonePropertyClosed (And.intro E.leastFixedPointExistsClosed E.greatestFixedPointExistsClosed)

end GeometricOrdersOrderGeometry
end HautevilleHouse