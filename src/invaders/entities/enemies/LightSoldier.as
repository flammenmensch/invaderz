package invaders.entities.enemies {
	import invaders.Assets;
	import invaders.factory.WeaponFactory;
	import invaders.objects.Alien;
	
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	public final class LightSoldier extends Alien {
		
		private var __canKamikaze:Boolean = Math.random() < .25;
		private var __kamikazeMode:Boolean = false;
		
		public function LightSoldier() {
			super(Assets.Soldier);
			
			this.color = 0xffffff;
			this.health = 20;
			this.velocity.x = 10;
			this.velocity.y = 2;
			
			this.setScore(100);
			this.setWeapon(WeaponFactory.createLaser(FlxWeapon.BULLET_DOWN));
		}
		
		override public function update():void {
			super.update();
			
			if (this.health <= 5 && Math.random() < .15 && this.__canKamikaze && !this.__kamikazeMode) {
				this.loadGraphic(Assets.Kamikaze, true, false, 16, 16);
				this.velocity.y = 90;
				
				this.__kamikazeMode = true;
			}
		}
		
		override protected function updatePosition():void {
			if (this.x < this._startPosition.x - 16) {
				this.x = this._startPosition.x - 16;
				this.velocity.x = -this.velocity.x;
			}
			
			if (this.x > this._startPosition.x + 16) {
				this.x = this._startPosition.x + 16;
				this.velocity.x = -this.velocity.x;
			}
		}
	}
}