package 
{

	import flash42.util.NumberUtilities;
	import flash42.util.ArrayUtilities;
	import flash42.play.DominoSet;

	/**
	 * ...
	 * @author Mark W. Matthews
	 */

	 public class Domino {
		 private var oDomino:Object;
		 
		private var _nSide1:Number;
		private var _nSide2:Number;
		private var _isDouble:Boolean;
		private var _nCounterValue:Number; 
		
		public var sideA:Vector.<>


		public function Domino () {
			buildDomino ();
		}
		
		public function buildDomino ():void {
			
		}
			oDomino = new Object ();
			oDomino.00.sideA = 0;
			oDomino.00.sideB = 0;
			oDomino.00.counterValue = 0;
			oDomino.00.isDouble = true;
			oDomino.00.name = "double blank"
			
		}
	}
}