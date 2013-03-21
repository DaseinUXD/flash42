package com.mwm.games.flash42 
{
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class Player extends Object 
	{
		
		var playerName:String = new String(); //TODO do i want to put parameters? probably with individual player?
		var playerTeam:String = new String();
		var teamList:Array = new Array();//list of team names to choose from or assign to opponentl
		var playerHand:Array = new Array(7); //array of first set of dominoes, sets size of array at seven;
		
		public function Player() 
		{
			super();
			var player:Player = new Player(n:String, t:String);
				//player 

				player.name = playerName; //name property
				player.team = playerTeam; //property for team membership
				// player methods
				playerDeal(): //method for player to dealing
				
				playerPlay(); //method for player to play a trick
				
				playerBid();  //method for player to bid
				
				playerShake();  //method for player to shuffle dominoes
							
		}
				
		function playerDeal ():void 
		{
			//TODO: create code deal dominoes
		}
		
		function playerPlay ():void 
		{
			//TODO: create code play
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