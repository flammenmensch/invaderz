package invaders.entities.bonuses {
	import invaders.Assets;
	import invaders.objects.AbstractUnit;
	
	import org.flixel.FlxG;

	public final class ScoreBonus extends AbstractBonus {
		
		private var __score:Number;
		
		public function ScoreBonus(score:Number) {
			super(Assets.Score);
			
			this.__score = score;
		}
		
		override public function applyBonus(target:AbstractUnit):void {
			FlxG.score += this.__score;
		}
	}
}