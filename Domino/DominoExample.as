package {
	
	import flash42.play.Dominoes;
	import flash.display.Sprite;
	
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
 public class DominoExample extends Sprite {

    public function DominoExample() {
      var dominoes:Dominoes = new Dominoes();
      var hands:Array = dominoes.deal(4, 7);
      var i:uint;
      var j:uint;
      for(i = 0; i < hands.length; i++) {
        trace("hand " + i);
        for(j = 0; j < hands[i].length; j++) {
          trace(hands[i].getDominoAt(j));
        }
      }
    }
 }

	
}