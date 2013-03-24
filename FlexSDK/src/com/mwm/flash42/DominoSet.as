package  {
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class DominoSet extends MovieClip{
		private var oDominoes:Object;
		public var aDominoes:Array;
		private var vSideA:Vector.<int>;
		private var vSideB:Vector.<int>;		 
		
		public function DominoSet () {
			buildDominoSet ();
		
		}
		public function buildDominoSet ():void {
			vSideA = new Vector.<int>();
			vSideA.push (0,1,2,3,4,5,6);
			vSideB = new Vector.<int>();
			vSideB.push (0,1,2,3,4,5,6);
			aDominoes = new Array();
			oDominoes = new Object ();
			oDominoes.sideA = new Object ();
			oDominoes.sideB = new Object ();
			//dbl blank thu blank six
			aDominoes.push (oDominoes.BlankA = vSideA[0], oDominoes.BlankB = vSideB[0]); //00
			aDominoes.push (oDominoes.BlankA = vSideA[0], oDominoes.OneB = vSideB[1]); //01
			aDominoes.push (oDominoes.BlankA = vSideA[0], oDominoes.TwoB = vSideB[2]); //02
			aDominoes.push (oDominoes.BlankA = vSideA[0], oDominoes.ThreeB = vSideB[3]); //03
			aDominoes.push (oDominoes.BlankA = vSideA[0], oDominoes.FourB = vSideB[4]); //04
			aDominoes.push (oDominoes.BlankA = vSideA[0], oDominoes.FiveB = vSideB[5]); //05
			aDominoes.push (oDominoes.BlankA = vSideA[0], oDominoes.SixB = vSideB[6]); //06
			//dbl one thru one six
			aDominoes.push (oDominoes.OneA = vSideA[1], oDominoes.OneB = vSideB[1]); //11
			aDominoes.push (oDominoes.OneA = vSideA[1], oDominoes.TwoB = vSideB[2]); //12
			aDominoes.push (oDominoes.OneA = vSideA[1], oDominoes.ThreeB = vSideB[3]); //13
			aDominoes.push (oDominoes.OneA = vSideA[1], oDominoes.FourB = vSideB[4]);  //14
			aDominoes.push (oDominoes.OneA = vSideA[1], oDominoes.FiveB = vSideB[5]);  //15
			aDominoes.push (oDominoes.OneA = vSideA[1], oDominoes.SixB = vSideB[6]); //16
			
			aDominoes.push (oDominoes.TwoA = vSideA[2], oDominoes.TwoB = vSideB[2]); //22
			aDominoes.push (oDominoes.TwoA = vSideA[2], oDominoes.ThreeB = vSideB[3]); //23
			aDominoes.push (oDominoes.TwoA = vSideA[2], oDominoes.FourB = vSideB[4]);  //24
			aDominoes.push (oDominoes.TwoA = vSideA[2], oDominoes.FiveB = vSideB[5]);  //25
			aDominoes.push (oDominoes.TwoA = vSideA[2], oDominoes.SixB = vSideB[6]); //26

			aDominoes.push (oDominoes.ThreeA = vSideA[3], oDominoes.ThreeB = vSideB[3]); //33
			aDominoes.push (oDominoes.ThreeA = vSideA[3], oDominoes.FourB = vSideB[4]);  //34
			aDominoes.push (oDominoes.ThreeA = vSideA[3], oDominoes.FiveB = vSideB[5]);  //35
			aDominoes.push (oDominoes.ThreeA = vSideA[3], oDominoes.SixB = vSideB[6]); //36

			aDominoes.push (oDominoes.FourA = vSideA[4], oDominoes.FourB = vSideB[4]);  //44
			aDominoes.push (oDominoes.FourA = vSideA[4], oDominoes.FiveB = vSideB[5]);  //45
			aDominoes.push (oDominoes.FourA = vSideA[4], oDominoes.SixB = vSideB[6]); //46

			aDominoes.push (oDominoes.FiveA = vSideA[5], oDominoes.FiveB = vSideB[5]);  //55
			aDominoes.push (oDominoes.FiveA = vSideA[5], oDominoes.SixB = vSideB[6]); //56

			aDominoes.push (oDominoes.SixA = vSideA[6], oDominoes.SixB = vSideB[6]); //56
			
			oDominoes.sideA = oDominoes.BlankA;
			oDominoes.sideB = oDominoes.BlankB;

			trace (aDominoes.length, oDominoes.sideA, aDominoes.sort(), oDominoes.isDouble);
			
			if (oDominoes.BlankA == oDominoes.sideA && oDominoes.BlankB == oDominoes.sideB) {
				oDominoes.isDouble = true;
			}
			

			
		}
		
	}
	
}