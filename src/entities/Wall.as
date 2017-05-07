package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import states.Game;
	
	public class Wall extends Entity
	{
		private var img:Image;
		private var a:int;
		private var b:int;
		
		public function Wall(x:int, y:int, flipped:Boolean, flag:Boolean = false) 
		{
			img = new Image(Assets.gfx_game_wall);
			img.scaleX = flipped ? -1 : 1;
			if (flag) img.color = 0xff0000;
			super(x, y, img);

			layer = 1;
		}
		
		override public function update():void 
		{
			y += Game.speed * FP.elapsed; if (y > img.height) y = -img.height + (y - img.height);
			super.update();
		}
	}
}