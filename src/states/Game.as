package states 
{
	import entities.Coin;
	import entities.Counter;
	import entities.Digit;
	import entities.Monk;
	import entities.patternMachine.patterns.*;
	import entities.Player;
	import entities.Temple;
	import entities.Wall;
	import flash.display.Graphics;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Game extends World
	{	
		public static const initialSpeed:uint = 500;
		
		public static var speed:uint;		// Velocidad de subida.
		public static var metters:Number;	// Metros recorridos.
		public static var score:uint;		// Puntuacion.
		
		public static var playerIsDead:Boolean;
		
		private var metterCounter:Counter;
		private var scoreCounter:Counter;
		private var timer:TimerCounter;	
		
		public function Game() 
		{
			super();
			
			speed = initialSpeed;
			metters = 0;
			score = 0;
			
			var bgimg:Image = new Image(Assets.gfx_game_background);
			var background:Entity = addGraphic(bgimg, 0, 180, 0);
			background.layer = 2;
			
			//addGraphic(new Image(Assets.gfx_game_background), 0, 180, 0);
			
			add(new Wall(201, 0, true));
			add(new Wall(201, -2343, true));
			add(new Wall(439, 1000, false));
			add(new Wall(439, -1343, false));
			add(new Player);
			
			// Patron semilla:
			add(new p1(FP.rand(2)));
		
			var img:Image = new Image(Assets.gfx_game_grain);
			img.alpha = 0.5;			
			var grain:Entity = addGraphic(img, 0, 160, 0);
			grain.layer = -1;
			
			addGraphic(new Image(Assets.gfx_game_board), 0, 0, 0);
			metterCounter = new Counter(490, 67);
			add(metterCounter);
			
			scoreCounter = new Counter(490, 127);
			add(scoreCounter);
			
			timer = new TimerCounter();
			
			FP.randomizeSeed();
		}
		
		override public function update():void 
		{
			if (Input.pressed(Key.DIGIT_8)) 
			{
				speed -= 25;
			}
			if (Input.pressed(Key.DIGIT_9))
			{
				speed+= 25;
			}
			
			metters += (FP.elapsed * Game.speed) / 100;
			metterCounter.Value = metters;
			
			scoreCounter.Value = score;
			
			if (Input.pressed(Key.F12)) FP.console.visible = !FP.console.visible;
			super.update();
			
			//ninja.y = 60;
		}
	}
}