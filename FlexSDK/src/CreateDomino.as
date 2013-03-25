/**
 * Copyright markmatthewsphd ( http://wonderfl.net/user/markmatthewsphd )
 * MIT License ( http://www.opensource.org/licenses/mit-license.php )
 * Downloaded from: http://wonderfl.net/c/pTY0
 */

package src.com
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class CreateDomino extends Sprite
	{
		
		private var mydomino:myDomino;
		private var dominoArray:Array;
		private var sideTop:int;
		private var sideBottom:int;
		
		public function CreateDomino()
		{
			
			dominoArray = new Array();
			mydomino = new myDomino();
			for (var i:int = 0; i < 7; i++) {
				var dominoList:Array = new Array();
				dominoArray[i] = dominoList;
				for (var j:int = 1; j < 7; j++) {
					
					var sdomino:Sprite = new Sprite();
					var domino:Bitmap = mydomino.makeDomino(i, j);
					domino.x = 0;
					domino.y = 0;
					sdomino.addChild(domino);
					sdomino.x = 200;
					sdomino.y = 300;
					addChild(sdomino);
					dominoArray[i] = sdomino;
				}
				
			}
			
			sideTop = 0;
			sideBottom = 0;
			addEventListener (Event.ENTER_FRAME, onEnterFrame);	
		
		}
		
		private function onEnterFrame(e:Event):void {
			var distx:int = (sideTop * 34 + 1) - dominoArray[sideTop].x;
			var disty:int = (sideBottom * 51 + 1) - dominoArray[sideBottom].y;
			if (distx < 0)
				distx = -distx;
			if (disty < 0)
				disty = -disty;
			if (distx > 0 || disty > 0) {
				dominoArray[sideTop].x += ((sideTop * 34 + 1) - dominoArray[sideTop].x) / 5;
				dominoArray[sideBottom].y += ((sideBottom * 51 + 1) - dominoArray[sideBottom].y) / 5;
			} else {
				dominoArray[sideTop].addEventListener(MouseEvent.MOUSE_DOWN, SstartDrag);
				dominoArray[sideTop].addEventListener(MouseEvent.MOUSE_UP, SstopDrag);
				
				sideTop++;
				if (sideTop == 7) {
					sideBottom++;
					if (sideBottom == 7) {
						removeEventListener(Event.ENTER_FRAME, onEnterFrame);
						
					}
					sideTop=0;
				}
				
			}
		}
		
		private function SstartDrag(e:MouseEvent):void {
			this.setChildIndex((Sprite)(e.currentTarget), this.numChildren - 1);
			e.currentTarget.startDrag();
		}
		
		private function SstopDrag(e:MouseEvent):void {
			e.currentTarget.stopDrag();
		}
	}

}

import flash.display.Sprite;
import flash.text.TextField;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.text.TextFormat;
import flash.text.Font;

class myDomino {
	private var aSideTop:Array = [0, 1, 2, 3, 4, 5, 6];
	private var aSideBottom:Array = [0, 1, 2, 3, 4, 5, 6];
	private var px:Array = [40, 40, 40, 40, 40, 20, 20, 20, 60, 60, 60, 20, 20, 60, 60];
	private var py:Array = [75, 45, 105, 25, 125, 25, 75, 125, 25, 75, 125, 60, 95, 60, 95];
	
	//カード生成
	public function makeDomino(topNumber:int, bottomNumber:int):Bitmap {
		var ret:Sprite = new Sprite();
		var retBitmap:Bitmap = new Bitmap();
		var retBitmapD:BitmapData = new BitmapData(100, 150, true, 0x000000);
		var tempBitmapData:BitmapData = new BitmapData(100, 150, true, 0x000000);
		var tempBitmap:Bitmap = new Bitmap();
		var tempSprite:Sprite = new Sprite();
		
		//外枠
		tempSprite.graphics.beginFill(0x000000);
		tempSprite.graphics.drawRoundRect(0, 0, 100, 150, 20, 20);
		tempSprite.graphics.endFill();
		tempBitmapData.draw(tempSprite);
		tempSprite.graphics.beginFill(0xffffff);
		tempSprite.graphics.drawRoundRect(2, 2, 98, 148, 20, 20);
		tempSprite.graphics.endFill();
		tempBitmapData.draw(tempSprite);
		
		{ //右下のナンバーと記号
			var topDots:Sprite = new Sprite();
			topDots.graphics.lineStyle(1, 0x000000);
			topDots.graphics.beginFill(0x000000);
			topDots.graphics.drawCircle(25, 25, 5);
			topDots.x = 0;
			topDots.y = 0;
			tempBitmapData.draw(topDots);
			tempBitmap.bitmapData = tempBitmapData;
			tempBitmap.rotation = 180;
			tempBitmap.x = 100;
			tempBitmap.y = 150;
			ret.addChild(tempBitmap);
		}
		
		{ //左上のナンバーと記号
			var bottomDots:Sprite = new Sprite();
			bottomDots.graphics.lineStyle(1, 0x000000);
			bottomDots.graphics.beginFill(0x000000);
			bottomDots.graphics.drawCircle(25, 25, 5);
			bottomDots.x = 0;
			bottomDots.y = 0;
			ret.addChild(bottomDots);
		}
		
		retBitmapD.draw(ret);
		retBitmap.bitmapData = retBitmapD;
		return retBitmap;
	}
}
