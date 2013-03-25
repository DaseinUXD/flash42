package 
{
    import org.flixel.*;
	import org.flixel.data.FlxAnim;
    public class GameOverScreen extends FlxSprite
    {
		//[Embed(source = 'sprites/gameOverScreen.png')] private var GameOver:Class;
        private var _move_speed:int = 400;
        public function GameOverScreen(X:Number,Y:Number):void
        {
            super(X, Y);
			var background:FlxSprite = new FlxSprite;
			background.loadGraphic(GlobalVars.GameOver_img, false, false);
			this.add(background);
			background.width = 450;
			background.height = 306;
			background.x = 0;
			background.y = 0;

			var pressClose:FlxSprite = new FlxSprite;
			pressClose.loadGraphic(GlobalVars.ButtonClose_img, false, false);
			this.add(pressStart);
			pressClose.x = background.width/2;
			pressClose.y = background.height/2;

			scrollFactor.x = scrollFactor.y = 0;
        }
    
        override public function update():void
        {

            super.update();
        }
    }
} 