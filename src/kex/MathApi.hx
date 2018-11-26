package kex;

class MathApi {
	@:external public static inline function mini( a: Int, b: Int ) : Int
		return a < b ? a : b;

	@:external public static inline function maxi( a: Int, b: Int ) : Int
		return a > b ? a : b;

	// linear interpolation
	@:external public static inline function lerp( t: Float, a: Float, b: Float ) : Float
		return a + t * (b - a);

	// reverse linear interpolation
	@:external public static inline function unlerp( t: Float, a: Float, b: Float ) : Float
		return (t - a) / (b - a);

	// map x from [a; b] to [c; d]
	@:external public static inline function linearRemap( x: Float, a: Float, b: Float, c: Float, d: Float ) : Float
		return lerp(unlerp(x, a, b), c, d);
}
