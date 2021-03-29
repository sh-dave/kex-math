package kex.math;

import kha.math.FastVector4;

using kex.math.KhaFastVector4Ext;

@:structInit
class FastPlane4 {
    public var nx: FastFloat = 0.0;
    public var ny: FastFloat = 0.0;
    public var nz: FastFloat = 0.0;
    public var nw: FastFloat = 1.0;
    public var c: FastFloat = 0.0;
}

class FastPlane4Math {
    public static inline function distanceToPoint( p: FastPlane4, point: FastVector4 ) : FastFloat {
        return new FastVector4(p.nx, p.ny, p.nz, p.nw).dot(point) + p.c;
    }

    // public function setFromNormalAndCoplanarPoint(normal:Vec4, point:Vec4):Plane
}
