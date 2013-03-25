package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import Player;
	import lib.PlayField_sp;
	
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class Table extends Sprite
	{
		var playArea:Sprite = new Sprite;
//		var dominoSet:DominoSet = new DominoSet;
		 
/*		var playerNorth:Player = new Player("n","t");
		var playerSouth:Player = new Player("n","t");
		var playerEast:Player = new Player("n","t");
		var playerWest:Player =	new Player("n","t");
*/		
		public function Table() 
		{
			this.addChild(new PlayField_sp())
			
			
		}
		
	}

}