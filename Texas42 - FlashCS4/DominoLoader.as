/* ***********************************************************************
AS3 Class for Flash CS4+ by Doug Ensley of http://www.flashandmath.com/
Last modified: November 20, 2010

ImageLoader class by Barbara Kaskosz of Flash and Math

DominoLoader class

Adapted by Mark W. Matthews
Last modified: February 28, 2013
************************************************************************ */

package  
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	
	// Will use custom class, ImageLoader to load a list of bitmaps at runtime
	import ImageLoader;
		
	public class DominoLoader extends Sprite
	{
		private var imgLoader:ImageLoader;
		private var arrDominoes:Array;
		
		public static const DOMINOES_LOADED:String = "imgsLoaded";
		public static const LOAD_ERROR:String = "loadError";

		public function DominoLoader(arrImages:Array, stBackFile:String) 
		{
			// constructor code
			arrDominoes = new Array();
			imgLoader = new ImageLoader();
			imgLoader.addEventListener(ImageLoader.LOAD_ERROR,errorLoading); // refs ImageLoader custom class
			imgLoader.addEventListener(ImageLoader.IMGS_LOADED,allLoaded); // refs ImageLoader custom class
			imgLoader.loadImgs(arrImages.concat([ stBackFile ])); // ?????
		}
		
		private function errorLoading(e:Event):void
		{
			dispatchEvent(new Event(DominoLoader.LOAD_ERROR));
		}
		
		private function allLoaded(e:Event):void
		{
			makeDominoes();
		}
		
		private function makeDominoes():void
		{
			var arrImages:Array = imgLoader.bitmapsArray; // refs ImageLoader custom class
			var n:int = arrImages.length - 1;
			var i:int;
			
			for (i = 0; i < n; i++) {
				arrDominoes[i] = new Domino(arrImages[i].bitmapData, arrImages[n].bitmapData);
			}
			
			for (i = 0; i < arrDominoes.length; i++) {
				arrDominoes[i].x = 15*i;
				arrDominoes[i].y = 0;
				this.addChildAt(arrDominoes[i],i);
			}
			dispatchEvent(new Event(DominoLoader.DOMINOES_LOADED));
		}
		
		// getDominoArray allows the user to gain access to all Domion objects in this DominoSet object.
		
		public function getDominoArray():Array
		{
			return arrDominoes;
		}
		
		// getDominoAt allows the user to gain access to one particular Domino object.
		public function getDominoAt(i:int):Domino
		{
			return Domino(arrDominoes[i]);
		}
		
		// getDominoIndex returns the index of a particular Domino object in the DominoSet
		public function getDominoIndex(dom:Domino):int
		{
			return arrDominoes.indexOf(dom);
		}
		
		// Return the number of dominoes in this DominoSet
		public function numDominoes():int
		{
			return arrDominoes.length;
		}

	}
	
}
