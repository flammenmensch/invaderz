package {
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import invaders.states.PlayState;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	//[Frame(factoryClass="Preloader")]
	[SWF(width="640", height="560", backgroundColor="0x000000")]
	public class Invaders extends FlxGame {
		
		public function Invaders() {
			super(320, 280, PlayState, 2);
			
			this.forceDebugger = true;
			
			FlxG.debug = true;
			
			FlxG.setDebuggerLayout(FlxG.DEBUGGER_STANDARD);
			
			FlxG.mouse.show();
			
			this.contextMenu = new ContextMenu();
			this.contextMenu.hideBuiltInItems();
			this.contextMenu.customItems = [ new ContextMenuItem("(c) Flammenmensch, 2014") ];
		}
	}
}