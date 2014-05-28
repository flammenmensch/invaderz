package invaders.factory {
	import invaders.objects.AbstractUnit;
	import invaders.objects.Player;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxControlHandler;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	public final class PlayerFactory {
		
		[Embed(source="/../assets/player.png")]
		private static const IMAGE:Class;
		
		public static function createPlayer():AbstractUnit {
			var player:Player = new Player();
			player.health = 100;
			player.velocity = new FlxPoint();
			
			player.loadGraphic(IMAGE, false, false, 16, 16);
			
			var handler:FlxControlHandler = new FlxControlHandler(player, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_INSTANT, false, true);
			handler.setFireButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 150, player.fire);
			handler.setMovementSpeed(200, 0, 200, 0);
			handler.setCursorControl(false, false, true, true);
			handler.setBounds(10, FlxG.height - 60, FlxG.width - player.width - 20, 60);
			
			player.setShield(50);
			//player.setWeapon(WeaponFactory.createCannon(player, FlxWeapon.BULLET_UP));//createLaser(player, FlxWeapon.BULLET_UP));
			//player.setWeapon(WeaponFactory.createLaser(FlxWeapon.BULLET_UP));
			player.setWeapon(WeaponFactory.createMachineGun(FlxWeapon.BULLET_UP));
			player.setHandler(handler);
				
			return player;
		}
	}
}