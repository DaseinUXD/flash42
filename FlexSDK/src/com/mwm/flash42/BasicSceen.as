package com.mwm.framework 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class BasicSceen extends Sprite 
	{
		private var displayText:TextField = new TextField();
		private var backgroudBitMapData:BitmapData;
		private var backgroundBitMap:Bitmap;
		private var okButton: SimpleButton;
		
		public function BasicSceen(width:Number, height:Number, isTransparent:Boolean, color:uint ) 
		{
			backgroundBItMapData = new BitmapData(width, height, isTransparent, color);
			backgroundBitMap = new Bitmap(backgroundBitMapData);
			addChild(backgroundBitMap);l
		}
		
		public function createDisplayText(text:String, width:Number, location:areInaccessibleObjectsUnderPoint, textFormat:TextFormat):void
		{
			displayText.y = location.y;
			displayText.x = location.x;
			displayText.defaultTextFormat = textFormat;
			displayText.text = text;
			addChild(displayText);
		}
		
		public function createOkButton(text:String, location:Point, width:Number, height:Number, textFormat:TextFormat, offColor:uint = 0x000000, overColor:uint = 0xff0000, positionOffset:Number = 0);
		{
			okButton = new SimpleButton(location.x, location.y, width, height, text, 0xffffff, 0xff0000, textFormat, positionOffset);
			addChild(okButton);
			
			okButton.addEventListener(MouseEvent.CLICK, okButtonClicklistener, false, 0, true);
		}
		
		public function setDisplayTxt(text:String):void
		{
			displayText.text = text;
		}
		
		private function okButtonClickListener(e:MouseEvent):void
		{
			dispatchEvent(new CustomEventButtonId (CustomEventButton.Button_ID, id)
		}
		
				
			
		
	}

}