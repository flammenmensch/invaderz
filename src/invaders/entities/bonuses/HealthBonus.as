package invaders.entities.bonuses {
	import invaders.Assets;
	import invaders.objects.AbstractUnit;
	
	public final class HealthBonus extends AbstractBonus {
		
		private var __value:Number;
		
		public function HealthBonus(value:Number) {
			super(Assets.Health);
			
			this.__value = value;
		}
		
		override public function applyBonus(target:AbstractUnit):void {
			target.health += this.__value;
			
			if (target.health > 100) {
				target.health = 100;
			}
		}
	}
}