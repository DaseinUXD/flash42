package  
{
	import flash.text.TextField;
	import org.flixel.FlxGroup;
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import Player;
	import Players;
	import Table;
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class GameStage extends FlxExtendedSprite
	{
/*			public var _player:Player;  //TODO: adapt/change class
		public var team:teamName; //TODO: add Team class/method
		
		public var table:Table; //TODO: add Table class/method
		public var playArea:P/*layField; //TODO: add class/method
		public var trickArea:TrickPile; //TODO: add class/method
	public var playerNameNorthTF:TextField; //TODO: how to handle the name plates
		public var playerNameEastTF:TextField;
		public var playerNameWestTF:TextField;
		public var playerNameSouthTF:TextField;

		public var scoreCard:ScoreCard;
		public var gameHUD:FlxGroup; //TODO: game information
		
		public var domSet:DominoSet; //TODO: 
		public var domShuffledSet:DominoShuffledSet;
		public var domDeal:DominoDeal;
		
		public var playerHandN:PLayerHand; // TODO: make PlayerHand method/array
		public var playerHandE:PLayerHand; // TODO: make PlayerHand method/array
		public var playerHandW:PLayerHand; // TODO: make PlayerHand method/array
		public var playerHandS:PLayerHand; // TODO: make PlayerHand method/array
		
		public var handTrick:Trick;
*/		

//Constructor		
		public function GameStage():void 
		{
			
		}
		
		 public function create ():void 
		{
			
		}
		
		override public function update ():void 
		{
			if (FlxGroup.keys.justPressed("H")) //TODO: show help 
			{
				
			}
		}
		
	}

}