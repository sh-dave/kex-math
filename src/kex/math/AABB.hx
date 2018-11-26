package kex.math;

// TODO (DK) add a FastAABB using kha.FastFloat?
class AABB {
	public var minX: Float;
	public var minY: Float;
	public var minZ: Float;
	public var maxX: Float;
	public var maxY: Float;
	public var maxZ: Float;

	public static function createEmpty()
		return new AABB(0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

	inline function new(
		minX: Float, minY: Float, minZ: Float,
		maxX: Float, maxY: Float, maxZ: Float
	) {
		this.minX = minX; this.minY = minY; this.minZ = minZ;
		this.maxX = maxX; this.maxY = maxY; this.maxZ = maxZ;
	}

	@:extern public inline function setFromOther( other: AABB ) : AABB {
		minX = other.minX; minY = other.minY; minZ = other.minZ;
		maxX = other.maxX; maxY = other.maxY; maxZ = other.maxZ;
		return this;
	}

	@:extern public inline function setNull() : AABB {
		minX = 0.0; minY = 0.0; minZ = 0.0;
		maxX = 0.0; maxY = 0.0; maxZ = 0.0;
		return this;
	}

	@:extern public inline function extendVectorComponents( x: Float, y: Float, z: Float ) : AABB
		return new AABB(
			Math.min(minX, x), Math.min(minY, y), Math.min(minZ, z),
			Math.max(maxX, x), Math.max(maxY, y), Math.max(maxZ, z)
		);
}
