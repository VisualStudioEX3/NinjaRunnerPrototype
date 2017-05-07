package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import states.Game;
	
	public class Ninja extends Entity
	{
		private var _ninja:Spritemap;
		private const size:uint = 42;
		private var halfsize:uint;
		private var _flipped:Boolean;
		private var hasShooted:Boolean = false;
		private var speed:int;
		
		public function Ninja(flipped:Boolean) 
		{
			halfsize = size / 2;
			_flipped = flipped;
			
			super(!flipped ? 177 + halfsize : 463 - halfsize, -60);
			
			_ninja = new Spritemap(Assets.gfx_game_ninja, 60, 60);
			_ninja.add("idle", [0], 0.1, true);
			_ninja.add("shoot", Helper.SetArray(0, 8), 0.4, false);
			_ninja.add("dead", Helper.SetArray(8, 12), 0.4, true);
			_ninja.smooth = true;
			_ninja.scaleX = (size / 60);
			_ninja.scaleY = size / 60;
			_ninja.centerOO();
			
			graphic = _ninja;
			if (flipped) _ninja.scaleX = (size / 60) * -1;
			
			_ninja.play("idle");
			
			this.centerOrigin();			
			setHitbox(size / 2, size / 2, _ninja.x + (size / 2) / 2, _ninja.y + (size / 2) / 2);
			type = "ninja";
			
			speed = Game.speed;
			
			layer = 1;
		}
		
		override public function update():void 
		{
			if (!hasShooted)
			{
				hasShooted = true;
				_ninja.play("shoot");
				FP.world.add(new Shuriken(x, y, !_flipped ? 0 : 1));
			}
			
			if (y > 180) 
				if (!_flipped) x += 3; else x -= 3;
				
			y += this.speed * FP.elapsed;
			if (y > 480) FP.world.remove(this);
			super.update();
		}
	}
}