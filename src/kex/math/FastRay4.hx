package kex.math;

import kha.FastFloat;
import kha.math.FastVector4;

@:structInit
class FastRay4 {
    public var ox: FastFloat = 0.0;
    public var oy: FastFloat = 0.0;
    public var oz: FastFloat = 0.0;
    public var ow: FastFloat = 1.0;

    public var dx: FastFloat = 0.0;
    public var dy: FastFloat = 0.0;
    public var dz: FastFloat = 0.0;
    public var dw: FastFloat = 1.0;
}

class FastRay4Math {
    public static inline function at( ray: FastRay4, t: FastFloat ) : FastVector4 {
        return new FastVector4(ray.dx, ray.dy, ray.dz, ray.dw)
            .mult(t)
            .add(new FastVector4(ray.ox, ray.oy, ray.oz, ray.ow));
    }

	// public function distanceToPoint(point:Vec4):Float
    // public function intersectsSphere(sphereCenter:Vec4, sphereRadius:Float):Bool
    // public function intersectsPlane(plane:Plane):Bool
    // public function distanceToPlane(plane:Plane):Float
    // public function intersectPlane(plane:Plane):Vec4
    // public function intersectsBox(center:Vec4, size:Vec4):Bool
    // public function intersectBox(center:Vec4, size:Vec4):Vec4
    // public function intersectTriangle(a:Vec4, b:Vec4, c:Vec4, backfaceCulling:Bool):Vec4
}
