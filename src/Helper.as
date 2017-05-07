package  
{
	import flash.geom.Rectangle;
	import flash.utils.*;
	
	public class Helper 
	{		
		public static function SetArray(from:uint, to:uint):Array 
		{
			var f:Array = new Array(); var i:uint; 
			for (i = from; i < to; i++) f.push(i);
			return f;
		}
			
		public static function NumberExistIn(value:Number, list:Array):Boolean
		{
			var i:uint;
			for (i = 0; i < list.length; i++)
				if (value == list[i]) return true;
			return false;
		}
		
		public static function StringExistsIn(value:String, list:Array):Boolean
		{
			var i:uint;
			for (i = 0; i < list.length; i++)
				if (value == list[i]) return true;
			return false;
		}
	}
}