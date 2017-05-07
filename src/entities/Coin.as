package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.*;
	import states.Game;
	import net.flashpunk.FP;
	
	public class Coin extends Entity
	{
		private var sprite:Spritemap;
		private var points:uint;
		
		public function Coin(x:int, y:int, type:uint) 
		{
			super(x, y);

			switch (type)
			{
				case 0: sprite = new Spritemap(Assets.gfx_game_coin1, 68, 65); points = 1; break;
				case 1: sprite = new Spritemap(Assets.gfx_game_coin2, 68, 65); points = 2; break;
				case 2: sprite = new Spritemap(Assets.gfx_game_coin5, 68, 65); points = 5; break;				
			}
			
			sprite.add("default", Helper.SetArray(0, 39), 0.4, true);
			sprite.play("default");
			sprite.scale = 0.5;
			graphic = sprite;
			
			setHitbox(68 / 2, 65 / 2);
			this.type = "coin";
			
			layer = 1;
		}
		
		override public function update():void 
		{
			 y += Game.speed * FP.elapsed;
			if (y > 480) FP.world.remove(this);
			super.update();
		}		
		
		public function destroy():void
		{
			Game.score += points;
			FP.world.remove(this);
		}
		
		override public function removed():void 
		{
			sprite.clear();
			super.removed();
		}
	}
}