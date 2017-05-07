package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	public class TimerCounter extends Entity
	{
		public var counter:Number = 0;
		public var pause:Boolean = false;

		override public function update():void 
		{
			if (!pause) counter += FP.elapsed;
			super.update();
		}
		
		public function Reset():void
		{
			counter = 0;
		}
	}
}