package 
{
	import flash.display.Sprite;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class DrawSix extends Sprite
	{
		var domBox:Sprite = new Sprite();
		var bigBox:Sprite = new Sprite();
		
		public function DrawSix()
		{
			domBox.graphics.beginFill(0xFFFFFF);
			domBox.graphics.drawRoundRectComplex(0, 0, 100, 100, 10, 10, 10, 10);
			domBox.graphics.endFill();
			this.addChild(domBox);
			var six:Sprite = new Sprite(); 
			six.graphics.beginFill(0x000000);
			for (var i:int = 0; i < 2; i++) 
			{	for (var j:int = 0; j < 3; j++) 
				{
					six.graphics.drawCircle(20+(i*60), 20+(j*30), 10);

				}
			}domBox.addChild(six);
			bigBox.graphics.beginFill(0xFFFFFF);
			bigBox.graphics.drawRoundRectComplex(0, 100, 100, 100, 10, 10, 10, 10);
			bigBox.graphics.endFill();
			this.addChild(bigBox);
			var a:Sprite = new Sprite();
			var b:Sprite = new Sprite();
			var c:Sprite = new Sprite();
			var d:Sprite = new Sprite();
			var e:Sprite = new Sprite();
			var f:Sprite = new Sprite();
			var g:Sprite = new Sprite();
			
			a.graphics.beginFill(0x000000);
			a.graphics.drawCircle(20, 120, 10);
			b.graphics.beginFill(0x000000);
			b.graphics.drawCircle(80, 120, 10);
			c.graphics.beginFill(0x000000);
			c.graphics.drawCircle(20, 150, 10);
			d.graphics.beginFill(0x000000);
			d.graphics.drawCircle(50, 150, 10);
			e.graphics.beginFill(0x000000);
			e.graphics.drawCircle(80, 150, 10);
			f.graphics.beginFill(0x000000);
			f.graphics.drawCircle(20, 180, 10);
			g.graphics.beginFill(0x000000);
			g.graphics.drawCircle(80, 180, 10);
/*			six.graphics.drawCircle(24, 4, 10);
			six.graphics.drawCircle(44, 4, 10);
			six.graphics.drawCircle(4, 24, 10);
			six.graphics.drawCircle(24, 24, 10);
			six.graphics.drawCircle(44, 24, 10);
*/						
			bigBox.addChild(a);
			bigBox.addChild(b);
			bigBox.addChild(c);
//			bigBox.addChild(d);
			bigBox.addChild(e);
			bigBox.addChild(f);
			bigBox.addChild(g);			
		}
		



	}
	
}