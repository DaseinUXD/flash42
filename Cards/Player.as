package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class  Player extends Sprite
	{
		protected const INFMT:TextFormat = new TextFormat ("_sans", 14, 0x505050);
		protected var nameTF:TextField;
		protected var teamTF:TextField;
		public var playerName:String;
		public var playerTeam:String;
		
		public function Player()
		{
			playerName:String = nameTF.text;
			playerTeam:String = teamTF.text;
			
			function playerDeal ():void //TODO: write for deal the cards Deal the cards.
			{
				
			}
			
			function playerShuffle	():void  //TODO: write code to shuffle pile.
			{
				
			}
			
			function playerPullHand ():void //TODO: write code to pull dominoes. 
			{
				
			}
			
			function playerPlayTrick():void //TODO: write code. 
			{
				
			}
			
			function playerBid ():void //TODO: write code
			{
				
			}
		}
		nameTF = makeInputTextField ();
		
	}
	
}