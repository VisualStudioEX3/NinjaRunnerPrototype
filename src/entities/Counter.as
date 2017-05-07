package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Counter extends Entity
	{
		private var list:Array;
		private var _value:uint;
		
		public function Counter(x:uint, y:uint) 
		{
			super(x, y);			
		}
		
		override public function added():void 
		{
			var i:uint;
			var d:Digit;
			list = new Array();
			for (i = 0; i < 9; i++)
			{
				d = new Digit(x + (15 * i), y);
				FP.world.add(d);
				list.push(d);
			}
			Value = 0;
			super.added();
		}
		
		override public function removed():void 
		{
			var i:uint;
			for (i = 0; i < list.length; i++)
				FP.world.remove((Entity)(list[i]));
			super.removed();
		}
		
		public function get Value():uint
		{
			return _value;
		}
		
		public function set Value(value:uint):void
		{
			_value = value;
			
			var i:Digit;
			var str:String = value.toString();
			var d:int;
			var c:int = str.length - 1;
			for (d = 8; d > -1; d--)
			{
				i = (Digit)(list[d]);
				i.Value = (uint)(str.charAt(c));
				
				if (d < 8 && i.Value == 0)
				{
					if (c > 0)
						i.visible = true;
					else
						i.visible = false; 
				}
				else 
				{
					i.visible = true;
				}
				c--;
			}
		}
	}
}