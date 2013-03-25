package  
{

	import org.flixel.plugin.photonstorm.FlxMouseControl;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	
	public class PlayState extends FlxState
	{
		private var draggableSprite:FlxExtendedSprite;

	public function PlayState() 
		{
			
		}
		
		override public function create():void 
		{
			FlxG.mouse.show();
			
//Add the mouse control plugin once only			
			FlxG.addPlugin(new FlxMouseControl());
			
//Create a FlxExtendedSprite which is just an extended version of FlxSprite			
			draggableSprite = new FlxExtendedSprite();
			draggableSprite.makeGraphic();
			
			add(draggableSprite);
			
		}
		
		override public function update ():void 
		{
			if (FlxG.mouse.justPressed()) 
			{
//Similar to the flash api startDrag()				
				draggableSprite.enableMouseDrag();
			}
			if (FlxG.mouse.justReleased()) 
			{
//to end dragging call				
				draggableSprite.disableMouseDrag();
			}
		}
		super.update();

		
	}

}