package invaders.entities.enemies {
	import invaders.Assets;
	import invaders.factory.WeaponFactory;
	import invaders.objects.Alien;
	
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	public final class Sniper extends Alien {
		
		public function Sniper() {
			super(Assets.Sniper);
			
			this.color = 0x333333;
			this.health = 25;
			
			this.velocity.x = 3;
			this.velocity.y = 1;
			
			this.setScore(200);
			this.setWeapon(WeaponFactory.createSniperRifle(FlxWeapon.BULLET_DOWN));
		}
	}
}