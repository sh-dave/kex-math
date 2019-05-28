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

   public static inline function euclidianDistanceSquared( x1, y1, x2, y2 ) : Float {
        var dx = x1 - x2;
        var dy = y1 - y2;
        return dx * dx + dy * dy;
    }

    public static inline function euclidianDistance( x1, y1, x2, y2 )
        return Math.sqrt(euclidianDistanceSquared(x1, y1, x2, y2));

	public static inline function between( x: Float, a: Float, b: Float )
		return a <= x && x < b;

	public static inline function intersect( x0: Float, y0: Float, w0: Float, h0: Float, x1: Float, y1: Float, w1: Float, h1: Float )
		return !(((x1 > (x0 + w0)) || ((x1 + w1) < x0) || (y1 > (y0 + h0)) || (y1 + h1) < y0));

	public static inline function pointInRect( px: Float, py: Float, x: Float, y: Float, w: Float, h: Float )
		return between(px, x, x + w) && between(py, y, y + h);

	public static inline function contains( x: Float, y: Float, w: Float, h: Float, bx: Float, by: Float, bw: Float, bh: Float )
		return pointInRect(x, y, bx, by, bw, bh) && pointInRect(x + w, y + w, bx, by, bw, bh);

	public static inline function fractional( x: Float )
		return x - Std.int(x);

	public static inline function saturate( x: Float )
		return Math.max(0, Math.min(1, x));
}
