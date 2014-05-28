package invaders.objects {
	
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxControlHandler;
	
	public class Player extends AbstractUnit {
		
		private var __handler:FlxControlHandler;
		
		public function Player() {
			super();
			
			this.width = this.height = 16;
			
			this.x = (FlxG.width - this.width) * .5;
			this.y = (FlxG.height - this.height) - 10;
		}
		
		public function setHandler(value:FlxControlHandler):void {
			this.__handler = value;
		}
		
		override public function update():void {
			super.update();
			
			if (this.__handler) {
				this.__handler.update();
			}
		}
	}
}