package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class p4 extends PatternBase
	{
		private var _type:uint;
		
		public function p4(type:uint = 0)
		{
			super(7, 0.043);
			_type = type;
		}
		
		override public function AddEntity():void 
		{
			FP.world.add(new Coin((200 + (34 * 6)) - (34 * (Times - 1)), -90, _type));				
			super.AddEntity();
		}
		
		override public function removed():void 
		{		
			NextPattern(3);
			super.removed();
		}
	}
}