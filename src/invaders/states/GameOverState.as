package invaders.states {
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public final class GameOverState extends FlxState {
		
		private var __scoreLabel:FlxText;
		
		private var __label:FlxText;
		
		private var __score:Number;
		
		private var __resetButton:FlxButton;
		
		private var __text:String;
		
		public function GameOverState(text:String, score:Number=0) {
			super();
			
			this.__score = score;
			
			this.__text = text;
		}
		
		override public function create():void {
			super.create();
			
			this.__label = new FlxText(FlxG.width * .5 - 100, FlxG.height * .5 - 40, 200, this.__text);
			this.__label.alignment = "center";
			this.add(this.__label);
			
			this.__scoreLabel = new FlxText(FlxG.width * .5 - 100, FlxG.height * .5 - 20, 200, "SCORE: " + this.__score.toString(10));
			this.__scoreLabel.alignment = "center";
			this.add(this.__scoreLabel);
			
			this.__resetButton = new FlxButton(FlxG.width * .5 - 40, FlxG.height * .5, "CONTINUE", this.resetButtonClickHandler);
			this.add(this.__resetButton);
		}
		
		private function resetButtonClickHandler(...args):void {
			FlxG.switchState(new PlayState());
		}
	}
}