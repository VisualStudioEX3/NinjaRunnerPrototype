package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import states.Game;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Main extends Engine 
	{
		
		public function Main() 
		{
			super(640, 480, 60, true);			
			FP.world = new Game;
			
			FP.console.enable();
			FP.console.visible = false;
			FP.console.toggleKey = Key.ENTER;
		}
		
		override public function update():void 
		{
			if (Input.pressed(Key.R))
			{
				FP.world = new Game;
			}
			super.update();
		}
	}
	
}