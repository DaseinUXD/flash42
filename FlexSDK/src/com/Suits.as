	/**
	 * ...
	 * @author Mark W. Matthews
	 */
package 
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
	import flash.display.MovieClip;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.MouseEvent;
    import flash.events.Event;
	
	public class Suits extends Sprite
	{
		var suitSix:Object;
		var suitFive:Object;
		var suitFour:Object;
		var suitThree:Object;
		var suitTwo:Object;
		var suitOne:Object;
		var suitBlank:Object;
		var suitDouble:Object;
	
		var sideTop:Array = [0, 1, 2, 3, 4, 5, 6];
		var sideBottom:Array = [6, 5, 4, 3, 2, 1, 0];
	
		public function Suits() 
		{
			suitSix = new Object ();
			suitSix.name = new String ("sixes");
			suitSix.value = new int (6);
			suitSix.dominoes = [(6, 6), (6, 5), (6, 4), (6, 3), (6, 2), (6, 1), (6, 0)];
			trace (suitSix.name, suitSix.value, suitSix.dominoes.length);
			
			suitFive = new Object ();
			suitFive.name = new String ("fives");
			suitFive.value = new int (5);
			suitFive.dominoes = [(5, 5), (5, 6), (5, 4), (5, 3), (5, 2), (5, 1), (5, 0)];
			trace (suitFive.name, suitFive.value, suitFive.dominoes.length);
							
			suitFour = new Object ();
			suitFour.name = new String ("fours");
			suitFour.value = new int (4);
			suitFour.dominoes = [(4, 4), (4, 6), (4, 5), (4, 3), (4, 2), (4, 1), (4, 0)];
			trace (suitFour.name, suitFour.value, suitFour.dominoes.length);
			
			suitThree = new Object ();
			suitThree.name = new String ("threes");
			suitThree.value = new int (3);
			suitThree.dominoes = [(3, 3), (3, 6), (3, 5), (3, 4), (3, 2), (3, 1), (3, 0)];
			trace (suitThree.name, suitThree.value, suitThree.dominoes.length);
			
			suitTwo = new Object ();
			suitTwo.name = new String ("twos");
			suitTwo.value = new int (2);
			suitTwo.dominoes = [(2, 2), (2, 6), (2, 5), (2, 4), (2, 3), (2, 1), (2, 0)];
			trace (suitTwo.name, suitTwo.value, suitTwo.dominoes.length);
							
			suitOne = new Object ();
			suitOne.name = new String ("ones");
			suitOne.value = new int (1);
			suitOne.dominoes = [(1, 1), (1, 6), (1, 5), (1, 4), (1, 3), (1, 2), (1, 0)];
			trace (suitOne.name, suitOne.value, suitOne.dominoes.length);
			
			suitBlank = new Object ();
			suitBlank.name = new String ("blanks");
			suitBlank.value = new int (0);
			suitBlank.dominoes = [(3, 3), (3, 6), (3, 5), (3, 4), (3, 2), (3, 1), (3, 0)];
			trace (suitBlank.name, suitBlank.value, suitBlank.dominoes.length);
			
			suitDouble = new Object ();
			suitDouble.name = new String ("doubles");
			suitDouble.value = new int (7);
			suitDouble.dominoes = [(6, 6), (5, 5), (4, 4), (3, 3), (2, 2), (1, 1), (0, 0)];
			trace (suitDouble.name, suitDouble.value, suitDouble.dominoes.length);
		
		

		}

	}
			
}