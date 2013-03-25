package  
{

	
	/**
	 * ...
	 * @author Mark W. Matthews
	 */
	public class domino_back extends Dominosp_bk 
	{
		
		public function domino_back() 
		{
			trace(name);
			addChild(new Dominosp_bk());
			this.x = 100;
			this.y = 100;
			
			
		}
		
	}

}