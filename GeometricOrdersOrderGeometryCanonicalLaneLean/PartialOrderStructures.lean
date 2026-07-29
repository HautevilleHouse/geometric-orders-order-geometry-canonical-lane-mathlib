import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure PartialOrderStructure (A : AdmissibleClass) where
  carrier : Type u
  le : carrier → carrier → Prop
  refl : ∀ x : carrier, le x x
  antisymm : ∀ x y : carrier, le x y → le y x → x = y
  trans : ∀ x y z : carrier, le x y → le y z → le x z

structure PartialOrderEvidence {A : AdmissibleClass} (S : PartialOrderStructure A) where
  reflClosed : S.refl
  antisymmClosed : S.antisymm
  transClosed : S.trans

def PartialOrderClosed {A : AdmissibleClass} (S : PartialOrderStructure A) : Prop :=
  S.refl ∧ S.antisymm ∧ S.trans

theorem partial_order_closed_from_evidence {A : AdmissibleClass} (S : PartialOrderStructure A)
    (E : PartialOrderEvidence S) : PartialOrderClosed S := by
  exact And.intro E.reflClosed (And.intro E.antisymmClosed E.transClosed)

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse