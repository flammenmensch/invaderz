package invaders.entities.enemies
{
	import invaders.Assets;
	import invaders.factory.WeaponFactory;
	import invaders.objects.Alien;
	
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	public final class HeavySoldier extends Alien {
		
		public function HeavySoldier() {
			super(Assets.HeavySoldier);
			
			this.color = FlxG.RED;
			this.health = 50;
			
			this.velocity.x = 5;
			this.velocity.y = 2;
			
			this.setScore(200);
			this.setWeapon(WeaponFactory.createCannon(FlxWeapon.BULLET_DOWN));
		}
		
		override protected function updatePosition():void {
			if (this.x < this._startPosition.x - 8) {
				this.x = this._startPosition.x - 8;
				this.velocity.x = -this.velocity.x;
			}
			
			if (this.x > this._startPosition.x + 8) {
				this.x = this._startPosition.x + 8;
				this.velocity.x = -this.velocity.x;
			}
		}
	}
}