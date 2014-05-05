package invaders.objects {
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxControl;
	import org.flixel.plugin.photonstorm.FlxControlHandler;
	
	public class Player extends FlxSprite {
		
		[Embed(source="/../assets/player.png")]
		private static const IMAGE:Class;
		
		private var __handler:FlxControlHandler;
		
		public var armor:Number = 0;
		
		public function Player() {
			super();
			
			this.width = this.height = 16;
			this.x = (FlxG.width - this.width) * .5;
			this.y = (FlxG.height - this.height) - 10;
			
			this.loadGraphic(IMAGE, false);
			
			if (FlxG.getPlugin(FlxControl) === null) {
				FlxG.addPlugin(new FlxControl());
			}
			
			this.__handler = FlxControl.create(this, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_INSTANT, 1, false, false);
			this.__handler.setMovementSpeed(200, 0, 200, 0);
			this.__handler.setCursorControl(false, false, true, true);
			this.__handler.setBounds(10, FlxG.height - 60, FlxG.width - this.width - 20, 60);
		}
		
		override public function destroy():void {
			FlxControl.stop(this.__handler);
			FlxG.getPlugin(FlxControl).destroy();
			
			super.destroy();
		}
	}
}