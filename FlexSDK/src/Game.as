package  
{
    import org.flixel.*;
    [SWF(width="1200", height="1000", backgroundColor="#000000")]
    [Frame(factoryClass = "Preloader")]
    public class Game extends FlxGame
    {
        public function Game():void
        {
           
           super(200, 100, MenuState, 4);
        }  
    }
}