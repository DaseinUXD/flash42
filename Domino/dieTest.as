package{
	
import flash.display.Sprite;

public class dieTest extends Sprite{
	
	public function dieTest() {
	var domSprite:Sprite = new Sprite();
		domSprite.graphics.beginFill(0x000000);
		domSprite.graphics.drawRoundRect(0,0,86,50,10,10);
		domSprite.graphics.beginFill(0xFFFFFF); 
		domSprite.graphics.drawCircle(4, 4, 4);
		domSprite.graphics.drawCircle(24, 4, 4);
		domSprite.graphics.drawCircle(44, 4, 4);
		domSprite.graphics.drawCircle(4, 24, 4);
		domSprite.graphics.drawCircle(24, 24, 4);
		domSprite.graphics.drawCircle(44, 24, 4);
	this.addChild(domSprite);
	}
	}
}