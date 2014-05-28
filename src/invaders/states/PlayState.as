package invaders.states {
	import invaders.entities.bonuses.AbstractBonus;
	import invaders.factory.ExplosionFactory;
	import invaders.factory.PlayerFactory;
	import invaders.objects.AbstractUnit;
	import invaders.objects.Alien;
	import invaders.objects.AlienGroup;
	import invaders.objects.Hud;
	import invaders.objects.Player;
	import invaders.objects.Starfield;
	
	import invaderz.sounds.Explosion1;
	import invaderz.sounds.Explosion2;
	import invaderz.sounds.Explosion3;
	import invaderz.sounds.Explosion4;
	import invaderz.sounds.HurtAlien;
	import invaderz.sounds.HurtPlayer;
	import invaderz.sounds.Pickup1;
	import invaderz.sounds.Pickup2;
	import invaderz.sounds.Pickup3;
	
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.BaseTypes.Bullet;
	
	public final class PlayState extends FlxState {
		
		private var __starfield:FlxGroup;
		
		private var __hud:Hud;
		
		private var __aliens:AlienGroup;
		
		private var __explosions:FlxGroup;
		
		private var __bonuses:FlxGroup;

		private var __player:AbstractUnit;
		
		private static const EXPLOSION_SOUNDS:Array = [ Explosion1, Explosion2, Explosion3, Explosion4 ];
		private static const PICKUP_SOUNDS:Array = [ Pickup1, Pickup2, Pickup3 ];
		
		public function PlayState() {
			super();
		}
		
		override public function create():void {
			super.create();
			
			this.__starfield = new Starfield();
			
			this.__player = PlayerFactory.createPlayer();
			
			this.__hud = new Hud();
			
			this.__aliens = new AlienGroup(this.__player);
			
			this.__explosions = new FlxGroup();
			
			this.__bonuses = new FlxGroup();
			
			this.add(this.__starfield);
			
			this.add(this.__player.bullets);
			this.add(this.__player);
			
			this.add(this.__aliens.alienBullets);
			this.add(this.__aliens);
			
			this.add(this.__explosions);
			
			this.add(this.__bonuses);
			
			this.add(this.__hud);
		}
		
		override public function update():void {
			FlxG.overlap(this.__player.bullets, this.__aliens, this.playerShootsAlienCallback);
			FlxG.overlap(this.__aliens.alienBullets, this.__player, this.alienShootsPlayerCallback);
			FlxG.overlap(this.__player, this.__aliens, this.playerHitsAlienCallback);
			FlxG.overlap(this.__player, this.__bonuses, this.playerHitsBonusCallback);
			
			this.__hud.updateHealth(this.__player.health);
			this.__hud.updateWeapon(this.__player.weapon.name);
			this.__hud.updateShield(this.__player.shield);
			this.__hud.updateScore(FlxG.score);
			
			if (!this.__player.alive) {
				FlxG.fade(0x00000000, 3, function ():void {
					FlxG.switchState(new GameOverState("YOU LOSE", FlxG.score));
					FlxG.score = 0;
				});
			}
			
			if (this.__aliens.getFirstExtant() === null) {
				FlxG.fade(0x00000000, 3, function ():void {
					FlxG.switchState(new GameOverState("YOU WIN", FlxG.score));
				});
				
			}
			
			super.update();
		}

		/*override public function destroy():void {
			this.__starfield.destroy();
			this.__aliens.destroy();
			this.__player.destroy();
			this.__hud.destroy();
			
			super.destroy();
		}*/
		
		private function playerShootsAlienCallback(bullet:Bullet, alien:Alien):void {
			if (!alien.flickering) {
				alien.flicker(1);
				
				FlxG.play(HurtAlien);
				
				alien.hurt(bullet.sourceWeapon.damage);

				bullet.hurt(.65);
				
				if (bullet.health <= 0) {
					bullet.kill();
				}
				
				if (alien.health <= 0) {
					alien.kill();
					
					if (alien.bonus !== null) {
						var bonus:AbstractBonus = alien.bonus;
						bonus.x = alien.x;
						bonus.y = alien.y;
						
						this.__bonuses.add(bonus);
					}
					
					FlxG.score += alien.score;
					
					this.explode(alien);
				}
			}
		}
		
		private function alienShootsPlayerCallback(bullet:Bullet, player:Player):void {
			if (!player.flickering) {
				bullet.kill();
				
				player.hurt(bullet.sourceWeapon.damage);
			
				if (player.health <= 0) {
					player.kill();
					this.explode(player);
				} else {
					player.flicker();
				}
				
				FlxG.play(HurtPlayer);
				
				FlxG.shake(.005, .25);
			}
		}
		
		private function playerHitsAlienCallback(player:Player, alien:Alien):void {
			if (!player.flickering) {
				
				player.flicker(1);
				
				player.hurt(alien.health);
			
				alien.kill();
				
				FlxG.score += alien.score;
				
				this.explode(alien);
				
				if (player.health <= 0) {
					player.kill();
					this.explode(player);
				} else {
					player.flicker();
				}
			}
		}
		
		private function playerHitsBonusCallback(player:Player, bonus:AbstractBonus):void {
			bonus.applyBonus(player);
			bonus.kill();
			
			FlxG.play(FlxG.getRandom(PICKUP_SOUNDS) as Class);
		}
		
		private function explode(target:FlxObject):void {
			var explosion:FlxEmitter = this.__explosions.getFirstAvailable(FlxEmitter) as FlxEmitter;
			
			if (explosion === null) {
				explosion = this.__explosions.add(ExplosionFactory.createExplosion()) as FlxEmitter;
			}
			
			explosion.at(target);
			explosion.start();
			
			FlxG.play(FlxG.getRandom(EXPLOSION_SOUNDS) as Class);
		}
	}
}