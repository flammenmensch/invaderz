package invaders.entities.enemies {
	import invaders.Assets;
	import invaders.objects.Alien;
	
	import org.flixel.FlxG;
	
	public final class Kamikaze extends Alien {
		public function Kamikaze() {
			super(Assets.Kamikaze);
			
			this.health = 10;
			
			this.velocity.x = 15;
			this.velocity.y = 1;
			
			this.setScore(300);
			this.setWeapon(null);
		}
		
		override protected function updatePosition():void {
			if (this.x < this._startPosition.x - 15) {
				this.x = this._startPosition.x - 15;
				this.velocity.x = -this.velocity.x;
			}
			
			if (this.x > this._startPosition.x + 15) {
				this.x = this._startPosition.x + 15;
				this.velocity.x = -this.velocity.x;
			}
			
			if (this.y > FlxG.height * .3) {
				this.velocity.y = 70;
			}
		}
	}
}