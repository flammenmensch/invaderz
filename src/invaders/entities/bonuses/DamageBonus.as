package invaders.entities.bonuses {
	import invaders.Assets;
	import invaders.objects.AbstractUnit;
	
	import org.flixel.FlxG;

	public class DamageBonus extends AbstractBonus {
		
		private var __damage:Number;
		
		public function DamageBonus(damage:Number) {
			super(Assets.Damage);
			
			this.__damage = damage;
		}
		
		override public function applyBonus(target:AbstractUnit):void {
			target.hurt(this.__damage);
			target.flicker(1);
			
			FlxG.shake(.005, .25);
		}
	}
}