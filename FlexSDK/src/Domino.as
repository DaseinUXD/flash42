package  
{
	import org.flixel.plugin.photonstorm.FlxMouseControl;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxSprite;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxPath;

	import PlayState;
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	
	public class Domino extends FlxExtendedSprite
	{
		public var domino:Domino;
		public var domFront:FlxSprite;
		public var sideA:int;
		public var sideB:int;
		public var isDouble:Boolean;
		public var counterValue:int;
/*		public var suitRankSideA:int;
		public var suitRankSideB:int;
*/		public var domBack:FlxSprite;
		static public var W:int = 50; //domino width
		static public var H:int = 85; //domino height
			
		
		
		// constructor
		public function Domino(sideA:int, sideB:int):void 
		{	
			domino = new mx.core.FlexApplicationBootstrap(this.x, this.y)
			domino.enableMouseDrag();
			addAnimation(dominoPlay);
			addAnimation(dominoShake);
			addAnimation(dominoFlip);
			addAnimation(dominoMove);
			addAnimation(dominoRemove);
			domFront = new FlxSprite();
			domFront.loadGraphic(Pic("String"), false, true, W, H, true);
			
			var sideA:int = a;
			var sideB:int = b;

			if (a == b) 
			{
				isDouble = true;
			}
			
			if (a + b = 5) 
			{
				counterValue = 5;
				if ( a+ b = 10) 
				{
					valueCounter = 10;
				}
			}
			else 
			{
				counterValue = 0;
			}
			
			domBack = new FlxSprite();
			domBack.loadGraphic(GlobalVars.domino_bk_img, false, true, 50, 85); 
			
		}
		
		// domino methods
		public function dominoPlay ():void 
		{
			//TODO:  dragDomino = FlxMouseControl(this.x,);
		}
		public function dominoShake ():void 
		{ 		var x:int = 0;
				var y:int = 0

			for (var i:int = 0; i < 5; i++) 
			{
				for (var j:int = 0; j < 5; j++) 
				{
					var shakePath:FlxPath = new FlxPath();
					shakePath.add(x*i,y*j)
				}
			

			shakePath.add(x*i, y*j);
			}
			trace(shakePath())
		}
		
		public function dominoFlip ():void 
		{
			
		}
		
		public function dominoTurn ():void 
		{
			
		}
		
		public function dominoMove ():void 
		{
			
		}
		
		public function dominoRemove ():void 
		{
			
		}
		
		public function dominoPull():void 
		{
			
		}
	}

}