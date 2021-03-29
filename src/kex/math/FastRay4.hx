package kex.math;

@:structInit
class FastRay4 {
    public var originx: FastFloat = 0.0;
    public var originy: FastFloat = 0.0;
    public var originz: FastFloat = 0.0;
    public var originw: FastFloat = 1.0;

    public var directionx: FastFloat = 0.0;
    public var directiony: FastFloat = 0.0;
    public var directionz: FastFloat = 0.0;
    public var directionw: FastFloat = 1.0;
}

inline function ray_at( ray: FastRay4, t: FastFloat ) : FastVector4 {
	final dir = fv4(ray.directionx, ray.directiony, ray.directionz, ray.directionw);
	final origin = fv4(ray.originx, ray.originy, ray.originz, ray.originw);
	return dir.mult(t).add(origin);
}

inline function ray_intersect_box_at( ray: FastRay4, box: FastBox3 ) : Null<FastVector4> {
	var tmin: FastFloat;
	var tmax: FastFloat;
	var tymin: FastFloat;
	var tymax: FastFloat;
	var tzmin: FastFloat;
	var tzmax: FastFloat;
	final invdirx: FastFloat = 1 / ray.directionx;
	final invdiry: FastFloat = 1 / ray.directiony;
	final invdirz: FastFloat = 1 / ray.directionz;

	if (invdirx >= 0) {
		tmin = (box.minx - ray.originx) * invdirx;
		tmax = (box.maxx - ray.originx) * invdirx;
	} else {
		tmin = (box.maxx - ray.originx ) * invdirx;
		tmax = (box.minx - ray.originx ) * invdirx;
	}

	if (invdiry >= 0) {
		tymin = (box.miny - ray.originy) * invdiry;
		tymax = (box.maxy - ray.originy) * invdiry;
	} else {
		tymin = (box.maxy - ray.originy) * invdiry;
		tymax = (box.miny - ray.originy) * invdiry;
	}

	if ((tmin > tymax) || (tymin > tmax)) {
		return null;
	}

	// These lines also handle the case where tmin or tmax is NaN
	// (result of 0 * Infinity). x !== x returns true if x is NaN

	if (tymin > tmin || tmin != tmin) {
		tmin = tymin;
	}

	if (tymax < tmax || tmax != tmax) {
		tmax = tymax;
	}

	if (invdirz >= 0) {
		tzmin = (box.minz - ray.originz) * invdirz;
		tzmax = (box.maxz - ray.originz) * invdirz;
	} else {
		tzmin = (box.maxz - ray.originz) * invdirz;
		tzmax = (box.minz - ray.originz) * invdirz;
	}

	if ((tmin > tzmax) || (tzmin > tmax)) {
		return null;
	}

	if (tzmin > tmin || tmin != tmin) {
		tmin = tzmin;
	}

	if (tzmax < tmax || tmax != tmax) {
		tmax = tzmax;
	}

	//return point closest to the ray (positive side)

	if (tmax < 0) {
		return null;
	}

	return ray_at(ray, tmin >= 0 ? tmin : tmax);
}

inline function ray_intersects_box( ray: FastRay4, box: FastBox3 ) : Bool {
	return ray_intersect_box_at(ray, box) != null;
}
