package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class n2 extends PatternBase
	{
		private var _flag:uint;
		
		public function n2(flag:uint = 0)
		{
			super(12, 0.08);
			_flag = flag;
		}
		
		override public function AddEntity():void 
		{
			FP.world.add(new Coin((200 + (_flag == 0 ? (34 * 6) : 0)) , -60, 0));
			if (Times == 1) this.world.add(new Ninja(_flag == 0 ? false : true));
			if (Times == Repetitions) this.world.add(new Ninja(_flag == 0 ? true : false));
				
			super.AddEntity();
		}
		
		override public function removed():void 
		{
			NextPattern(6);
			
			super.removed();
		}
	}
}