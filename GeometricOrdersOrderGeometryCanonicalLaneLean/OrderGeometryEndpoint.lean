import canonicalLaneMathlib.AdmissibleClass
import GeometricOrdersOrderGeometryCanonicalLaneLean.GeometricOrderStructure
import GeometricOrdersOrderGeometryCanonicalLaneLean.ConvexityBridge
import GeometricOrdersOrderGeometryCanonicalLaneLean.GeodesicContinuity

/-!
# Order Geometry Endpoint Package
-/

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure OrderGeometryEndpointPackage {G : GeometricOrderStructure}
    {B : ConvexityBridgePackage G} {P : GeodesicContinuityPackage G} where
  orderComplete : Prop
  convexGeodesicIso : Prop
  endpointReached : Prop
  orderCompleteTerm : orderComplete
  convexGeodesicIsoTerm : convexGeodesicIso
  endpointReachedTerm : endpointReached

structure OrderGeometryEndpointEvidence {G : GeometricOrderStructure}
    {B : ConvexityBridgePackage G} {P : GeodesicContinuityPackage G}
    (E : OrderGeometryEndpointPackage B P) where
  orderCompleteClosed : E.orderComplete
  convexGeodesicIsoClosed : E.convexGeodesicIso
  endpointReachedClosed : E.endpointReached

def OrderGeometryEndpointClosed {G : GeometricOrderStructure}
    {B : ConvexityBridgePackage G} {P : GeodesicContinuityPackage G}
    (E : OrderGeometryEndpointPackage B P) : Prop :=
  E.orderComplete ∧ E.convexGeodesicIso ∧ E.endpointReached

theorem order_geometry_endpoint_closed_from_evidence {G : GeometricOrderStructure}
    {B : ConvexityBridgePackage G} {P : GeodesicContinuityPackage G}
    (Epkg : OrderGeometryEndpointPackage B P) (Ev : OrderGeometryEndpointEvidence Epkg) :
    OrderGeometryEndpointClosed Epkg := by
  exact And.intro Ev.orderCompleteClosed (And.intro Ev.convexGeodesicIsoClosed Ev.endpointReachedClosed)

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse
