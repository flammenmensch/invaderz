package invaders.entities.bonuses {
	import invaders.Assets;
	import invaders.objects.AbstractUnit;
	
	public class InvincibilityBonus extends AbstractBonus {
		
		private var __duration:Number;
		
		public function InvincibilityBonus(duration:Number) {
			super(Assets.Invincibility);
			
			this.__duration = duration;
		}
		
		override public function applyBonus(target:AbstractUnit):void {
			target.flicker(this.__duration);
		}
	}
}