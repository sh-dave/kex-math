package kex;

import kha.FastFloat;
import kha.math.FastVector2;
import kha.math.FastVector3;
import kha.math.Random;
import Math.*;

class RandomApi {
	@:external public static inline function int( from: Int, to: Int ) : Int
		return Random.getIn(from, to);

	public static function shuffle<T>( a: Array<T> ) : Array<T> {
		if (a != null) {
			for (i in 0...a.length) {
				var j = int(0, a.length - 1);
				var x = a[i];
				var y = a[j];
				a[i] = y;
				a[j] = x;
			}
		}

		return a;
	}

// 10000000 runs on debug-html5
	// insideCircle: 7.80137
	// insideCircle discard: 1.5625099999999996
	// insideSphere: 11.832985
	// insideSphere discard: 3.391484999999996

// 10000000 runs on html5
	// insideCircle: 6.887699999962933
	// insideCircle discard: 0.6651000001002103
	// insideSphere: 8.407999999937601
	// insideSphere discard: 1.4773999999742955

// 10000000 runs on windows
	// insideCircle: 0.792985778943015
	// insideCircle discard: 0.646771801065958
	// insideSphere: 1.58715910602148
	// insideSphere discard: 1.49803103174638

	@:extern public static inline function insideUnitCircle() : FastVector2
		return insideCircle(0.5);

	// @:extern public static inline function insideCircle( radius: Float ) : FastVector2 {
	// 	var theta = Random.getFloatIn(0, 2 * PI);
	// 	var distance = sqrt(Random.getFloatIn(0, 1)) * radius;
	// 	var x = distance * cos(theta);
	// 	var y = distance * sin(theta);
	// 	return new FastVector2(x, y);
	// }

	@:extern public static inline function insideCircle( radius: Float ) : FastVector2 {
		var x: FastFloat;
		var y: FastFloat;

		do {
			x = Random.getFloatIn(-radius, radius);
			y = Random.getFloatIn(-radius, radius);
		} while (x * x + y * y > radius * radius);

		return new FastVector2(x, y);
	}

	@:extern public static inline function insideUnitSphere() : FastVector3
		return insideSphere(0.5);

	// @:extern public static inline function insideSphere( radius: Float ) : FastVector3 {
	// 	var phi = Random.getFloatIn(0, PI * 2);
	// 	var costheta = Random.getFloatIn(-1, 1);
	// 	var u = Random.getFloatIn(0, 1);
	// 	var theta = acos(costheta);
	// 	var r = radius * sqrt(u);
	// 	var x = r * sin(theta) * cos(phi);
	// 	var y = r * sin(theta) * sin(phi);
	// 	var z = r * cos(theta);
	// 	return new FastVector3(x, y, z);
	// }

	@:extern public static inline function insideSphere( radius: Float ) : FastVector3 {
		var x: FastFloat;
		var y: FastFloat;
		var z: FastFloat;

		do {
			x = Random.getFloatIn(-radius, radius);
			y = Random.getFloatIn(-radius, radius);
			z = Random.getFloatIn(-radius, radius);
		} while (x * x + y * y + z * z > radius * radius);

		return new FastVector3(x, y, z);
	}
}
