package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import states.Game;
	
	public class Shuriken extends Entity
	{
		private var sprite:Image;
		private var timer:TimerCounter;
		private var _flag:int;
		
		public function Shuriken(x:int, y:int, flag:int) 
		{
			_flag = flag;
			sprite = new Image(Assets.gfx_game_shuriken);
			sprite.centerOrigin();
			timer = new TimerCounter();
			super(x, y, sprite);
			
			this.centerOrigin();			
			setHitbox(22, 22, sprite.x + 11, sprite.y + 11);
			type = "shuriken";
			
			layer = 1;
		}
		
		override public function update():void 
		{
			sprite.angle += 5;
			if (sprite.angle > 360) sprite.angle = 0;
			
			y += (Game.speed * FP.elapsed) + 3;
			
			if (_flag == 0)
				x+=5;
			else
				x-=5;
			
			super.update();
		}
	}
}