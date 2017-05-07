package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import states.Game;
	
	public class Monk extends Entity
	{		
		private var monk:Spritemap;
		
		public function Monk(x:int, y:int) 
		{
			super(x, y);
			
			monk = new Spritemap(Assets.gfx_game_monk, 36, 47);
			monk.add("centrate", [0], 0.1);
			monk.add("decentrate", [1], 0.1);
			monk.play("centrate");
			
			graphic = monk;
			
			layer = 1;
		}
		
		override public function update():void 
		{
			y += Game.speed * FP.elapsed;
			super.update();
		}
		
		public function decentralize():void
		{
			monk.play("decentrate");
		}
	}

}