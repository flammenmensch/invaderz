package invaders.factory {
	import invaderz.sounds.Cannon;
	import invaderz.sounds.GunShot;
	import invaderz.sounds.Laser;
	import invaderz.sounds.Missile;
	import invaderz.sounds.Sniper;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	public final class WeaponFactory {
		
		public static function createLaser(direction:int):FlxWeapon {
			var laser:FlxWeapon = new FlxWeapon("LASER", 15);
			
			laser.makePixelBullet(10, 2, 4, FlxG.GREEN);
			laser.setFireRate(1);
			laser.setBulletDirection(direction, 200);
			laser.setBulletBounds(FlxG.worldBounds);
			laser.onFireSound = new FlxSound();
			laser.onFireSound.loadEmbedded(Laser);
			
			return laser;
		}
		
		public static function createCannon(direction:int):FlxWeapon {
			var cannon:FlxWeapon = new FlxWeapon("CANNON", 30);
			
			cannon.makePixelBullet(10, 4, 4, FlxG.WHITE);
			cannon.setFireRate(750);
			cannon.setBulletDirection(direction, 100);
			cannon.setBulletBounds(FlxG.worldBounds);
			cannon.onFireSound = new FlxSound();
			cannon.onFireSound.loadEmbedded(Cannon);
			
			return cannon;
		}
		
		public static function createSniperRifle(direction:int):FlxWeapon {
			var rifle:FlxWeapon = new FlxWeapon("SNIPER RIFLE", 50);

			rifle.setFireRate(1000);
			rifle.makePixelBullet(10, 2, 8, FlxG.BLUE);
			rifle.setBulletDirection(direction, 500);
			rifle.setBulletBounds(FlxG.worldBounds);
			rifle.onFireSound = new FlxSound();
			rifle.onFireSound.loadEmbedded(Sniper);
			
			return rifle;
		}
		
		public static function createMissileLauncher(direction:int):FlxWeapon {
			var launcher:FlxWeapon = new FlxWeapon("MISSILE LAUNCHER", 75);
			
			launcher.setFireRate(1000);
			launcher.makePixelBullet(10, 2, 8, FlxG.WHITE);
			launcher.setBulletDirection(direction, 100);
			launcher.setBulletAcceleration(0, 20, 0, direction === FlxWeapon.BULLET_UP ? -150 : 150);
			launcher.setBulletBounds(FlxG.worldBounds);
			launcher.onFireSound = new FlxSound();
			launcher.onFireSound.loadEmbedded(Missile);
			
			return launcher;
		}
		
		public static function createMachineGun(direction:int):FlxWeapon {
			var machineGun:FlxWeapon = new FlxWeapon("MACHINE GUN", 10);
			
			machineGun.makePixelBullet(50, 2, 2, FlxG.WHITE);
			machineGun.setBulletDirection(direction, 400);
			machineGun.setFireRate(.25);
			machineGun.setBulletBounds(FlxG.worldBounds);
			machineGun.setBulletRandomFactor(50);
			machineGun.onFireSound = new FlxSound();
			machineGun.onFireSound.loadEmbedded(GunShot);
			
			return machineGun;
		}
		
	}
}