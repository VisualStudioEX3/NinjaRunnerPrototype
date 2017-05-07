package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class z1 extends PatternBase
	{
		private var _flag:uint;
		
		public function z1(flag:uint = 0)
		{
			super(10, 0.08);
			_flag = flag;
		}
		
		override public function AddEntity():void 
		{
			FP.world.add(new Coin((200 + (_flag == 0 ? (34 * 6) : 0)) , -60, 0));
			
			switch (_flag)
			{
				case 0:
					if (Times == 1) this.world.add(new Temple(_flag == 0 ? false : true));
					if (Times == Repetitions) this.world.add(new Ninja(_flag == 0 ? true : false));
					break;
				case 1:
					if (Times == 1) this.world.add(new Temple(_flag == 1 ? false : true));
					if (Times == Repetitions) this.world.add(new Ninja(_flag == 0 ? true : false));
					break;
				case 2:
					if (Times == 1) this.world.add(new Ninja(_flag == 0 ? false : true));
					if (Times == Repetitions) this.world.add(new Temple(_flag == 0 ? true : false));
					break;
				case 3:
					if (Times == 1) this.world.add(new Ninja(_flag == 1 ? false : true));
					if (Times == Repetitions) this.world.add(new Temple(_flag == 0 ? true : false));
					break;
			}
				
			super.AddEntity();
		}
		
		override public function removed():void 
		{
			NextPattern(9);
			
			super.removed();
		}
	}
}