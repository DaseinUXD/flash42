package 
{
	import flash.display.Sprite;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class DrawSix extends Sprite
	{
		var domSprite:Sprite = new Sprite();
		
		public function DrawSix
		{
			domSprite.graphics.beginFill(0x000000);
			domSprite.graphics.drawRect(0, 0, 50, 50);
			this.addChild(domSprite);
			var six:Sprite = new Sprite(); 
			six.graphics.beginFill(0xFFFFFF); 
			six.graphics.drawCircle(4, 4, 4);
			six.graphics.drawCircle(24, 4, 4);
			six.graphics.drawCircle(44, 4, 4);
			six.graphics.drawCircle(4, 24, 4);
			six.graphics.drawCircle(24, 24, 4);
			six.graphics.drawCircle(44, 24, 4);
			domSprite.addChild(six);			
		}



	}
	
}