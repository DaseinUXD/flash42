package com.mwm.games.flash42

{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import flash.display.*;
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class  Domino extends Sprite
	{
		static const dotSix:int = 6; //six dots
		static const dotFive:int = 5; //five dots
		static const dotFour:int = 4; //four dots
		static const dotThree:int = 3; //three dots
		static const dotTwo:int = 2; //two dots
		static const dotOne:int = 1; //one dot
		static const dotBlank:int = 0; //zero dots
		
		var sideTotal:int;

		static const domW:int = 100; //domino width constant
		static const domH:int = 200; //domino height constant
		static const domRadius:int = 10; //domino corner raddi
		static const dotRadius:int = 10; //dot radius

		public var domino:Sprite; //domino holder
		public var domOutline:Sprite; //domino outline
		public var domDot:Sprite; //domino dots
		public var centerLine:Sprite;

		var domX:int; //x position
		var domY:int; //y position
		
		
		var domTLR:int = domRadius; //Top Left
		var domTRR:int = domRadius; //Top Right
		var domBLR:int = domRadius; //Bottom Left
		var domBRR:int = domRadius; //Bottom Right
		 
		
		public function Domino():void 
		{
			drawDomino();
		}
			function drawDomino ():void 
			{
			
			//TODO: add tSide:int, bSide:int as param for function
			
			//domino = new Sprite;
			domOutline = new Sprite;
			domDot = new Sprite;
			domX = 10;
			domY = 10;
			centerLine = new Sprite;

/*
 * 	 * Specifies a line style used for subsequent calls to
	 * Graphics methods such as the lineTo() method
	 * or the drawCircle() method.
	 * drawStroke(
	 * lineStyle(thickness:Number = NaN, 
	 * color:uint = 0,
	 * alpha:Number = 1.0, 
	 * pixelHinting:Boolean = false, 
	 * scaleMode:String = "normal", 
	 * caps:String = null, 
	 * joints:String = null, 
	 * miterLimit:Number = 3):void
	 * 
*/	   
			// Domino Outline
			domOutline.graphics.lineStyle (2, 1, 1);
			domOutline.graphics.beginFill (0xD7D7D7);
			domOutline.graphics.drawRoundRectComplex (domX, domY, domW, domH, domTLR, domTRR, domBLR, domBRR); //pass args for rectangle dim
			
			domOutline.graphics.endFill ();
			domOutline.x = 10;
			domOutline.y = 10;
			
			drawDots();
			
			stage.addChild(domOutline);
			domOutline.addChild (centerLine);
			domOutline.addChild(centerLine);
			domOutline.addChild(domDot);
			domDot.x = (20+domW)/2;
			domDot.y = (20+domH)/4;

			centerLine.graphics.lineStyle (2, 1, 1);
			centerLine.graphics.beginFill (0x000000);
			centerLine.graphics.drawRoundRectComplex (0, 0, 96, 4, 2, 2, 2, 2); //pass args for rectangle dim
			centerLine.graphics.endFill ();
			centerLine.x = domOutline.x+5;
			centerLine.y = domOutline.y+94;


			
				
				
			
			
			//put pieces together
			
			trace (domDot.x, domDot.y);
			domino.x = domOutline.x;
			domino.y = domOutline.y;
			trace (domino.x, domino.y);
			stage.addChild (domDot);
			trace (stage.x, stage.y);
			
			
			}
			function drawDots ():void //TODO dots:int to make number of dots
			{
						// Domino dot
				domDot.graphics.lineStyle (1, 1, 1);
				domDot.graphics.beginFill (0x000000);
				domDot.graphics.drawCircle (1, 1, dotRadius);
				domDot.graphics.endFill ();
			}
			protected function drawStroke(y:Number):void
			{
				graphics.moveTo(x,y);
				graphics.lineTo(x, y);
				graphics.lineStyle(5);
				graphics.moveTo(x, y);
				graphics.lineTo(x,y);
			}
					
			
		}
		
	}
	
