package invaders.entities.bonuses {
	
	import invaders.objects.AbstractUnit;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class AbstractBonus extends FlxSprite {
		
		public function AbstractBonus(graphic:Class) {
			super(0, 0, graphic);
			
			this.width	= 8;
			this.height	= 8;
			
			this.velocity.x = 0;
			this.velocity.y = 30;
		}
		
		public function applyBonus(target:AbstractUnit):void {
			// TODO: Implement method
		}
		
		override public function update():void {
			super.update();
			
			if (this.y >= FlxG.height) {
				this.kill();
			}
		}
	}
}