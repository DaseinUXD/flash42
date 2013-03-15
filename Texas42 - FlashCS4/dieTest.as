import flash.display.Sprite;

var domSprite:Sprite = new Sprite();
domSprite.graphics.beginFill(0x000000);
domSprite.graphics.drawRoundRect(0,0,86,50,10,10);
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
