/* ***********************************************************************
AS3 Class for Flash CS4+ by Doug Ensley of http://www.flashandmath.com/
Last modified: November 20, 2010

DominoSet class
Adapted by Mark W. Matthews
Last modified: February 21, 2013
************************************************************************ */
package  {
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	
	import Domino;
	
	public class DominoSet extends Sprite 
	{
		/*The Vector class lets you access and manipulate a vector — an array whose elements all have the same data type.
		The data type of a Vector's elements is known as the Vector's base type. The base type can be any class, 
		including built in classes and custom classes. The base type is specified when declaring a Vector variable as 
		well as when creating an instance by calling the class constructor.
		
		As with an Array, you can use the array access operator ([]) to set or retrieve the value of a Vector element.
		Several Vector methods also provide mechanisms for setting and retrieving element values. 
		These include push(), pop(), shift(), unshift(), and others. The properties and methods of a Vector 
		object are similar — in most cases identical — to the properties and methods of an Array. 
		In most cases where you would use an Array in which all the elements have the same data type, 
		a Vector instance is preferable. However, Vector instances are dense arrays, meaning it must have 
		a value (or null) in each index. Array instances don't have this same restriction.

		The Vector's base type is specified using postfix type parameter syntax. Type parameter syntax 
		is a sequence consisting of a dot (.), left angle bracket (<), class name, then a right angle bracket (>)*/
		
		private var arrDominoes:Vector.<Domino>;
			// constructor code
		public function DominoSet() 
		{
			arrDominoes = new Vector.<Domino>()
			arrDominoes = arr.concat();
			initialSetDominoes();
		}
		
		private function initialSetDominoes():void 
		{
			var i:int;
			
			for (i=0; i<arrDominoes.length; i++)
			{
				arrDominoes[i].x = 0;
				arrDominoes[i].y = 0;
				arrDominoes[i].z = 0;
				this.addChildAt(arrDominoes[i],i);
			}
		}
			//sets the depth level to match the array order for the dominoes in the set
		private function setDominoes():void
		{
			var i:int;
			
			while (this.numChildren > 0)
			{
				this.removeChildAt(0);
			}
			
			for (i=0; i<arrDominoes.length; i++)
			{
				this.addChildAt(arrDominoes[i],i);
			}
		}
		//getDominoArray allows user to gain access to all Domino objects
		public function getDominoArray():Vector.<Domino>
		{
			return arrDominoes.concat();
		}
		
		//getDominoAt allows user to gain access to one particular Domino object
		public function getDominoAt(i:int):Domino
		{
			return Domino(arrDominoes[i]);
		}
		
		//removeDominoAt allows user to remove (and return) a Domino object
		public function removeDominoAt(i:int):Domino
		{
			var dom:Domino = arrDominoes.splice(i,1)[0];
			setDominoes();
			return dom;
		}
		
		//addDominoAt allows user to add a Domino object from this DominoSet
		public function addDominoAt(dom:Domino, i:int):void
		{
			arrDominoes.splice(i,0,dom);
			setDominoes();
		}
		
		//moveDomino allows user to move a Domino object
		public function moveDomino(from:int, to:int):void
		{
			var thisDOM:PlayingCard = removeDominoAt(from);
			addDominoAt(thisDOM,to);
		}
		
		public function reverseSet():void
		{
			arrDominoes.reverse();
			setDominoes();
		}
		
		//getDominoIndex returns the index of a particular Domino object in the array(Vector)
		public function getDominoIndex(dom:Domino):int
		{
			return arrDominoes.indexOf(dom);
		}
		
		//Return the number of dominoes in this DominoSet
		public function get numDominoes():int
		{
			return arrDominoes.length;
		}
		

	}
	
}
