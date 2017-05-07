package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class t2 extends PatternBase
	{
		private var _flag:uint;
		
		public function t2(flag:uint = 0)
		{
			super(10, 0.08);
			_flag = flag;
		}
		
		override public function AddEntity():void 
		{
			if (Times == 1) 
				this.world.add(new Temple(_flag == 0 ? false : true));
			else if (Times == Repetitions) 
				this.world.add(new Temple(_flag == 0 ? true : false));
			else
				FP.world.add(new Coin((200 + (_flag == 0 ? (34 * 6) : 0)) , -60, 0));
				
			super.AddEntity();
		}
		
		override public function removed():void 
		{
			NextPattern(8);
			
			super.removed();
		}
	}
}