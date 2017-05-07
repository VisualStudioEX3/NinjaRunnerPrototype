package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class p5 extends PatternBase
	{
		private var _type1:uint;
		private var _type2:uint;
		
		public function p5(type1:uint = 0, type2:uint = 0)
		{
			super(8, 0.08);
			_type1 = type1;
			_type2 = type2;
		}
		
		override public function AddEntity():void 
		{
			FP.world.add(new Coin(200 , -60, _type1));
			FP.world.add(new Coin((200 + (34 * 6)) , -60, _type2));
				
			super.AddEntity();
		}
		
		override public function removed():void 
		{
			FP.world.add(new Coin(200 , -60, _type1));
			FP.world.add(new Coin((200 + (34 * 6)) , -60, _type2));
			
			NextPattern(4);
			super.removed();
		}
	}
}