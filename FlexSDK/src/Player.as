 package
{
    import org.flixel.*;
	import Domino;
    public class Player extends FlxSprite
    {

		public var playerName:String;
		public var playerTeam:String;
		
		
		public function Player(n:String,t:String):void
        {
			playerName = n;
			playerTeam = t;

		}
		
        override public function update():void
        {


		}  

        
 					// player methods
		function playerShake ():void 
		{
			//TODO: create code to deal dominoes
			FlxG.play(GlobalVars.Shake01_snd);
			dominoShake();  //TODO: add paramerters for shaking
		}
		
		function playerPullHand ():void 
		{
			//TODO: create code to pull hand 
		}
		function playerPlay ():void 
		
		{
			//TODO: create code to play
/*			FlxG.play(GlobalVars.Play01_snd);
			playDOmino.start(true, 1, 20); //TODO: create code
*/		}
				
/*		function playerBid ():void 
		{
			//TODO: create code to bid
		}
						
*/		
		

	}
}
