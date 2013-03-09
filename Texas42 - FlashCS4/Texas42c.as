package {
	import flash.display.*;
	import flash.events.*;
/*	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	
	public class PlayBoard extends Sprite {
		
		private var boardWidth:Number;
		private var boardHeight:Number;
		private var colorBack:Number;
		private var colorBorder:Number;
	
	}
		
	public function PlayBoard(w:Number, h:Number) {
		this.boardWidth=w;
		this.boardHeight=h;
		this.colorBack=0x1a722d;
		this.colorBorder=0xFFFFFF;
		drawBack();
//		setUpListenert();
	}

	var board:PlayBoard=new PlayBoard(800,800);

	public function drawBack():void {
		this.graphics.clear();
		this.graphics.linestyle(1,colorBorder);
		this.graphics.beginFill(colorBack);
		this.graphics.drawRect(0, 0, boardWidth, boardHeight);
		this.graphics.endFill();
		this.filters = [ new DropShadowFilter() ];
	}*/
				
	
	public class Texas42 extends MovieClip {
		// game constants
		private static const rowNum:uint = 4;
		private static const colNum:uint = 7;
		private static const dominoHorizontalSpacing:Number = 150; // 174
		private static const dominoVerticalSpacing:Number = 100;  // 104
		private static const boardOffsetX:Number = 200;
		private static const boardOffsetY:Number = 100;
		// rotation values for player positions
		private static const rotNorth:uint = 90; // player partner
		private static const rotSouth:uint = 270;  // player
		private static const rotEast:uint = 0;  // player right of player
		private static const rotWest:uint = 180;  //player left of player

		// domino hands
		private var domino1S:Domino; // player's hand domino 1
		private var domino2S:Domino;
		private var domino3S:Domino;
		private var domino4S:Domino;
		private var domino5S:Domino;
		private var domino6S:Domino;
		private var domino7S:Domino;
		
		private var playerHand:Array = new Array();
		
	public function Texas42():void {
		
		// make a list of domino numbers
		var drawPile:Array = new Array();
		for(var i:uint=0;i<rowNum*colNum;i++) {
			drawPile.push(i);

		}
		
		for(var x:uint=0;x<rowNum;x++) {
			for(var y:uint=0;y<colNum;y++) {
				var d:Domino = new Domino();
				d.stop();
				d.x = x*dominoHorizontalSpacing + boardOffsetX;
				d.y = y*dominoVerticalSpacing + boardOffsetY;
				var r:uint = Math.floor(Math.random()*drawPile.length); //choose a domino at random
				d.dominoFace = drawPile[r]; //assign .dominoFace property to the domino at the drawPile array location of random number r
				drawPile.splice(r,1); // hid the face of the domino
				//d.gotoAndStop(d.dominoFace+2); // show the face of the dominoFace 
				var rot:uint = Math.floor(Math.random()*10)+1;
				rot = rot*27;
				d.rotation = rot;
				d.addEventListener(MouseEvent.CLICK,clickDomino);
				addChild(d);
				}
			}
		}
	//Clicking on the domino
	public function clickDomino(event:MouseEvent) {
		var thisDomino:Domino = (event.currentTarget as Domino);
		trace(thisDomino.dominoFace);
		
		if (domino1S == null) { // first domino chosen
			domino1S = thisDomino; // note it
			domino1S.gotoAndStop(thisDomino.dominoFace+2); // turn it over
			domino1S.rotation = rotSouth;
			domino1S.x = 0;
			domino1S.y = 700;
		} else if (domino1S == thisDomino) {
			domino1S.gotoAndStop(1);
			domino1S = null;
		}
	}
	}
}