package kex.math;

abstract Degrees(Float) to Float {
    public static inline function fromFloat( f: Float )
        return new Degrees(f);

    @:from public static inline function ofRadians( r: Radians )
        return new Degrees((r : Float) * (180 / Math.PI));

    inline function new( f: Float )
        this = f;
}
