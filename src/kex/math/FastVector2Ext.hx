package kex.math;

import kha.FastFloat;
import kha.math.FastVector2;

class FastVector2Ext {
    public static inline function setFromComponents( v: FastVector2, x: FastFloat, y: FastFloat ) {
        v.x = x;
        v.y = y;
    }
}
