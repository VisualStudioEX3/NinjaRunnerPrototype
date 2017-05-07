package entities 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.*;
	import net.flashpunk.FP;
	import states.Game;
	
	public class Temple extends Entity
	{			
		private var _flipped:Boolean; 
		private var monk:Monk;
		
		public function Temple(flipped:Boolean)
		{
			super(!flipped ? 260 : 379, -148);
			_flipped = flipped;
		}
		
		override public function added():void 
		{
			var temple:Image = new Image(Assets.gfx_game_temple);
			if (!_flipped)
			{
				temple.scaleX = -1;
				monk = new Monk(208, -87);
			}
			else
			{
				monk = new Monk(395, -87);
			}
			FP.world.add(monk);
			
			graphic = temple;
			
			this.setHitbox(temple.width - 30, 20, temple.x + (!_flipped ? temple.width : -30), temple.y - 100);
			type = "temple";
			
			super.added();
			
			layer = 1;
		}
		
		override public function update():void 
		{
			y += Game.speed * FP.elapsed;
			if (y > 480) FP.world.remove(this);
			super.update();
		}
		
		public function Disturb():void
		{
			monk.decentralize();
		}
	}
}