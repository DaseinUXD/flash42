package  
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import org.flixel.FlxSave;
	

	
	/**
	 * This is a global helper class full of useful functions for audio, 
	 * input, basic information, and the camera system among other things.
	 */
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class GlobalVars extends Sprite
	{
		static public var HumanPlayers:int;
		static public var ComPlayers:int = 4 - HumanPlayers;
		static public var PlayerHandScoreN:int;
		static public var PlayerHandScoreS:int;
		static public var PlayerHandScoreE:int;
		static public var PlayerHandScoreW:int;
		static public var Team01Score:int;
		static public var Team02Score:int;
		

		
/*		save = new FlxSave();
		save.bind("mySave");
		//save.erase();
		
		static public function saveProgress():void  
		{
			if (save.bind("mySave")) 
			{
				if (save.data.gameComplete == null); 
				{
					trace("not exist")
				}
				else 
				{
					trace(save.data.gameComeplete + "gameComplete");
				}
			}
		}
		
*/
		[Embed(source="sprites/gameLogo.png")] static public var GameLogo:Class;
		[Embed(source="sprites/Bid.png")] static public var BidButton:Class;
		[Embed(source="sprites/Pull.png")] static public var PullButton:Class;
		[Embed(source="sprites/Shake.png")] static public var ShakeButton:Class;
		[Embed(source="sprites/Start.png")] static public var StartButton:Class;
		[Embed(source="sprites/TrickPile.png")] static public var TrickPile:Class;
		[Embed(source="sprites/playField.png")] static public var PlayField:Class;
		[Embed(source="sprites/TableTop.png")] static public var TableTop:Class;
		
		
		public function GlobalVars()
		{
			
		}
	}

}