package flash42.play {

	import flash42.util.NumberUtilities;
	import flash42.util.ArrayUtilities;

	public class Dominoes {

		private var _domSet:DominoSet;

		// The Dominoes constructor creates a setDeck of Dominoes.
		public function Dominoes () {
			_domSet = new DominoSet();
		}

		// The deal() method needs to know the number of players in the game 
		// and the number of Dominoes to deal per player. If the DominoesPerPlayer 
		// parameter is undefined, then it deals all the Dominoes.
		public function deal (nPlayers:Number, nPerPlayer:Number = -1):Array {

			_domSet.reset ();
			_domSet.shuffle ();

			// Create an array, players, that holds the cards dealt to each player.
			var aHands:Array = new Array();

			// If a cardsPerPlayer value was passed in, deal that number of cards.
			// Otherwise, divide the number of cards (52) by the number of players.
			var nDominoesEach:Number = (nPerPlayer == -1) ? Math.floor(_domSet.setDeck.length / nPlayers) : nPerPlayer;

			// Deal out the specified number of cards to each player.
			for (var i:uint = 0; i < nPlayers; i++) {

				aHands.push (new DominoHand(_domSet));

				// Deal a random card to each player. Remove that card from the 
				// tempCards array so that it cannot be dealt again.
				for (var j:Number = 0; j < nDominoesEach; j++) {
					aHands[i].hand.push (_domSet.setDeck.shift());
				}

				// Use Cards.orderHand() to sort a player's hand, and use setHand() 
				// to assign it to the card player object.

			}

			// Return the players array.
			return aHands;
		}
	}

}



class Domino {
	import flash42.util.NumberUtilities;
	import flash42.util.ArrayUtilities;

	private var _nSide1:Number;
	private var _nSide2:Number;
	private var _isDouble:Boolean;
	private var _nCounterValue:Number;
	private var _sDominoName:String;

	public function get side1 ():Number {
		return _nSide1;
	}
	
	public function get side2 ():Number {
		return _nSide2;
	}
	
	public function get double ():Boolean {
		return _isDouble;
	}

	public function get counterValue ():Number {
		return _nCounterValue;
	}

	public function get dominoName ():String {
		return _sDominoName;
	}

	public function get display ():String {
		return _nSide1 + " " + _nSide2;
	}

	public function Domino (nSide1:Number, nSide2:Number, sDominoName:String) {
		_nSide1 = nSide1;
		_nSide2 = nSide2;
		_sDominoName = sDominoName;
	}

	public function toString ():String {
		return display;
	}

}

class DominoSet {
	import flash42.util.NumberUtilities;
	import flash42.util.ArrayUtilities;

	private var _aDominoes:Array;

	public function get setDeck ():Array {
		return _aDominoes;
	}

	public function DominoSet () {
		_aDominoes = new Array();
		reset ();
	}

	public function reset ():void {
		for (var i:Number = 0; i < _aDominoes.length; i++) {
			_aDominoes.shift ();
		}

		// Specify the names of the Dominoes for stuffing into the Dominoes array later.
		var _aDominoNames:Array = ["00", "01", "02", "03", "04", "05", "06", "11", "12", "13", "14", "15", "16", "22", "23", "24", "25", "26", "33", "34", "35", "36", "44", "45", "46", "55", "56", "66"];

		// Create a 28-domino "double-six" setDeck array. Each element is an object that contains
		// properties for: the dominoes's counter value low side, high side, double, and domino's name, 
		// and display name. The display name combines the domino's low side and high side
		// single string for display to the user.
		for (var i:Number = 0; i < 7; i++) {
			for (var j:Number = 0; j < 7; j++) {
				_aDominoes.push (new Domino(i, j, _aDominoNames[i]));
			}
			}
		}
	

	public function shuffle ():void {
		var aShuffled:Array = ArrayUtilities.randomize(_aDominoes);
		for (var i:Number = 0; i < aShuffled.length; i++) {
			_aDominoes[i] = aShuffled[i];
		}
	}

	public function push (oParameter:Object):void {
		_aDominoes.push (oParameter);
	}

}

class DominoHand {
	import flash42.util.NumberUtilities;
	import flash42.util.ArrayUtilities;

	private var _domSet:DominoSet;
	private var _aHand:Array;

	public function get hand ():Array {
		return _aHand;
	}

	public function get length ():uint {
		return _aHand.length;
	}

	// When a new domino player is created by way of its constructor, pass it
	// a reference to the domino setDeck, and give it a unique player ID.
	public function DominoHand (domSet:DominoSet) {
		_aHand = new Array();
		_domSet = domSet;
	}

	public function getDominoAt (nIndex:uint):Domino {
		return _aHand[nIndex];
	}


	public function discard ():Array {
		var aDominoes:Array = new Array();
		for (var i:Number = 0; i < arguments.length; i++) {
			aDominoes.push (_aHand[arguments[i]]);
			_domSet.push (_aHand[arguments[i]]);
		}
		for (var i:Number = 0; i < arguments.length; i++) {
			_aHand.splice (arguments[i], 1);
		}
		return aDominoes;
	}

	public function draw (nDraw:Number = 1):void {

		// Add the specified number of Dominoes to the hand.
		for (var i:uint = 0; i < nDraw; i++) {
			_aHand.push (_domSet.setDeck.shift());
		}

	}

}