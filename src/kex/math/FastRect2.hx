package kex.math;

import kha.FastFloat;

class FastRect2 {
    @:isVar public var x(get, set): FastFloat;
    @:isVar public var y(get, set): FastFloat;
    @:isVar public var w(get, set): FastFloat;
    @:isVar public var h(get, set): FastFloat;

    public var left(get, set): FastFloat;
    public var top(get, set): FastFloat;
    public var right(get, set): FastFloat;
    public var bottom(get, set): FastFloat;

    public inline function new( x: FastFloat = 0.0, y: FastFloat = 0.0, w: FastFloat = 0.0, h: FastFloat = 0.0 ) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    inline function get_x() return x;
    inline function get_y() return y;
    inline function get_w() return w;
    inline function get_h() return h;

    inline function get_left() return x;
    inline function get_top() return y;
    inline function get_right() return x + w;
    inline function get_bottom() return y + h;

    inline function set_x( value: FastFloat ) return x = value;
    inline function set_y( value: FastFloat ) return y = value;
    inline function set_w( value: FastFloat ) return w = value;
    inline function set_h( value: FastFloat ) return h = value;

    inline function set_left( value: FastFloat ) {
        w = value >= right ? 0 : right - value;
        return x = value;
    }

    inline function set_top( value: FastFloat ) {
        h = value >= bottom ? 0 : bottom - value;
        return y = value;
    }

    inline function set_right( value: FastFloat ) {
        return w = value <= x ? 0 : value - x;
    }

    inline function set_bottom( value: FastFloat ) {
        return h = value <= y ? 0 : value - y;
    }
}
