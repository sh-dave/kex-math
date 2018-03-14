package kex.math;

// TODO (DK) add a FastAABB using kha.FastFloat?
class AABB {
	// min
	public var mx: Float;
	public var my: Float;
	public var mz: Float;
	// max
	public var xx: Float;
	public var xy: Float;
	public var xz: Float;

	//public static function createEmpty()
		//return new AABB(1.0, 0.0, 0.0, -1.0, 0.0, 0.0);

	public static function createEmpty()
		return new AABB(0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

	@:external inline function new( mx, my, mz, xx, xy, xz ) {
		this.mx = mx; this.my = my; this.mz = mz;
		this.xx = xx; this.xy = xy; this.xz = xz;
	}

	@:external public inline function setFromOther( other: AABB ) {
		mx = other.mx; my = other.my; mz = other.mx;
		xx = other.xx; xy = other.xy; xz = other.xz;
	}

	@:external public inline function setNull() {
		//mx = 1.0; my = 0.0; mz = 0.0;
		//xx = -1.0; xy = 0.0; xz = 0.0;

		mx = 0.0; my = 0.0; mz = 0.0;
		xx = 0.0; xy = 0.0; xz = 0.0;
	}

	//public inline function isNull() : Bool
		//return mx > xx || my > xy || mz > xz;

	// TODO (DK) the 'new AABB' doesn't seem to get inlined
	@:external public inline function extendVectorComponents( x: Float, y: Float, z: Float ) : AABB
		return new AABB(
			Math.min(mx, x), Math.min(my, y), Math.min(mz, z),
			Math.max(xx, x), Math.max(xy, y), Math.max(xz, z)
		);

		//return isNull()
			//? new AABB(x, y, z, x, y, z)
			//: new AABB(
				//Math.min(mx, x), Math.min(my, y), Math.min(mz, z),
				//Math.max(xx, x), Math.max(xy, y), Math.max(xz, z)
			//);
}
