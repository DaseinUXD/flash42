package {
	import flash.display.*;
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
		private static const rNorth:uint = 90; // player partner
		private static const rSouth:uint = 270;  // player right of player partner
		private static const rEast:uint = 0;  // playerr
		private static const rWest:uint = 180;  //player left of player

		

	public function Texas42():void {
		
		// make a list of domino numbers
		var dropPile:Array = new Array();
		for(var i:uint=0;i<rowNum*colNum;i++) {
			dropPile.push(i);

		}
		
		for(var x:uint=0;x<rowNum;x++) {
			for(var y:uint=0;y<colNum;y++) {
				var d:Domino = new Domino();
				d.stop();
				d.x = x*dominoHorizontalSpacing + boardOffsetX;
				d.y = y*dominoVerticalSpacing + boardOffsetY;
				var r:uint = Math.floor(Math.random()*dropPile.length);
				d.cardface = dropPile[r];
				dropPile.splice(r,1);
				d.gotoAndStop(d.cardface+2);
				var rot:uint = Math.floor(Math.random()*10)+1;
				rot = rot*27;
				d.rotation = rot;
				addChild(d);
				}
			}
		}
	}
}