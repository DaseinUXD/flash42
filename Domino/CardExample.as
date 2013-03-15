package {
	
	import ascb.play.Cards;
	import flash.display.Sprite;
	import trace;
	
	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
 public class CardExample extends Sprite {

    public function CardExample() {
      var cards:Cards = new Cards();
      var hands:Array = cards.deal(4, 10);
      var i:uint;
      var j:uint;
      for(i = 0; i < hands.length; i++) {
        trace("hand " + i);
        for(j = 0; j < hands[i].length; j++) {
          trace(hands[i].getCardAt(j));
        }
      }
    }
 }

	
}