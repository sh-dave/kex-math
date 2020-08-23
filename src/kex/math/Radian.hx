package kex.math;

abstract Radian(Float) to Float {
    public static inline function fromFloat( f: Float )
        return new Radian(f);

    @:from public static inline function ofDegree( d: Degree )
        return new Radian((d: Float) * (Math.PI / 180));

    inline function new( f: Float )
        this = f;
}
