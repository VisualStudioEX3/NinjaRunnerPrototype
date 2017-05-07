package entities.patternMachine 
{
	import entities.patternMachine.patterns.*;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import states.Game;
	
	public class PatternBase extends Entity
	{
		public var Repetitions:uint;		
		public var Interval:Number;
		
		private var timer:TimerCounter;
		private var times:uint = 0;
		
		public function get Times():uint
		{
			return times;
		}
		
		public function PatternBase(repetitions:uint, interval:Number)
		{
			super();
			timer = new TimerCounter();
			Repetitions = repetitions;
			Interval = interval;			
		}
		
		override public function update():void 
		{
			if (timer.counter >= Interval && Game.speed > 0)
			{
				timer.Reset();
				times++; 
				if (times > Repetitions) 
					this.world.remove(this);
				else
					AddEntity();				
			}
			timer.update();
			super.update();
		}
		
		public function AddEntity():void
		{
			
		}
		
		public function NextPattern(discard:int = -1):void
		{
			const patterns:uint = 11;
			var next:int = FP.rand(patterns);
			
			while (next == discard)
			{
				next = FP.rand(patterns);
			}
			
			switch (next)
			{
				case 0: default: FP.world.add(new p1(FP.rand(3))); break;
				case 1: FP.world.add(new p2(FP.rand(3))); break;
				case 2: FP.world.add(new p3(FP.rand(3))); break;
				case 3: FP.world.add(new p5(FP.rand(3), FP.rand(3))); break;
				case 4: FP.world.add(new p6(FP.rand(3), FP.rand(3))); break;
				
				case 5: FP.world.add(new n1(FP.rand(3))); break;
				case 6: FP.world.add(new n2(FP.rand(2))); break;
				
				case 7: FP.world.add(new t1(FP.rand(3))); break;
				case 8: FP.world.add(new t2(FP.rand(2))); break;
				
				case 9: FP.world.add(new z1(FP.rand(4))); break;
				
				case 10: FP.world.add(new r1()); break;
			}
		}
	}
}