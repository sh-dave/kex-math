package;

import kex.RandomApi.*;
import kha.math.*;

// using kha.graphics2.GraphicsExtension;

class Main {
	public static function main() {
		var opts = {
			title: 'WOK',
		}

		kha.System.init(opts, kha.Assets.loadEverything.bind(setup));
	}

	static inline var Points = 10000000;
	static var points2: Array<FastVector2> = [for (i in 0...Points) new FastVector2()];
	// static var points2d: Array<FastVector2> = [for (i in 0...Points) new FastVector2()];
	static var points3: Array<FastVector3> = [for (i in 0...Points) new FastVector3()];
	// static var points3d: Array<FastVector3> = [for (i in 0...Points) new FastVector3()];

	static function setup() {
		kha.math.Random.init(42);

		var p2s = kha.Scheduler.realTime();
		for (i in 0...Points) {
			points2[i].setFrom(insideCircle(128.0));
		}
		var p2e = kha.Scheduler.realTime();

		var p2ds = kha.Scheduler.realTime();
		for (i in 0...Points) {
			points2[i].setFrom(insideCircleD(128.0));
		}
		var p2de = kha.Scheduler.realTime();

		var p3s = kha.Scheduler.realTime();
		for (i in 0...Points) {
			points3[i].setFrom(insideSphere(128.0));
		}
		var p3e = kha.Scheduler.realTime();

		var p3ds = kha.Scheduler.realTime();
		for (i in 0...Points) {
			points3[i].setFrom(insideSphereD(128.0));
		}
		var p3de = kha.Scheduler.realTime();

		trace(p2e - p2s);
		trace(p2de - p2ds);
		trace(p3e - p3s);
		trace(p3de - p3ds);

		trace('done');

		// kha.System.notifyOnRender(function( fb: kha.Framebuffer ) {
		// 	points2.push(insideCircle(128.0));
		// 	// points3.push(insideSphere(128.0));

		// 	var g2 = fb.g2;
		// 	g2.begin();
		// 		g2.color = kha.Color.White;
		// 		g2.drawCircle(256, 256, 128, 1, 32);

		// 		g2.color = kha.Color.Green;

		// 		for (p in points2) {
		// 		// for (p in points3) {
		// 			g2.drawRect(256 + p.x, 256 + p.y, 1, 1, 1);
		// 		}
		// 	g2.end();
		// });
	}
}
