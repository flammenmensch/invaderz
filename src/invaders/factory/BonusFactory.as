package invaders.factory {
	import invaders.entities.bonuses.AbstractBonus;
	import invaders.entities.bonuses.DamageBonus;
	import invaders.entities.bonuses.HealthBonus;
	import invaders.entities.bonuses.InvincibilityBonus;
	import invaders.entities.bonuses.ScoreBonus;
	import invaders.entities.bonuses.WeaponBonus;
	
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	public final class BonusFactory {
		
		public static function createHealthBonus(health:Number):AbstractBonus {
			return new HealthBonus(health);
		}
		
		public static function createInvincibilityBonus(duration:Number):AbstractBonus {
			return new InvincibilityBonus(duration);
		}
		
		public static function createWeaponBonus(weapon:FlxWeapon):AbstractBonus {
			return null;
		}
		
		public static function createRandomBonus():AbstractBonus {
			var bonusChance:Number = FlxG.random();
			
			if (bonusChance < .05) {
				return new InvincibilityBonus(10);
			}
			
			if (bonusChance < .145) {
				var weaponChance:Number = FlxG.random();
				var direction:int = FlxWeapon.BULLET_UP; 
				var weapon:FlxWeapon;
				
				if (weaponChance < 0.33) {
					weapon = WeaponFactory.createSniperRifle(direction);
				} else if (weaponChance < 0.44) {
					weapon = WeaponFactory.createMissileLauncher(direction);
				} else if (weaponChance < 0.66) {
					weapon = WeaponFactory.createCannon(direction);
				} else {
					weapon = WeaponFactory.createLaser(direction);
				}
				
				return new WeaponBonus(weapon);
			}
			
			if (bonusChance < .165) {
				return new DamageBonus(Math.floor(Math.random() * 25));
			}
			
			if (bonusChance < .275) {
				return new ScoreBonus(Math.random() > .75 ? 500 : 100);
			}
			
			if (bonusChance < .29) {
				return new HealthBonus(50);
			}
			
			return null;
		}
		
		public static function createHurtBonus(damage:Number):AbstractBonus {
			return null;
		}
		
	}
}