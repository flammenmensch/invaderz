package invaders.objects {
	import invaders.data.AlienType;
	import invaders.factory.AlienFactory;
	import invaders.factory.BonusFactory;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public final class AlienGroup extends FlxGroup {
		
		private static const NUM_ALIENS:uint = 40;
		
		private static const COLORS:Vector.<uint> = Vector.<uint>([ FlxG.BLUE, (FlxG.BLUE | FlxG.GREEN), FlxG.GREEN, (FlxG.GREEN | FlxG.RED), FlxG.RED ]);
		
		private var __alienBullets:FlxGroup;
		
		private var __playerRef:FlxSprite;
		
		public function AlienGroup(playerRef:FlxSprite) {
			super(NUM_ALIENS);
			
			this.__playerRef = playerRef;
			
			this.__alienBullets = new FlxGroup();
			
			var alien:Alien;
			
			var enemyChance:Number;
			
			var position:FlxPoint;
			
			for (var i:uint = 0; i < NUM_ALIENS; i++) {
				enemyChance = FlxG.random();
				
				position = new FlxPoint(
					8 + (i % 10) * 32,
					24 + int(i / 10) * 32
				);
				
				if (enemyChance < .025) {
					alien = AlienFactory.createAlien(AlienType.SANTA_CLAUS, position);
				} else if (enemyChance < .1) {
					alien = AlienFactory.createAlien(AlienType.SNIPER, position);
				}/* else if (enemyChance < .2) {
					alien = AlienFactory.createAlien(AlienType.KAMIKAZE, position);
				}*/ else if (enemyChance < .35) {
					alien = AlienFactory.createAlien(AlienType.HEAVY_SOLDIER, position);
				} else {
					alien = AlienFactory.createAlien(AlienType.LIGHT_SOLDIER, position);
				}
				
				if (alien.weapon !== null) {
					this.__alienBullets.add(alien.bullets);
				}
				
				alien.setBonus(BonusFactory.createRandomBonus());
				
				this.add(alien);
			}
		}
		
		public function get alienBullets():FlxGroup {
			return this.__alienBullets;
		}
	}
}