package com
{
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.events.*;
	import flash.display.*;

	public class SmileyWidget extends MovieClip
	{

		private var faceValue:Number = 0;

		public function SmileyWidget()
		{
			slider_mc.handle_mc.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onUp);
		}
		
		// calls the updateFace method when the slider is moved
		private function onDown(e:MouseEvent):void
		{
			addEventListener(Event.ENTER_FRAME, updateFace);
		}
		
		// calls the updateFace method when the mouse click is up
		private function onUp(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, updateFace);
		}

		// updates the smiley face graphics
		private function updateFace(e:Event):void
		{
			gotoAndStop(slider_mc.handle_mc.x);
		}
		
		// return the value of the widget
		public function reportValue():String
		{
			faceValue = Math.round(currentFrame/2);
			return faceValue.toString();
		}
	}

}