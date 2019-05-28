package kex;

class IntMathApi {
	public static inline function min( a: Int, b: Int ) : Int
		return a < b ? a : b;

	public static inline function max( a: Int, b: Int ) : Int
		return a > b ? a : b;

	public static inline function sign( f: Int ) : Int
		return f < 0 ? -1 : f > 0 ? 1 : 0;
}
