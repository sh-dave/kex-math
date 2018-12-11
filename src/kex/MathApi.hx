package kex;

class MathApi {
	// linear interpolation
	public static inline function lerp( t: Float, a: Float, b: Float ) : Float
		return a + t * (b - a);

	// reverse linear interpolation
	public static inline function unlerp( t: Float, a: Float, b: Float ) : Float
		return (t - a) / (b - a);

	// map x from [a; b] to [c; d]
	public static inline function linearRemap( x: Float, a: Float, b: Float, c: Float, d: Float ) : Float
		return lerp(unlerp(x, a, b), c, d);

	public static inline function sign( f: Float ) : Float
		return f < 0 ? -1 : f > 0 ? 1 : 0;
}