import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure PartialOrderPackage where
  carrierSet : Type u
  orderRelation : carrierSet → carrierSet → Prop
  reflexivity : ∀ a : carrierSet, orderRelation a a
  antisymmetry : ∀ a b : carrierSet, orderRelation a b ∧ orderRelation b a → a = b
  transitivity : ∀ a b c : carrierSet, orderRelation a b ∧ orderRelation b c → orderRelation a c

structure PartialOrderEvidence (P : PartialOrderPackage) where
  reflexivityClosed : P.reflexivity
  antisymmetryClosed : P.antisymmetry
  transitivityClosed : P.transitivity

def PartialOrderClosed (P : PartialOrderPackage) : Prop :=
  P.reflexivity ∧ P.antisymmetry ∧ P.transitivity

theorem partial_order_closed_from_evidence (P : PartialOrderPackage) (E : PartialOrderEvidence P) :
    PartialOrderClosed P := by
  exact And.intro E.reflexivityClosed (And.intro E.antisymmetryClosed E.transitivityClosed)

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse