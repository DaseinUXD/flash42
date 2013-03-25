package
{
	import org.flixel.*;
	
	
	/**
	 * This is a global helper class full of useful functions for audio,
	 * input, basic info, and the camera system among other things.
	 */
	public class GlobalVars
	{
		static public var lives:int;
		static public var save:FlxSave;
		static public var myPlayerHealth:int = 4;
		save = new FlxSave();
		save.bind("mySave");
		//save.erase();
		lives = 5;
		
		static public function saveProgress():void
		{
			if (save.bind("mySave"))
			{
				if (save.data.stage1Complete == null)
				{
					trace("not exist");
				}
				else 
				{
					trace(save.data.stage1Complete + "stage1Complete");
				}
			}
		}

		static public function getDistance(P1:FlxPoint, P2:FlxPoint):Number
		{
			var XX:Number = P2.x - P1.x;
			var YY:Number = P2.y - P1.y;
			return Math.sqrt( XX * XX + YY * YY );
		}
        [Embed(source = 'sprites/ButtonStart.png')] static public var ButtonStart_img:Class;
        [Embed(source = 'sprites/ButtonPull.png')] static public var ButtonPull_img:Class;
        [Embed(source = 'sprites/ButtonBid.png')] static public var ButtonBid_img:Class;
        [Embed(source = 'sprites/ButtonShake.png')] static public var ButtonShake_img:Class;
        [Embed(source = 'sprites/ButtonDeal.png')] static public var ButtonDeal_img:Class;
        [Embed(source = 'sprites/ButtonEnter.png')] static public var ButtonEnter_img:Class;
        [Embed(source = 'sprites/ButtonClose.png')] static public var ButtonClose_img:Class;
        [Embed(source = "sprites/StartScreen.png")] static public var StartScreen_img:Class;
		[Embed(source = "sprites/GameOver.png")] static public var GameOver_img:Class;
		
		[Embed(source = 'sprites/GameLogo.png')] static public var GameLogo_img:Class;
		
        [Embed(source = 'sprites/PlayField.png')] static public var PlayField_img:Class;
        [Embed(source = 'sprites/TableTop.png')] static public var TableTop_img:Class;
		[Embed(source = 'sprites/TrickPile.png')] static public var TrickPile_img:Class;		

	  ///////////////////////////////////////////////////////////////////Dominoes/////////////////////////////////////////////////////////////
        [Embed(source = 'sprites/domino0000_00.png')] static public var domino_00_img:Class;
        [Embed(source = 'sprites/domino0001_01.png')] static public var domino_01_img:Class;
		[Embed(source = 'sprites/domino0002_02.png')] static public var domino_02_img:Class;	
		[Embed(source = 'sprites/domino0003_03.png')] static public var domino_03_img:Class;
		[Embed(source = 'sprites/domino0004_04.png')] static public var domino_04_img:Class;
		[Embed(source = 'sprites/domino0005_05.png')] static public var domino_05_img:Class;
		[Embed(source = 'sprites/domino0006_06.png')] static public var domino_06_img:Class;
		
        [Embed(source = 'sprites/domino0007_11.png')] static public var domino_11_img:Class;
        [Embed(source = 'sprites/domino0008_12.png')] static public var domino_12_img:Class;
		[Embed(source = 'sprites/domino0009_13.png')] static public var domino_13_img:Class;	
		[Embed(source = 'sprites/domino0010_14.png')] static public var domino_14_img:Class;
		[Embed(source = 'sprites/domino0011_15.png')] static public var domino_15_img:Class;
		[Embed(source = 'sprites/domino0012_16.png')] static public var domino_16_img:Class;
        [Embed(source = 'sprites/domino0013_22.png')] static public var domino_22_img:Class;
        
		[Embed(source = 'sprites/domino0014_23.png')] static public var domino_23_img:Class;
		[Embed(source = 'sprites/domino0015_24.png')] static public var domino_24_img:Class;	
		[Embed(source = 'sprites/domino0016_25.png')] static public var domino_25_img:Class;
		[Embed(source = 'sprites/domino0017_26.png')] static public var domino_26_img:Class;
		[Embed(source = 'sprites/domino0018_33.png')] static public var domino_33_img:Class;
		[Embed(source = 'sprites/domino0019_34.png')] static public var domino_34_img:Class;
        [Embed(source = 'sprites/domino0020_35.png')] static public var domino_35_img:Class;

        [Embed(source = 'sprites/domino0021_36.png')] static public var domino_36_img:Class;
		[Embed(source = 'sprites/domino0022_44.png')] static public var domino_44_img:Class;	
		[Embed(source = 'sprites/domino0023_45.png')] static public var domino_45_img:Class;
		[Embed(source = 'sprites/domino0024_46.png')] static public var domino_46_img:Class;
		[Embed(source = 'sprites/domino0025_55.png')] static public var domino_55_img:Class;
		[Embed(source = 'sprites/domino0026_56.png')] static public var domino_56_img:Class;
		[Embed(source = 'sprites/domino0027_66.png')] static public var domino_66_img:Class;

		[Embed(source = 'sprites/domino0028_bk.png')] static public var domino_bk_img:Class;

		
		//Sounds
		[Embed(source = 'sounds/Shake01.mp3')] static public var Shake01_snd:Class;
		[Embed(source = 'sounds/shake02.mp3')] static public var Shake02_snd:Class;
		[Embed(source = 'sounds/Play01.mp3')] static public var Play01_snd:Class;
		[Embed(source = 'sounds/Play02.mp3')] static public var Play02_snd:Class;
		[Embed(source = 'sounds/GameOver.mp3')] static public var GameOver_snd:Class;

	}
}