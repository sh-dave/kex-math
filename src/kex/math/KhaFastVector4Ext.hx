package kex.math;

import kha.FastFloat;
import kha.math.FastVector4;

class KhaFastVector4Ext {
    public static inline function dot3( v: FastVector4, o: FastVector4 ) : FastFloat {
        return v.x * o.x + v.y * o.y + v.z * o.z;
    }    
}
