package kex;

class RandomApi {
	@:external public static inline function int( from: Int, to: Int ) : Int
		return kha.math.Random.Default.GetIn(from, to);

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
}
