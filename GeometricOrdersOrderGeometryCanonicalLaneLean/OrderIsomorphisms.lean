import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure OrderIsomorphism (A B : AdmissibleClass) where
  Aorder : PartialOrderStructure A
  Border : PartialOrderStructure B
  f : Aorder.carrier → Border.carrier
  g : Border.carrier → Aorder.carrier
  leftInv : ∀ x : Aorder.carrier, g (f x) = x
  rightInv : ∀ y : Border.carrier, f (g y) = y
  orderPreserving : ∀ x y : Aorder.carrier, Aorder.le x y → Border.le (f x) (f y)
  orderReflecting : ∀ x y : Aorder.carrier, Border.le (f x) (f y) → Aorder.le x y

structure OrderIsomorphismEvidence {A B : AdmissibleClass} (I : OrderIsomorphism A B) where
  AorderClosed : PartialOrderClosed I.Aorder
  BorderClosed : PartialOrderClosed I.Border
  leftInvClosed : I.leftInv
  rightInvClosed : I.rightInv
  orderPreservingClosed : I.orderPreserving
  orderReflectingClosed : I.orderReflecting

def OrderIsomorphismClosed {A B : AdmissibleClass} (I : OrderIsomorphism A B) : Prop :=
  PartialOrderClosed I.Aorder ∧ PartialOrderClosed I.Border ∧ I.leftInv ∧ I.rightInv ∧ I.orderPreserving ∧ I.orderReflecting

theorem order_isomorphism_closed_from_evidence {A B : AdmissibleClass} (I : OrderIsomorphism A B)
    (E : OrderIsomorphismEvidence I) : OrderIsomorphismClosed I := by
  exact And.intro E.AorderClosed (And.intro E.BorderClosed (And.intro E.leftInvClosed (And.intro E.rightInvClosed (And.intro E.orderPreservingClosed E.orderReflectingClosed))))

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse