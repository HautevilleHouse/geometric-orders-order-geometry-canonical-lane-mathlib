import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometry

structure OrderIsomorphismPackage (G₁ G₂ : GeometricOrderPackage) where
  mapping : G₁.carrier → G₂.carrier
  orderPreserving : Prop
  orderReflecting : Prop
  surjective : Prop
  continuous : Prop

structure OrderIsomorphismEvidence {G₁ G₂ : GeometricOrderPackage} (I : OrderIsomorphismPackage G₁ G₂) where
  orderPreservingClosed : I.orderPreserving
  orderReflectingClosed : I.orderReflecting
  surjectiveClosed : I.surjective
  continuousClosed : I.continuous

def OrderIsomorphismClosed {G₁ G₂ : GeometricOrderPackage} (I : OrderIsomorphismPackage G₁ G₂) : Prop :=
  I.orderPreserving ∧ I.orderReflecting ∧ I.surjective ∧ I.continuous

theorem order_isomorphism_closed_from_evidence {G₁ G₂ : GeometricOrderPackage} (I : OrderIsomorphismPackage G₁ G₂) (E : OrderIsomorphismEvidence I) :
    OrderIsomorphismClosed I := by
  exact And.intro E.orderPreservingClosed (And.intro E.orderReflectingClosed (And.intro E.surjectiveClosed E.continuousClosed))

end GeometricOrdersOrderGeometry
end HautevilleHouse