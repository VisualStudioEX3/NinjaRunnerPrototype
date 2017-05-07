package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Image;
	
	public class Digit extends Entity
	{
		private var sprite:Spritemap;
		
		public function Digit(x:uint, y:uint) 
		{
			super(x, y);			
			sprite = new Spritemap(Assets.gfx_game_numbers, 30, 30);
			sprite.smooth = true;
			sprite.scale = 0.7;
			sprite.frame = 0;
			graphic = sprite;
		}
		
		public function get Value():uint
		{
			return sprite.frame;
		}
		
		public function set Value(value:uint):void
		{
 			sprite.frame = value;
		}
	}
}