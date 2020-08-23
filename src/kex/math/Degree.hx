package kex.math;

abstract Degree(Float) to Float {
    public static inline function fromFloat( f: Float )
        return new Degree(f);

    @:from public static inline function ofRadian( r: Radian )
        return new Degree((r : Float) * (180 / Math.PI));

    inline function new( f: Float )
        this = f;
}
