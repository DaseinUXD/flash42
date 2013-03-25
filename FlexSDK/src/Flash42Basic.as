package {
	import flash.display.*;
	import flash.events.*;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.geom.Point;
	import flash.geom.PerspectiveProjection;
	
	
	
	import Domino_mc;
//	import Domino;
//	import DominoLoader;
//	import DominoPull;

	
	
	public class Flash42Basic extends MovieClip {
		// game constants
		private static const rowNum:uint = 4;
		private static const colNum:uint = 7;
		private static const dominoHorizontalSpacing:Number = 100; // 174
		private static const dominoVerticalSpacing:Number = 48;  // 104
		private static const boardOffsetX:Number = 350;
		private static const boardOffsetY:Number = 450;
		// rotation values for player positions
		private static const rotNorth:uint = 90; // player partner
		private static const rotSouth:uint = 270;  // player
		private static const rotEast:uint = 0;  // player right of player
		private static const rotWest:uint = 180;  //player left of player

		// domino hands
		private var southHand:Array;
			private var dominoS1:Domino_mc; // South player's hand domino 1
			private var dominoS2:Domino_mc;
			private var dominoS3:Domino_mc;
			private var dominoS4:Domino_mc;
			private var dominoS5:Domino_mc;
			private var dominoS6:Domino_mc;
			private var dominoS7:Domino_mc;

		private var northHand:Array;
			private var dominoN1:Domino_mc; // North player's hand domino 1
			private var dominoN2:Domino_mc;
			private var dominoN3:Domino_mc;
			private var dominoN4:Domino_mc;
			private var dominoN5:Domino_mc;
			private var dominoN6:Domino_mc;
			private var dominoN7:Domino_mc;

		private var eastHand:Array;
			private var dominoE1:Domino_mc; // East player's hand domino 1
			private var dominoE2:Domino_mc;
			private var dominoE3:Domino_mc;
			private var dominoE4:Domino_mc;
			private var dominoE5:Domino_mc;
			private var dominoE6:Domino_mc;
			private var dominoE7:Domino_mc;

		private var westHand:Array;
			private var dominoW1:Domino_mc; // West player's hand domino 1
			private var dominoW2:Domino_mc;
			private var dominoW3:Domino_mc;
			private var dominoW4:Domino_mc;
			private var dominoW5:Domino_mc;
			private var dominoW6:Domino_mc;
			private var dominoW7:Domino_mc;

	public function Flash42Basic():void {
		
		southHand = new Array();
		northHand = new Array();
		eastHand = new Array();
		westHand = new Array();
		
		// create array for vertical points counter
		var _Points:Array =["Pass", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42"];
		
		// create array for vertical trump counter
		var _Trump:Array = ["Pass", "Blanks", "Ones", "Twos", "Threes", "Fours", "Fives", "Sixes", "Doubles", "Follow Me"];
		
		// make a list of domino numbers
		var drawPile:Array = new Array();
		for(var i:uint=0;i<rowNum*colNum;i++) {
			drawPile.push(i);
		}
		
		for(var x:uint=0;x<rowNum;x++) {
			for(var y:uint=0;y<colNum;y++) {
				var d:Domino_mc = new Domino_mc();
				d.stop();
				d.x = x*dominoHorizontalSpacing + boardOffsetX;
				d.y = y*dominoVerticalSpacing + boardOffsetY;
//				d.x = 100+(stage.stageWidth/2);
//				d.y = 58+(stage.stageHeight/2);
				trace(d.y, d.x);
				var r:uint = Math.floor(Math.random()*drawPile.length); //choose a domino at random
				d.dominoFace = drawPile[r]; //assign .dominoFace property to the domino at the drawPile array location of random number r
				drawPile.splice(r,1); // hide the face of the domino
//				d.gotoAndStop(d.dominoFace+2); // show the face of the dominoFace 
				var rot:uint = Math.floor(Math.random()*10)+1;
				rot = rot*17;
				d.rotation = rot;
				d.addEventListener(MouseEvent.CLICK,chooseDomino);
				addChild(d);
				}
			}
		}
	var s:uint=0;
	var n:uint=0;
	var e:uint=0;
	var w:uint=0;
			

	
			//Clicking on the domino
	public function chooseDomino(event:MouseEvent) {
		
		if (s < 7) {
			
				
		
		var sD:Domino_mc = (event.currentTarget as Domino_mc);
			trace(sD.dominoFace);
			
			southHand.push(sD.dominoFace);
			sD.gotoAndStop(sD.dominoFace+2);// turn it over
			sD.rotation = rotEast;
			sD.x = 325+(58*s);
			sD.y = 890;
			sD.removeEventListener(MouseEvent.CLICK,chooseDomino);
			s++;
			trace(southHand, sD.dominoFace, southHand.length);
			} else if (s == 7) {
				trace("South Hand",southHand);
			
		if (n < 7) {
			
				
		
		var nD:Domino_mc = (event.currentTarget as Domino_mc);
			trace(nD.dominoFace);
			
			northHand.push(nD.dominoFace);
			//nD.gotoAndStop(nD.dominoFace);// turn it over
			nD.rotation = rotWest;
			nD.x = 325+(58*n);
			nD.y = 290;
			nD.removeEventListener(MouseEvent.CLICK,chooseDomino);
			n++;
			trace(northHand, nD.dominoFace, northHand.length);
			} else if (n == 7) {
				trace("North Hand:",northHand);
		
		if (w < 7) {
			
				
		
		var wD:Domino_mc = (event.currentTarget as Domino_mc);
			trace(wD.dominoFace);
			
			westHand.push(wD.dominoFace);
			//wD.gotoAndStop(wD.dominoFace);// turn it over
			wD.rotation = rotNorth;
			wD.x = 190;
			wD.y = 415+(58*w);
			wD.removeEventListener(MouseEvent.CLICK,chooseDomino);
			w++;
			trace(westHand, wD.dominoFace, westHand.length);
			} else if (w == 7) {
				trace("West Hand:",westHand);
			
		if (e < 7) {
			
				
		
		var eD:Domino_mc = (event.currentTarget as Domino_mc);
			trace(eD.dominoFace);
			
			eastHand.push(eD.dominoFace);
			//eD.gotoAndStop(eD.dominoFace);// turn it over
			eD.rotation = rotSouth;
			eD.x = 800;
			eD.y = 415+(58*e);
			removeEventListener(MouseEvent.CLICK,chooseDomino);
			e++;
			trace(eastHand, eD.dominoFace, eastHand.length);
			} else if (e == 7) {
				trace("East Hand:",eastHand);}
			}
			}
	
		
		}
	}
	
		
	
/*			dominoS.rotation = rotSouth;
			dominoS.x = 0;
			dominoS.y = 700;
			dominoS2 = thisDomino;
			dominoS2.gotoAndStop(thisDomino.dominoFace+2);
			southHand[1] = dominoS2;
			dominoS2.rotation = rotSouth;
			dominoS2.x = 80;
			dominoS2.y = 700;*/
			
			
			
//		} else if (domino1S == thisDomino) {
//			domino1S.gotoAndStop(1);
//			domino1S = null;*/
//		}
/*	public function buildHand(event:MouseEvent) {
		
		var playerHand:Array = new Array();
		for (var i:uint=0;7;i++) {
			playerHand.push(i);
		}
		trace(playerHand.length);
	}*/
	}

}