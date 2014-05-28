package invaders.entities.enemies {
	import invaders.Assets;
	import invaders.factory.WeaponFactory;
	import invaders.objects.Alien;
	
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	public final class SantaClaus extends Alien {
		
		public function SantaClaus() {
			super(Assets.SantaClaus);
			
			this.health = 50;
			
			this.velocity.x = 6;
			this.velocity.y = 2;
			
			this.setScore(1000);
			this.setWeapon(WeaponFactory.createLaser(FlxWeapon.BULLET_DOWN));
		}
	}
}