package kex.math;

@:structInit
class FastBox3 {
    public var minx: FastFloat = Math.POSITIVE_INFINITY;
    public var miny: FastFloat = Math.POSITIVE_INFINITY;
    public var minz: FastFloat = Math.POSITIVE_INFINITY;

    public var maxx: FastFloat = Math.NEGATIVE_INFINITY;
    public var maxy: FastFloat = Math.NEGATIVE_INFINITY;
    public var maxz: FastFloat = Math.NEGATIVE_INFINITY;
}
