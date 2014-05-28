package invaders.objects {
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxBar;
	
	public final class Hud extends FlxGroup {
		
		private var __scoreDisplay:FlxText;
		
		private var __healthDisplay:FlxText;
		private var __weaponDisplay:FlxText;
		//private var __shieldDisplay:FlxBar;
		
		private var __weaponValue:String;
		private var __healthValue:Number;
		private var __shieldValue:Number;
		private var __scoreValue:int;
		
		public function Hud() {
			super(3);
			
			/*this.__healthDisplay = new FlxBar(10, 10, FlxBar.FILL_LEFT_TO_RIGHT, 100, 5);
			this.__healthDisplay.setRange(0, 100);
			this.__healthDisplay.currentValue = 100;*/
			
			this.__healthDisplay = new FlxText(10, 10, 100, "");
			this.__healthDisplay.alignment = "left";
			
			this.__weaponDisplay = new FlxText(10, FlxG.height - 20, 200, "");
			this.__weaponDisplay.alignment = "left";
			
			/*this.__shieldDisplay = new FlxBar(10, 15, FlxBar.FILL_LEFT_TO_RIGHT, 100, 5);
			this.__shieldDisplay.setRange(0, 100);
			this.__shieldDisplay.color = 0x6666ff;
			this.__shieldDisplay.currentValue = 50;*/
			
			this.__scoreDisplay = new FlxText(FlxG.width - 110, 10, 100, "");
			this.__scoreDisplay.alignment = "right";
			
			this.add(this.__healthDisplay);
			this.add(this.__weaponDisplay);
			//this.add(this.__shieldDisplay);
			this.add(this.__scoreDisplay);
		}
		
		public function updateHealth(value:Number):void {
			this.__healthValue = value;
		}
		
		public function updateShield(value:Number):void {
			this.__shieldValue = value;
		}
		
		public function updateWeapon(value:String):void {
			this.__weaponValue = value;
		}
		
		public function updateScore(value:int):void {
			this.__scoreValue = value;
		}
		
		override public function update():void {
			super.update();
			
			this.__scoreDisplay.text = "SCORE: " + this.__scoreValue.toString(10);
			this.__healthDisplay.text = "HEALTH: " + this.__healthValue.toString(10) + "%";
			this.__weaponDisplay.text = "WEAPON: " + this.__weaponValue;
			//this.__healthDisplay.currentValue = this.__healthValue;
			//this.__shieldDisplay.currentValue = this.__shieldValue;
		}
	}
}