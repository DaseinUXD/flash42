package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import org.flixel.FlxSprite;
	import Player;
	import lib.PlayField_sp;
	
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class Table extends FlxSprite
	{
		var table:FlxSprite = FlxSprite;
		table.loadGraphic(GlobalVars.TableTop_img, false, false, 1201, 1000, true);
		
		var playArea:FlxSprite = new FlxSprite;
//		var dominoSet:DominoSet = new DominoSet;
		 
/*		var playerNorth:Player = new Player("n","t");
		var playerSouth:Player = new Player("n","t");
		var playerEast:Player = new Player("n","t");
		var playerWest:Player =	new Player("n","t");
*/		
		public function Table() 
		{
			playField_img();
			
			
		}
		
	}

}