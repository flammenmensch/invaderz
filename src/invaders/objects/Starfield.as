package invaders.objects {
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxSpecialFX;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
	
	public final class Starfield extends FlxGroup {
		
		private var __starfield:StarfieldFX;
		
		private var __stars:FlxSprite;
		
		public function Starfield() {
			super(1);
			
			if (FlxG.getPlugin(FlxSpecialFX) === null) {
				FlxG.addPlugin(new FlxSpecialFX());
			}
			
			this.__starfield = FlxSpecialFX.starfield();
			
			this.__stars = this.__starfield.create(0, 0, FlxG.width, FlxG.height, 64);
			
			this.__starfield.setStarSpeed(0, .5);
			
			this.add(this.__stars);
		}
		
		override public function update():void {
			super.update();
		}
		
		override public function destroy():void {
			FlxSpecialFX.clear();
			
			super.destroy();
		}
	}
}