function Vector2(_x, _y) constructor
{
    x = _x;
    y = _y;
	
	static Set = function(_x, _y)
	{
		x = _x;
		y = _y;
	};
	
	static SetVector = function(_vec)
	{
		x = _vec.x;
		y = _vec.y;
	};
	
    static Add = function(_other)
    {
        x += _other.x;
        y += _other.y;
    };
	
	static Sub = function(_other)
	{
		x -= _other.x;
		y -= _other.y;
	};
	
	static Scale = function(_scale)
	{
		x *= _scale;
		y *= _scale;
	};
	
	static Magnitude = function()
	{
		return sqrt(sqr(x) + sqr(y));
	};
	
	static MagnitudeSqr = function()
	{
		return sqr(x) + sqr(y);
	};
	
	static Normalized = function()
	{
		var len = self.Magnitude();
		if(len != 0)
		{
			return new Vector2(x / len, y /len);
		}
		
		return self;
	};
	
	static Normalise = function()
	{
		var len = self.Magnitude();
		if(len != 0)
		{
			x /= len;
			y /= len;
		}
	};
	
	static Distance = function(_other)
	{
		return sqrt(sqr(x - _other.x) + sqr(y - _other.y));
	};
	
	static DistanceSqr = function(_other)
	{
		return sqr(x - _other.x) + sqr(y - _other.y);
	};
	
	static Angle = function(_other)
	{
		var _dot = self.Dot(_other);
		var _mag = self.Magnitude() * _other.Magnitude();
		return acos(_dot / _mag);
	};
	
	static Dot = function(_other)
	{
		return (x * _other.x) + (y * _other.y);
	};
	
	static Perpendicular = function()
	{
		return new Vector2(y, -x);
	};
	
	static Reflect = function(_normal)
	{
		//r = d − 2*(d*n) * n
		return self.Sub(_normal.Scale(self.Dot(_normal) * 2));
	};
	
	static ToString = function()
	{
		return string(x) + ", " + string(y);
	};
}