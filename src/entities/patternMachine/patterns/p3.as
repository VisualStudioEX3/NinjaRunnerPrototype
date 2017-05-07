package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class p3 extends PatternBase
	{
		private var _type:uint;
		
		public function p3(type:uint = 0)
		{
			super(7, 0.043);
			_type = type;
		}
		
		override public function AddEntity():void 
		{
			FP.world.add(new Coin(200 + (34 * (Times - 1)), -90, _type));
				
			super.AddEntity();
		}
		
		override public function removed():void 
		{			
			NextPattern(2);
			super.removed();
		}
	}
}