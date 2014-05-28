package invaders.objects {
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	public class AbstractUnit extends FlxSprite {
		
		private var __weapon:FlxWeapon;
		
		private var __shield:Number;
		
		private var __bullets:FlxGroup = new FlxGroup(1);
		
		public function AbstractUnit() {
			super();
		}
		
		public function get weapon():FlxWeapon {
			return this.__weapon;
		}
		
		public function get shield():Number {
			return this.__shield;
		}
		
		public function get bullets():FlxGroup {
			return this.__bullets;
		}
		
		public function setWeapon(value:FlxWeapon):void {
			if (this.__weapon) {
				this.__bullets.remove(this.__weapon.group);
				this.__weapon = null;
			}
			
			if (value) {
				this.__weapon = value;
				this.__weapon.setParent(this, "x", "y", this.width * .5 - 1, this.height * .5);
				this.__bullets.add(this.__weapon.group);
			}
		}
		
		public function setShield(value:Number):void {
			this.__shield = value;
		}
		
		public function fire():void {
			if (this.__weapon) {
				this.__weapon.fire();
			}
		}
	}
}