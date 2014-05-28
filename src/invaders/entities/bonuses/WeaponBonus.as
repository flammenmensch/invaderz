package invaders.entities.bonuses {
	import invaders.Assets;
	import invaders.objects.AbstractUnit;
	
	import org.flixel.plugin.photonstorm.FlxWeapon;

	public final class WeaponBonus extends AbstractBonus {
		
		private var __weapon:FlxWeapon;
		
		public function WeaponBonus(weapon:FlxWeapon) {
			super(Assets.Weapon);
			this.__weapon = weapon; 
		}
		
		override public function applyBonus(target:AbstractUnit):void {
			target.setWeapon(this.__weapon);
		}
	}
}