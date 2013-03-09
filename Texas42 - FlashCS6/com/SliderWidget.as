package com
{
	import flash.events.*;
	import flash.display.*;
	import flash.geom.Rectangle;

	public class SliderWidget extends MovieClip
	{
		private var sliderValue:Number = 0;
		private var xSlideNum:Number;
		private var ySlideNum:Number;
		private var slideRectangle:Rectangle;

		public function SliderWidget()
		{
			xSlideNum = sliderBar.x + sliderBar.width;
			ySlideNum= sliderBar.y;
			slideRectangle = new Rectangle(0,0,xSlideNum,ySlideNum);
			handle_mc.buttonMode = true;
			handle_mc.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onUp);
		}
		
		// calls the onDown method when the slider is moved
		private function onDown(e:MouseEvent):void
		{
			handle_mc.startDrag(false, slideRectangle);
		}
		
		// calls the onUp method when the mouse click is up
		private function onUp(e:MouseEvent):void
		{
			handle_mc.stopDrag();
		}
		
		// return the value of the widget
		public function reportValue():String
		{
			sliderValue = Math.round(handle_mc.x / 2);
			return String(sliderValue);
		}
	}
}