package  {
	import flash.sampler.StackFrame;
	import flash.display.Sprite;
	
	public class Table {

		public function Table() {
			// constructor code
		}
		//player racks to hold dominoes
		var southRack:Object;
/*		southRack.one
		southRack.two
		southRack.three
		southRack.four
		southRack.five
		southRack.six
*/
		var northRack:Object;
		var eastRack:Object;
		var westRack:Object;
		
		//placeholders for taking tricks
		var usPile:Object;
		var themPile:Object;
		
		//player names
		var playerName:Object;
/*		playerName.south;
		playerName.north;
		playerName.east;
		playerName.west
*/
		var southName:String;
		var northName:String;
		var eastName:String;
		var westName:String;
		
		//playing field
		var field:Sprite;

	}
	
}
