package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class p6 extends PatternBase
	{
		private var _type1:uint;
		private var _type2:uint;
		
		public function p6(type1:uint = 0, type2:uint = 0)
		{
			super(7, 0.043);
			_type1 = type1;
			_type2 = type2;
		}
		
		override public function AddEntity():void 
		{
			FP.world.add(new Coin(200 + (34 * (Times - 1)), -90, _type1));
			FP.world.add(new Coin((200 + (34 * 6)) - (34 * (Times - 1)), -90, _type2));
				
			super.AddEntity();
		}
		
		override public function removed():void 
		{
			NextPattern(5);
			super.removed();
		}
	}
}