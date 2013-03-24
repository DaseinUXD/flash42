package com.mwm.games.flash42 
{
	import assets.mcPlayField;
	import flash.display.MovieClip;
	import com.mwm.games.flash42.Player;
	import flash.text.TextField;
	
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class Table extends MovieClip 
	{
		var playArea:MovieClip = new MovieClip;
		var dominoSet:DominoSet = new DominoSet;
		var 
		var playerNorth:Player = new Player(n, t);
		var playerSouth:Player
		var 
		
		public function Table() 
		{
			super();
			playArea = mcPlayField;
			stage.addChildAt(mcPlayField);
			
			
		}
		
	}

}