package 
{
	import flash.display.MovieClip;
	import Dominosp_66;
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class Domino_sixsix extends MovieClip
	{
		private var domino:Dominosp_66;
		public function Domino_sixsix() 
		{
			
			trace("im a modal instance", name);
			domino = new Dominosp_66;
			addChild(Dominosp_66);
		}
		
	}

}