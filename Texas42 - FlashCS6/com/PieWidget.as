package com
{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.events.Event;

	public class PieWidget extends MovieClip
	{
		private var pieValue:Number = 0;

		public function PieWidget()
		{
			slider_mc.handle_mc.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onUp);
		}
		
		// calls the updatePie method when the slider is moved
		private function onDown(e:MouseEvent):void
		{
			addEventListener(Event.ENTER_FRAME, updatePie);
		}
		
		// calls the updatePie method when the mouse click is up
		private function onUp(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, updatePie);
		}

		// updates the pie chart graphics
		private function updatePie(e:Event):void
		{
			gotoAndStop(Math.round(slider_mc.handle_mc.x / 2));
			percent_txt.text = Math.round(slider_mc.handle_mc.x / 2) + "%";
		}
		
		// return the value of the widget
		public function reportValue():String
		{
			pieValue = Math.round(slider_mc.handle_mc.x / 2);
			return String(pieValue);
		}

	}

}