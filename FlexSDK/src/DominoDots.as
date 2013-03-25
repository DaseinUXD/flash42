package 
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
	public class  DominoDots extends Sprite
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
		public var centerLine:Sprite; //center divider line
		public var dominoArray:Array = new Array;

				
		var domTLR:int = domRadius; //Top Left
		var domTRR:int = domRadius; //Top Right
		var domBLR:int = domRadius; //Bottom Left
		var domBRR:int = domRadius; //Bottom Right

		
		var domX:int; //x position of domino
		var domY:int; //y position of domino
		 
		
		public function DominoDots()
		{
			renderDomino();
		}
			function renderDomino ():void 
			{
			for (var i:int = 0; i < 7; i++) 
			{ for (var j:int = 0; j < 4; j++) 
			{
				
			
				
			
			//TODO: add tSide:int, bSide:int as param for function
			
			domOutline = new Sprite;
			domDot = new Sprite;
			domX = 0;
			domY = 0;
			centerLine = new Sprite;
   
			// Domino Outline
			domOutline.graphics.lineStyle (2, 1, 1);
			domOutline.graphics.beginFill (0xFFFFFF);
			domOutline.graphics.drawRoundRectComplex (domX, domY, domW, domH, domTLR, domTRR, domBLR, domBRR); //pass args for rectangle dim
			domOutline.graphics.endFill ();
			domOutline.x = domX + (i * 50);
			domOutline.y = domY + (j * 100);
			// Domino Dots
			
			
			this.addChild(domOutline);

			//Domino centerline
			centerLine.graphics.lineStyle (2, 1, 1);
			centerLine.graphics.beginFill (0x000000);
			centerLine.graphics.drawRoundRectComplex (0, 0, 90, 4, 2, 2, 2, 2); //pass args for rectangle dim
			centerLine.graphics.endFill ();
			centerLine.x = domW-95;
			centerLine.y = domH-100;
			
	
			domOutline.addChild(centerLine);
			domOutline.scaleX = .5;
			domOutline.scaleY = .5;
			dominoArray.push(domOutline); //add rendered domino to array.
			trace(dominoArray.length); 
			}
			}

//			drawDots();		
			}
			function drawDots ():void //TODO dots:int to make number of dots
			{
						// Domino dot
				domDot.graphics.lineStyle (1, 1, 1);
				domDot.graphics.beginFill (0x000000);
				domDot.graphics.drawCircle (1, 1, dotRadius);
				domDot.graphics.endFill ();
				
					domOutline.addChild(domDot);
					domDot.x = (20+domW)/2;
					domDot.y = (20+domH)/4;

			}
			}
					
			
		}
		

	
