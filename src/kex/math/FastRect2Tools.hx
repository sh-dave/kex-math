package kex.math;

import kha.FastFloat;
import kha.math.FastVector2;

using kex.math.FastVector2Ext;

enum MarchingAntsMode {
    Step( value: Float );
    Quantity( value: Float );
}

enum abstract RectFace(Int) {
    final Left;
    final Top;
    final Right;
    final Bottom;
}

class FastRect2Tools {
    public static inline function perimeter( r: FastRect2 ) : FastFloat {
        return (r.w + r.h) * 2;
    }

    /**
     * Returns an array of points from the perimeter of the Rectangle,
     * where each point is spaced out based on either the `step` value,
     * or the `quantity`.
     * @return Int
     */
    public static function marchingAnts( r: FastRect2, mode: MarchingAntsMode, out: Array<FastVector2> ) : Int {
        var x = r.x;
        var y = r.y;
        var face = Top;

        final step = -1;
        final quantity = switch mode {
            case Step(value): -1;
            case Quantity(value): -1;
        }

        for (i in 0...quantity) {
            out[i].setFromComponents(x, y);

            switch face {
                case Top:
                    x += step;

                    if (x >= r.right) {
                        face = Right;
                        y += (x - r.right);
                        x = r.right;
                    }

                case Right:
                    y += step;

                    if (y >= r.bottom) {
                        face = Bottom;
                        x -= (y - r.bottom);
                        y = r.bottom;
                    }

                case Bottom:
                    x -= step;

                    if (x <= r.left) {
                        face = Left;
                        y -= (r.left - x);
                        x = r.left;
                    }

                case Left:
                    y -= step;

                    if (y <= r.top) {
                        face = Top;
                        y = r.top;
                    }
            }
        }

        return quantity;
    }
}
