package entities 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import states.Game;
	
	public class Rock extends Entity
	{
		private var rock:Image;
		private var speed:int;
		private var size:int;
		
		public function Rock()
		{
			rock = new Image(Assets.gfx_game_rock);
			
			var x:uint;
			
			switch(FP.rand(3))
			{
				case 0: x = 240; break; 
				case 1: x = 400; break;
				default: x = 320; break;
			}
			
			super(x, -60, rock);
			
			rock.centerOO();
			size = 60;
			
			this.centerOrigin();			
			setHitbox(size, size, rock.x + (size / 2) / 2, rock.y + (size / 2) / 2);
			type = "rock";
			
			speed = Game.speed;
			
			layer = 1;
		}
		
		override public function update():void 
		{
			rock.angle += 5;
			y += this.speed * FP.elapsed;
			if (y > 480) FP.world.remove(this);
			
			super.update();
		}
	}
}