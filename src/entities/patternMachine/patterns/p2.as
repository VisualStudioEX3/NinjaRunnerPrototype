package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class p2 extends PatternBase
	{
		private var _type:uint;
		
		public function p2(type:uint = 0)
		{
			super(8, 0.08);
			_type = type;
		}
		
		override public function AddEntity():void 
		{
			FP.world.add(new Coin((200 + (34 * 6)) , -60, _type));
				
			super.AddEntity();
		}
		
		override public function removed():void 
		{
			FP.world.add(new Coin((200 + (34 * 6)) , -60, _type));

			NextPattern(1);
				
			super.removed();
		}
	}
}