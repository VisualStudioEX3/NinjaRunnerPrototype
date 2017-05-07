package entities.patternMachine.patterns 
{
	import entities.patternMachine.*;
	import entities.*;
	import net.flashpunk.FP;
	
	public class n1 extends PatternBase
	{
		private var _flag:uint;
		
		public function n1(flag:uint = 0)
		{
			super(8, 0.08);
			_flag = flag;
		}
		
		override public function AddEntity():void 
		{
				switch (_flag)
				{
					case 0: 
						if (this.Times == this.Repetitions) this.world.add(new Ninja(false)); 
						FP.world.add(new Coin(200 , -60, 0));
						break;
					case 1: 
						if (this.Times == this.Repetitions) this.world.add(new Ninja(true)); 
						FP.world.add(new Coin((200 + (34 * 6)) , -60, 0));
						break;
					default:
						if (this.Times == this.Repetitions)	
						{
							this.world.add(new Ninja(false));
							this.world.add(new Ninja(true));
						}
						FP.world.add(new Coin(200 , -60, 0));
						FP.world.add(new Coin((200 + (34 * 6)) , -60, 0));
						break;
				}
				
			super.AddEntity();
		}
		
		override public function removed():void 
		{
			NextPattern(5);
			
			super.removed();
		}
	}
}