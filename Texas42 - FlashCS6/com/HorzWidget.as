package com
{
	import flash.events.MouseEvent;
	import flash.display.*;
	import flash.text.*;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import flash.ui.Mouse;

	public class HorzWidget extends MovieClip
	{
		// --> You can change these values
		private var fontInLibrary:Font = new Arial(); // <-- There must be a Font symbol in the library set to "Export for ActionScript"
		private var fontSize:Number = 18;
		private var txtAlign:String = "center";
		private var txtColor:* = 0x000000;
		// --> End changes
		
		private var listLength:Number = 0;
		private var currectSelection:Number = 1;
	
		private var txtFormat:TextFormat = new TextFormat();

		private var txtFieldWidth:Number;
		private var txtFieldHeight:Number;

		private var scrollDist:Number = 0;
		private var newX:Number = 0;
		
		private var widgetValue:String = "";
		private var widgetArray:Array;
		
		public function HorzWidget()
		{
			// set the attributes of the text fields
			txtFormat.align = txtAlign;
			txtFormat.size = fontSize;
			txtFormat.font = fontInLibrary.fontName;
			txtFormat.color = txtColor; 
		}
		
		// add the fields to the widget
		public function createlist(_selectionArray:Array):void
		{
			widgetArray = _selectionArray;
			listLength = widgetArray.length;
			
			txtFieldWidth = findLongestStringInArray(widgetArray,fontInLibrary,txtFormat) + 50;
			txtFieldHeight = getTextLineHeight(widgetArray[0],fontInLibrary,txtFormat) + 5;
			
			scrollDist = txtFieldWidth;
			
			for (var i:int =0; i < listLength; i++)
			{
				var txtField:TextField = new TextField();
				txtField.text = _selectionArray[i];
				txtField.embedFonts = true;
				txtField.setTextFormat(txtFormat);
				txtField.width = txtFieldWidth;
				txtField.height = txtFieldHeight;
				txtField.selectable = false;
				//txtField.border = true;
				//txtField.borderColor = 0xFF00FF;
				txtField.x = txtFieldWidth * i;
				txtField.y = 4;
				number_mc.addChild(txtField);
			}
			
			txtFieldbkgd.width = HorzWidgetMask.width = txtFieldWidth;
			txtFieldbkgd.height = HorzWidgetMask.height = txtFieldHeight + 5;
			
			next_btn.x = txtFieldWidth + 5;
			next_btn.y = (txtFieldHeight / 2) + 2;
			next_btn.addEventListener(MouseEvent.CLICK, onNext);
			
			prev_btn.y = (txtFieldHeight / 2) + 2;
			prev_btn.addEventListener(MouseEvent.CLICK, onPrev);
			buttonView();
		}
		
		//next button actions 
		private function onNext(e:MouseEvent):void
		{
			if(currectSelection != listLength)
			{
				currectSelection++;
				newX = newX - scrollDist;
				var myTween:Tween = new Tween(number_mc, "x", Strong.easeOut, number_mc.x, newX, .5, true);
			}
			buttonView();
		}
		
		//previous button actions
		private function onPrev(e:MouseEvent):void
		{
			if(currectSelection != 1)
			{
				currectSelection--;
				newX = newX + scrollDist;
				var myTween:Tween = new Tween(number_mc, "x", Strong.easeOut, number_mc.x, newX, .5, true);
			}
			buttonView();
		}
		
		// show the next or previous button if the list is at the begining or end 
		private function buttonView():void
		{
			if(currectSelection == 1)
			{
				prev_btn.visible = false;
				next_btn.visible = true;
			} else if(currectSelection == listLength){
				prev_btn.visible = true;
				next_btn.visible = false;
			} else{
				prev_btn.visible = true;
				next_btn.visible = true;
			}
		}
		
		// return the value of the widget
		public function reportValue():String
		{
			widgetValue = widgetArray[currectSelection-1];
			return widgetValue;
		}

		// determines the longest string in the widget array
		private function findLongestStringInArray(inArray:Array,inFont:Font, inTextFormat:TextFormat=null):Number
		{
			var wResult:Number = 0;
			var tFormat:TextFormat;

			if (inTextFormat == null)
			{
				tFormat = new TextFormat();
				tFormat.size = fontSize;
				tFormat.align = TextFormatAlign.LEFT;
				tFormat.font = inFont.fontName;
				tFormat.rightMargin = 1;
			} else {
				tFormat = inTextFormat;
			}

			var len:int = inArray.length;

			for (var i:int =0; i < len; i++)
			{
				var testField:TextField = new TextField();
				testField.autoSize = TextFieldAutoSize.LEFT;
				testField.multiline = false;
				testField.wordWrap = false;
				testField.embedFonts = true;
				testField.antiAliasType = AntiAliasType.ADVANCED;
				testField.defaultTextFormat = tFormat;
				testField.text = inArray[i] as String;

				var stringWidth:Number = Math.floor(testField.width);

				if (stringWidth > wResult)
				{
					wResult = stringWidth;
				}
			}
			return wResult;
		}
		
		// returns the line height of the widget text field
		private function getTextLineHeight(inStr:String, inFont:Font, inTextFormat:TextFormat=null):Number
		{
			var tFormat:TextFormat;

			if (inTextFormat == null)
			{
				tFormat = new TextFormat();
				tFormat.size = 12;
				tFormat.align = TextFormatAlign.LEFT;
				tFormat.font = inFont.fontName;
				tFormat.rightMargin = 1;
			} else {
				tFormat = inTextFormat;
			}

			var testField:TextField = new TextField();
			testField.autoSize = TextFieldAutoSize.LEFT;
			testField.multiline = false;
			testField.wordWrap = false;
			testField.embedFonts = true;
			testField.antiAliasType = AntiAliasType.ADVANCED;
			testField.defaultTextFormat = tFormat;
			testField.text = inStr;

			return Math.floor(testField.height);
		}
	}
}