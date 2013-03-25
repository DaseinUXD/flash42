package  
{
	
	import org.aswing.*;
	import org.aswing.border.*;
	import org.aswing.geom.*;
	import org.aswing.colorchooser.*;
	import org.aswing.ext.*;

	
	/**
	 * ...
	 * @author Mark W. Matthews
	 * BidStepper
	 */
	public class BidStepper extends Form
	{
		//members define
		private var bidLabel:JLabel;
		private var bidStepper:Jstepper;
		
		public function BidStepper() 
		{
				public function BiddingForm()
				{
					//component creation
					setLocation(new IntPoint(50, 50));
					setSize(new IntDimension(80, 70));
					
					bidLabel = new JLabel();
					bidLabel.setName("Enter Bid");
					bidLabel.setFont(new ASFont("Rockwell", 24, false, false, false, false));
					bidLabel.setLocation(new IntPoint(0, 0));
					bidLabel.setSize(new IntDimension(80, 31));
					bidLabel.setText("Bid");
					bidLabel.setHorizontalTextPosition(AsWingConstants.LEFT);
					
					bidStepper = new JStepper();
					bidStepper.setName("Bid");
					bidStepper.setFont(new ASFont("Rockwell", 14, false, false, false, false));
					bidStepper.setLocation(new IntPoint(0, 0));
					bidStepper.setSize(new IntDimension(400, 24));
					bidStepper.setToolTipText("Select your bid");
					bidStepper.setOrientation(AsWingConstants.VERTICAL);
					bidStepper.setColumns(2);
					
					//component layoution
					append(bidLabel);
					append(bidStepper);
		
				}
	
			//_________getters_________
	
	
			public function getBidStepper():JStepper
			{
				return bidStepper;
			}
				
		}
	}
}