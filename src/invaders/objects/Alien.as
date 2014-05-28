package invaders.objects {
	import invaders.entities.bonuses.AbstractBonus;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;

	public class Alien extends AbstractUnit {
		
		protected var _startPosition:FlxPoint;
		
		protected var _shotClock:Number;
		
		private var __score:Number;
		
		private var __target:FlxSprite;
		
		private var __bonus:AbstractBonus;
		
		public function Alien(graphic:Class) {
			super();
			
			this.loadGraphic(graphic, true, false, 16, 16);
			
			this.addAnimation("default", [0, 1, 0, 2], 6 + FlxG.random() * 4);
			
			this.play("default");
			
			this.resetShotClock();
		}
		
		public function get bonus():AbstractBonus {
			return this.__bonus;
		}
		
		public function get score():Number {
			return this.__score;
		}
		
		public function setStartPosition(value:FlxPoint):void {
			this._startPosition = value;
			
			this.x = value.x;
			this.y = value.y;
		}
		
		public function setBonus(value:AbstractBonus):void {
			this.__bonus = value;
		}
		
		public function setTarget(value:FlxSprite):void {
			this.__target = value;
		}
		
		public function setScore(value:Number):void {
			this.__score = value;
		}
		
		override public function update():void {
			super.update();
			
			this.updatePosition();
			
			if (this.y > FlxG.height * .45) {
				this._shotClock -= FlxG.elapsed;
			}
			
			if (this._shotClock < 1) {
				this.resetShotClock();
				
				if (this.weapon) {
					this.fire();
				}
			}
			
			if (this.y > FlxG.height) {
				this.kill();
			}
		}
		
		override public function fire():void {
			if (!this.__target) {
				super.fire();
			} else {
				this.weapon.fireAtTarget(this.__target);
			}
		}
		
		protected function updatePosition():void {
			if (this.x < this._startPosition.x - 8) {
				this.x = this._startPosition.x - 8;
				this.velocity.x = -this.velocity.x;
			}
			
			if (this.x > this._startPosition.x + 8) {
				this.x = this._startPosition.x + 8;
				this.velocity.x = -this.velocity.x;
			}
		}
		
		private function resetShotClock():void {
			this._shotClock = 1 + FlxG.random() * 5;
		}
	}
}