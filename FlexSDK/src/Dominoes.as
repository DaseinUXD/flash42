package  
{
	import org.flixel.FlxSprite;
	
	import Domino;
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class Dominoes extends FlxSprite 
	{
		public var domino00:Domino;
		public var domino01:Domino;
		public var domino02:Domino;
		public var domino02:Domino;
		public var domino04:Domino;
		public var domino05:Domino;
		public var domino06:Domino;
		public var domino11:Domino;
		public var domino12:Domino;
		public var domino13:Domino;
		public var domino14:Domino;
		public var domino15:Domino;
		public var domino16:Domino;
		public var domino22:Domino;
		public var domino23:Domino;
		public var domino24:Domino;
		public var domino25:Domino;
		public var domino26:Domino;
		public var domino33:Domino;
		public var domino34:Domino;
		public var domino35:Domino;
		public var domino36:Domino;
		public var domino44:Domino;
		public var domino45:Domino;
		public var domino46:Domino;
		public var domino55:Domino;
		public var domino56:Domino;
		public var domino66:Domino;

		

		public var dominoSet:Array;
		public var dominoHand:Array;
		
		public function Dominoes() 
		{
			
		}
		
		//Domino
		
		//01
		public function Dom00 ():void 
		{
		domino00 = new Domino(0, 0);
		domino00.domFront.loadGraphic(GlobalVars.domino_00_img,false, true, 58, 85);
		
		}
		
		
	}

}