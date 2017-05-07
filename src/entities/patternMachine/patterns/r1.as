package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class r1 extends PatternBase
	{
		public function r1() 
		{
			super(8, 0.08);
		}
		
		override public function AddEntity():void 
		{
			if (Times == this.Repetitions) FP.world.add(new Rock());
			
			super.AddEntity();
		}
		
		override public function removed():void 
		{
			NextPattern(10);
			super.removed();
		}
	}
}