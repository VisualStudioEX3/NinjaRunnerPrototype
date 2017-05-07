package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class t1 extends PatternBase
	{
		private var _flag:uint;
		
		public function t1(flag:uint = 0) 
		{
			super(8, 0.08);
			_flag = flag;
		}
		
		override public function AddEntity():void 
		{
			switch (_flag)
			{
				case 0: 
					if (this.Times == this.Repetitions) 
						this.world.add(new Temple(false)); 
					else
						FP.world.add(new Coin(200 , -60, 0));
					break;
				case 1: 
					if (this.Times == this.Repetitions) 
						this.world.add(new Temple(true)); 
					else
						FP.world.add(new Coin((200 + (34 * 6)) , -60, 0));
					break;
				default:
					if (this.Times == this.Repetitions) 
					{
						this.world.add(new Temple(false));
						this.world.add(new Temple(true));
					}
					else
					{
						FP.world.add(new Coin((200 + (FP.rand(2) == 0 ? (34 * 6) : 0)) , -60, 0));
					}
					break;
			}
				
			super.AddEntity();
		}
		
		override public function removed():void 
		{
			NextPattern(7);
			
			super.removed();
		}
	}
}