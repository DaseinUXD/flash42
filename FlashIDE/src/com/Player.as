package  
{
	import flash.text.TextField;
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class Player extends Object 
	{
		
		protected var nameTF:TextField = new TextField();
		protected var teamTF:TextField = new TextField();
		var playerName:String = new String(); //TODO do i want to put parameters? probably with individual player?
		var playerTeam:String = new String();
		var teamList:Array = new Array();//list of team names to choose from or assign to opponentl
		var playerHand:Array = new Array(7); //array of first set of dominoes, sets size of array at seven;
		
		public function Player() 
		{
			
				makePlayer(); // generate new player
						
		}
		function makePlayer(n:String, t:String):void 
		{		// player
				var player:Player = new Player();  
				player.name = n;//name property
				player.team = t; //property for team membership
		}

		// player methods
		function playerDeal ():void 
		{
			//TODO: create code deal dominoes
		}
		
		function playerPullHand ():void 
		{
			//TODO: create code to pull hand
		}
		function playerPlay ():void 
		{
			//TODO: create code to play
		}
				
		function playerBid ():void 
		{
			//TODO: create code to bid
		}
						
		function playerShake ():void 
		{
			//TODO: create code to shuffle
		}
	}

}