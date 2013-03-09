/* ***********************************************************************
Original AS3 Class for Flash CS4+ by Doug Ensley of http://www.flashandmath.com/
Last modified: November 20, 2010

Domino class

Adapted by Mark W. Matthews
Last modified: February 28, 2013
************************************************************************ */

package
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.PerspectiveProjection;
	
//	import flash.events.MouseEvent;
//	import flash.display.Shape;
	
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
	import flash.geom.Vector3D;
	
	
	public class Domino extends Sprite
	{
		public static const MOTION_DONE:String = "tweenMotionDone";
		public static const MOTION:String = "tweenMotion";
		
		private var bdFirst:BitmapData; //bdFirst = Bitmap Data Second
		private var bdSecond:BitmapData; //bdSecond = Bitmap Data Second
		
		private var _isFaceUp:Boolean;
//		private var _value:String; // variable for PlayingCard changed for Domino
//		private var _numValue:int; // variable for PlayingCard changed for Domino
//		private var _suit:String; // variable for PlayingCard changed for Domino
		private var _side0Value:int; // giving value to one side of domino
		private var _side1Value:int; // giving value to other side of domino
		private var _countValue:int; // counter value = 5 or 10 if _side0Value + _side1Value = 5 or 10 else = 0
		private var _isDouble:Boolean; // if side0 == side1 

		private var picWidth:Number;
		private var picHeight:Number;
		
		private var holder:Sprite;
		private var faceFront:Sprite; // faceFront = side0 in original file
		private var faceBack:Sprite; // faceBack = side1 in origincal file

		private var faceBackImg:Bitmap; // faceBackImg = side0Img in original file
		private var faceFrontImg:Bitmap; // faceFrontImg = side1Img in original file
		
		private var ptFrom:Vector3D;
		private var ptTo:Vector3D;
		private var objTween:Object;
		private var twMove:Tween;
		
		private var pp:PerspectiveProjection;
		
		/*
		The constructor of the Domino class takes two BitmapData objects 
		representing the images for the front and the back of the domino to be used
		by the class. This will typically be called from the DominoSet class, which 
		first loads all actual image files before constructing the individual dominoes.
		*/
		
//		private var isDragging:Boolean;

	// constructor code
		public function Domino(bmdFaceFront:BitmapData, bmdFaceBack:BitmapData) // constructor
		{
			ptFrom = new Vector3D(0,0,0);
			ptTo = new Vector3D(0,0,0);
			objTween = {t: 0};
			twMove = new Tween(objTween, "t", None.easeIn, 0, 1, 1, true);
			twMove.stop();
			twMove.addEventListener(TweenEvent.MOTION_CHANGE, tweenMover);
			twMove.addEventListener(TweenEvent.MOTION_FINISH, tweenDone);
			
			faceFrontImg = new Bitmap(bmdFaceFront);
			faceBackImg = new Bitmap(bmdFaceBack);
			
			picWidth = faceFrontImg.width;
			picHeight = faceFrontImg.height;
			
			holder = new Sprite();
			this.addChild(holder);
			
			holder.x = picWidth/2;
			holder.y = picHeight/2;
			
			faceFront = new Sprite();
			holder.addChild(faceFront);
			
			faceFrontImg.x = -picWidth/2;
			faceFrontImg.y = -picHeight/2;
			
			faceFront.x = 0;
			faceFront.y = 0;
			
			faceFront.addChild(faceFrontImg);
			
			faceBack = new Sprite();
			
			holder.addChild(faceBack);
			
			faceBackImg.x = picWidth/2;
			faceBackImg.y = picHeight/2;
			
			faceBack.x = 0;
			faceBack.y = 0;
			
			faceBack.addChild(faceBackImg);
			
			// in order to appear correctly after a flip, the back side needs to be rotated initially
			
			faceBack.rotationX = 180;
			_isFaceUp = true;
			
			/* We have easy-to-access properties for side values (_side0Value:int) and (_side1Value:int) 
			giving values to each side of a domino plus (_countValue:int) gives a couter 
			value of 0, 5, or 10 if side0 + side1 = 5 or 10 and (_isDouble:Boolean) if side0 == side1
			so can be used in a game.
			*****These values will have to be set at runtime if the programmer wants to use them.
			*/
			
//			_value = ""; // variable value for PlayingCard changed for Domino
//			_numValue = 0; // // variable value for PlayingCard changed for Domino
//			_suit - ""; // // variable value for PlayingCard changed for Domino
			_side0Value = 0;
			_side1Value = 0;
			_countValue = 0;
			_isDouble = false;
			
			/* ideas for _countValue pseudocode
				if _side0Value + _side1Value = 5 then _countValue = 5;
				if _side0Value + _side1Value = 10 then _countValue = 10;
				else _countValue = 0;
			** ides for _isDbouble pseudocode
				if side0Value == side1Value;
				then _isDouble = true;
			*/
			
			//Each instance of the Domino class has its own PerspectiveProjection object
			pp = new PerspectiveProjection();
			pp.fieldOfView = 60;
			pp.projectionCenter = new Point(picWidth/2,picHeight/2);
			this.transform.perspectiveProjection = pp;
			
			rotateView(0, "horizontal");
					
		}
		//End of constructor
		
		private function tweenMover(twe:TweenEvent):void 
		{
			this.x = ptFrom.x + objTween.t * (ptTo.x - ptFrom.x);
			this.y = ptFrom.y + objTween.t * (ptTo.y - ptFrom.y);
			this.z = ptFrom.z + objTween.t * (ptTo.z - ptFrom.z);
			
			dispatchEvent(new Event(MOTION)); // MOTION = string constant from above
		}
		
		private function tweenDone(twe:TweenEvent):void
		{
			ptFrom = new Vector3D(0,0,0);
			ptTo = new Vector3D(0,0,0);
			dispatchEvent(new Event(MOTION_DONE)); // MOTION_DONE = string constant from above
		}
		
		/*
		The tweenMotion method moves the card from coordinages (sx,sy,sz) 
		to coordinates (fx,fy,fz) over the course of sec seconds.
		*/
		
		public function tweenMotion(sx:Number, sy:Number, sz:Number, fx:Number, fy:Number, fz:Number, sec:Number):void
		{
			ptFrom.x = sx;
			ptFrom.y = sy;
			ptFrom.z = sz;
			
			ptTo.x = fx;
			ptTo.y = fy;
			ptTo.z = fx;
			
			twMove.duration = sec;
			twMove.stop();
			twMove.rewind();
			twMove.start();
		}
		
		public function get isFaceUp():Boolean
		{
			return _isFaceUp;
		}
/*		
		public function get value():String
		{
			return _value;
		}
		
		public function set value(v:String):void
		{
			_value = v;
		}
		
		public function get numValue():int
		{
			return _numValue;
		}
		
		public function set numValue(v:int):void
		{
			_numValue = v;
		}
		
		public function get suit():String
		{
			return _suit;
		}
		
		public function set suit(s:String):void
		{
			_suit = s;
		}
*/

		public function get side0Value():int
		{
			return _side0Value;
		}
		
		public function set side0Value(sv0:int):void
		{
			_side0Value = sv0;
		}
		
		public function get side1Value():int
		{
			return _side1Value;
		}
		
		public function set side1Value(sv1:int):void
		{
			_side1Value = sv1;
		}

		public function get countValue():int
		{
			return _countValue;
		}
		
		public function set countValue(cv:int):void
		{
			_countValue = cv;
		}
		
		public function get isDouble():Boolean
		{
			return isDouble;
		}
		
		public function set isDouble(dbl:Boolean):void
		{
			_isDouble = dbl;
		}
		
		// The method switchSideUp flips the card immediately -- it is not an animate effect.
		public function switchSideUp():void
		{
			if (_isFaceUp) {
				makeFaceDown();
			}
			else {
				makeFaceUp();
			}
		}
		
		// The following methods, used above, are public so they can be called diretly for greater control of the facing of the card
		public function makeFaceUp():void
		{
			rotateView(0,"horizontal");
			_isFaceUp = true;
		}
		
		public function makeFaceDown():void
		{
			rotateView(180,"horizontal");
			_isFaceUp = false;
		}
		
		/* The rotateView method manages the rotation of the domino and the correct visibility 
		settings for the two domino faces. This avoids depth swapping within the domino itself.  
		The value of t is the number of degrees of rotation, where t=0 means the card is face up.
		The spinType (default=vertical) specifies the axis of rotation, always the center of the domino.
		*/
		
		public function rotateView(t:Number, spinType:String="vertical"):void
		{
			var goodT:Number = t - 360*(Math.floor(t/360));
			
			if ( (goodT < 90) || (goodT > 270) ) {
				faceFront.visible = true;
				faceBack.visible = false;
			}
			else {
				faceFront.visible = false;
				faceBack.visible = true;
			}
			if(spinType == "vertical") {
				holder.rotationX = 0;
				holder.rotationY = goodT;
			}
			else {
				holder.rotationY = 0;
				holder.rotationX = goodT;
			}
		}
	
	}
}