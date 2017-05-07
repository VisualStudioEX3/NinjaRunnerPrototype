package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.display.BitmapData;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import states.Game;
	
	import net.flashpunk.FP;
	
	public class Player extends Entity
	{
		private var side:int = 1;
		private var isJumping:Boolean = false;
		private var img:Image;
		
		private const size:uint = 42;
		private var halfSize:uint;
		
		private var sprite:Spritemap;
		
		public static var speed:Number = 0.4;
		
		private var isDead:Boolean = false;
		
		private var timer:TimerCounter;
		
		public function Player() 
		{
			halfSize = size / 2;
			
			super(180 + halfSize, 480 - halfSize);
			
			sprite = new Spritemap(Assets.gfx_game_player, 60, 60);
			sprite.add("run", [0, 1, 2, 3, 4, 5, 6, 7], speed, true);
			sprite.add("jump", [8], 40, false);
			sprite.add("stand", [9], 40, false);
			sprite.add("dead", [10, 11, 12, 13], 0.1, true);
			sprite.smooth = true;
			sprite.scaleX = (size / 60) * -1;
			sprite.scaleY = size / 60;
			sprite.angle = -90;
			sprite.centerOO();
			sprite.play("run");
			
			graphic = sprite;
			
			this.centerOrigin();
			setHitbox(size / 2, size / 2, sprite.x + (size / 2) / 2, sprite.y + (size / 2) / 2);
			type = "player";
			
			Input.define("jump", Key.SPACE);
			
			timer = new TimerCounter();
			
			Game.playerIsDead = false;
			
			layer = 1;
		}
		
		override public function update():void 
		{	
			collisionHandler();
			
			if (!isDead) 
			{
				if (y == 480 - 32 && (Input.mousePressed || Input.pressed("jump"))) 				
				{
					sprite.play("jump");
					isJumping = true;
				}
					
				if (isJumping)
				{
					x += ((700 + (Game.speed / 2)) * FP.elapsed) * side;
					y -= 300 * FP.elapsed;
					sprite.angle -= 24 * side;
					
					if (side == 1 && x > 460 - halfSize)
					{
						sprite.play("stand");
						sprite.scaleX *= -1;
						sprite.angle = 90;
						x = 460 - halfSize;
						side = -1;
						isJumping = false;
					}
					else if (side == -1 && x < 180 + halfSize)
					{
						sprite.play("stand");
						sprite.scaleX *= -1;
						sprite.angle = -90;
						x = 180 + halfSize;
						side = 1;
						isJumping = false;
					}
				}
				
				if (!isJumping && y < 480 - 32) y += Game.speed * FP.elapsed + 5;
				if (y >= 480 - 32)
				{
					y = 480 - 32;			
					sprite.play("run");
				}
			}
			else
			{
				sprite.angle += 20;
				if (isJumping)
					if (side == 1)
					{
						x += 5;
						if (x > 440)
							side = -1;
					}
					else
					{
						x -= 5;
						if (x < 180)
							side = 1;
					}
				y += 3;
			}
			
			timer.update();
			super.update();
		}
		
		
		private function collisionHandler():void
		{
			if (!isDead) 
			{
				var coin:Coin = collide("coin", x, y) as Coin;			
				if (coin) coin.destroy();
			
                var enemy:Entity = collideTypes(["temple", "ninja", "shuriken", "rock"], x, y);
				
				if (enemy != null) 
				{
					if (Helper.StringExistsIn(enemy.type, ["temple", "ninja", "shuriken", "rock"]))
						KillPlayer();
						
					if (enemy.type == "temple") 
					{
						var temple:Temple = enemy as Temple;
						temple.Disturb();
					}
						
					if (enemy.type == "shuriken")
					{
						var shuriken:Shuriken = enemy as Shuriken;
						FP.world.remove(shuriken);
					}
				}
			}
			else
			{
				if (timer.counter > 0.1) 
				{
					timer.Reset();
					timer.pause = true;
					FP.screen.x = 0;
					FP.screen.y = 0;
				}
			}
		}
		
		private function KillPlayer():void
		{
			isDead = true;
			timer.Reset();
			FP.screen.x -= 3;
			FP.screen.y -= 5;
			sprite.play("dead");
			Game.speed = 0;
			Game.playerIsDead = true;
		}
	}
}