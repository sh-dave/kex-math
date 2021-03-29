package kex.math;

abstract Radians(Float) to Float {
    public static inline function fromFloat( f: Float )
        return new Radians(f);

    @:from public static inline function ofDegrees( d: Degrees )
        return new Radians((d: Float) * (Math.PI / 180));

    inline function new( f: Float )
        this = f;
}
