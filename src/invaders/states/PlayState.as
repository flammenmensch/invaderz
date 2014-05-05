package invaders.states {
	import invaders.objects.AlienGroup;
	import invaders.objects.Hud;
	import invaders.objects.Player;
	import invaders.objects.Starfield;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	public final class PlayState extends FlxState {
		
		private var __starfield:FlxGroup;
		private var __hud:FlxGroup;
		
		private var __aliens:FlxGroup;
		
		private var __player:FlxSprite;
		
		public function PlayState() {
			super();
		}
		
		override public function create():void {
			super.create();
			
			this.__starfield = new Starfield();
			
			this.__player = new Player();
			
			this.__hud = new Hud();
			
			this.__aliens = new AlienGroup();
			
			this.add(this.__starfield);
			
			this.add(this.__player);
			
			this.add(this.__aliens);
			
			this.add(this.__hud);
		}
	}
}