package invaders.factory {
	import invaders.data.AlienType;
	import invaders.entities.enemies.HeavySoldier;
	import invaders.entities.enemies.Kamikaze;
	import invaders.entities.enemies.LightSoldier;
	import invaders.entities.enemies.SantaClaus;
	import invaders.entities.enemies.Sniper;
	import invaders.objects.Alien;
	
	import org.flixel.FlxPoint;
	
	public final class AlienFactory {
		
		public static function createAlien(type:uint, origin:FlxPoint=null):Alien {
			var alien:Alien;
			
			switch (type) {
				case AlienType.SNIPER:
					alien = new Sniper();
					break;
				case AlienType.HEAVY_SOLDIER:
					alien = new HeavySoldier();
					break;
				case AlienType.KAMIKAZE:
					alien = new Kamikaze();
					break;
				case AlienType.SANTA_CLAUS:
					alien = new SantaClaus();
					break;
				case AlienType.LIGHT_SOLDIER:
				default:
					alien = new LightSoldier();
					break;
			}
			
			alien.setStartPosition(origin);
			
			return alien;
		}
	}
}