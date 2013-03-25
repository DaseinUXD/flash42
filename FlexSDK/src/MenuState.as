package
{
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		//[Embed(source = 'media/music/adventure.mp3')] private var bgMusic:Class;
		
		override public function MenuState():void
		{
		
		}
		
		override public function create():void
		{
			var background:FlxSprite = new FlxSprite;
			background.loadGraphic(GlobalVars.StartScreen_img, false, false);
			this.add(background);
			background.width = 450;
			background.height = 306;
			background.x = 0;
			background.y = 0;
			
			var pressStart:FlxSprite = new FlxSprite;
			pressStart.loadGraphic(GlobalVars.ButtonStart_img, false, false);
			this.add(pressStart);
			pressStart.x = background.width / 2;
			pressStart.y = background.height / 2;
		
		}
		
		override public function update():void
		{
			if (FlxG.keys.pressed("X") && FlxG.keys.justPressed("C"))
			{
				FlxG.flash.start(0xffffffff, 0.75);
				FlxG.fade.start(0xff000000, 1, /*onFade*/);
			}
			super.update();
		}
		
/*		private function onFade():void
		{
			FlxG.state = new GameStage();
		}*/
	}

}