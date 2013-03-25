package  
{
	import org.flixel.FlxGame;
	
	[SWF(width = "1200", height = "1000", backgroundcolor= "#000000000")]
	[Frame(factoryClass="Preloader")]
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class Game extends FlxGame
	{
		
		public function Game():void
		{
			FlxGame(1200, 1000, MenuState, 1, 60, 30, false);
		}
		
	}

}