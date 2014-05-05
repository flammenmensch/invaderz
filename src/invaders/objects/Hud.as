package invaders.objects {
	import mx.utils.StringUtil;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxBar;
	
	public final class Hud extends FlxGroup {
		
		private var __scoreDisplay:FlxText;
		
		private var __healthDisplay:FlxBar;
		private var __armorDisplay:FlxBar;
		
		public function Hud() {
			super(3);
			
			this.__healthDisplay = new FlxBar(10, 10, FlxBar.FILL_LEFT_TO_RIGHT, 100, 5);
			this.__healthDisplay.setRange(0, 100);
			this.__healthDisplay.currentValue = 100;
			
			this.__armorDisplay = new FlxBar(10, 15, FlxBar.FILL_LEFT_TO_RIGHT, 100, 5);
			this.__armorDisplay.setRange(0, 100);
			this.__armorDisplay.color = 0x6666ff;
			this.__armorDisplay.currentValue = 50;
			
			this.__scoreDisplay = new FlxText(FlxG.width - 110, 10, 100, "");
			this.__scoreDisplay.alignment = "right";
			
			this.add(this.__healthDisplay);
			this.add(this.__armorDisplay);
			this.add(this.__scoreDisplay);
		}
		
		override public function update():void {
			super.update();
			
			this.__scoreDisplay.text = StringUtil.substitute("SCORE: {0}", FlxG.score);
		}
	}
}