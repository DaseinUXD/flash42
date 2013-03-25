package  
{
	import flash.display.MovieClip;
	import org.flixel.FlxBasic;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.system.input.Keyboard;
	import org.flixel.FlxG;
	import org.flixel.FlxGame; 
	import org.flixel.system.FlxPreloader;
	
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.*;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class MenuState extends MovieClip
	
	{
		
	
		public function MenuState():void
		{

			
		}

			
		
		public function create ():void 
		{
			var siteLogo:FlxSprite = new FlxSprite;
			siteLogo.loadGraphic(GlobalVars.GameLogo, false, false);
			this.add(siteLogo);
			siteLogo.x = 600;
			siteLogo.y = 300;
			var pressStart:FlxSprite = new FlxSprite;
			pressStart.loadGraphic(GlobalVars.StartButton, false, false);
			this.add(pressStart);
			pressStart.x = 600;
			pressStart.y = 500;
		}
		
		public function update():void 
		{
			if (FlxG.keys.pressed("ENTER")) 
			{
				FlxG.flash(0xffffff, 0.75);
				FlxG.fade(0xff0000, 1, onFade);
			}
			super.update();
		}
		private function onFade():void 
		{
			switchState(StartGameState);
		}
	}
}

