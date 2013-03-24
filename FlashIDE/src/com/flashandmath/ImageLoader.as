/* ***********************************************************************
ActionScript 3 originally created by Barbara Kaskosz
http://www.flashandmath.com/

ImageLoader class

adapted by Mark W. Matthews
Last modified: February, 28, 2013
************************************************************************ */
package
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	/*
	Extending the EventDispatcher class jcontained in the flash.events package.  Any instance of a
	subclass of EventDispatcher is capable of dispatching custom events.  Many of AS3 built-in classes are
	subclasses of the EventDispatcher class, for example, the Sprite class and other DisplayObjects.
	*/
	
	//Use custom class ImageLoader to load a list of bitmaps for domnioes at runtime
	
	public class ImageLoader extends EventDispatcher
	{
		/*
		Defining constants corresponding to the two custom events.
		Similarly as for built-in events, later when adding listeners to instances of 
		ImageLoader, can refer to the events by the names of the constants,
		(e.g., ImageLoader.IMGS_LOADED), or by their string value (e.g., 'imgsLoaded').
		*/
		public static const IMGS_LOADED:String = "imgsLoaded";
		public static const LOAD_ERROR:String = "loadError";
		
		private var loadersArray:Array;
		
		private var numImgs:int;
		
		private var numLoaded:int;
		
		private var isError:Boolean;
		
		private var _bitmapsArray:Array;
		
		private var loadCanRun:Boolean;

		public function ImageLoader()
		{
			// the constructor of the class sets the value of 'loadCanRun' variable only
			// It is the method 'loadImgs' below that performs all the main tasks.
			
			this.loadCanRun=true;
		}
			
			
	 /*
	 'loadImgs' method takes an array of strings as a parameter. For the method
	  to function properly, the strings should represent addresses of the image files
	  to be loaded. The method listens for IO (input/output) loading errors. (For example,
	  the server is too busy and the file appears non-existent.) The method does not listen
	  to FlashPlayer security errors. We assume that the image files are at locations
	  that do not violate the security settings of the swf file that uses ImageLoader.
	 */
	 		public function loadImgs(imgsFiles:Array):void
			{
				if(loadCanRun)
				{
					loadCanRun = false;
					
					//the counter variable counting how many images have been loaded
					numLoaded = 0;
					
					//the variable that remembers the current error status.					
					isError = false;
					
					//the number of images to be loaded.					
					numImgs = imgsFiles.length;
					
					//the array of bitmaps, each representing a loaded image.
					_bitmapsArray = [];
					
					/*
					For each image file, we will use a separete instance of the Loader class.
					That is because we will be loading images **simultaneously** rather than consecutively.
					***Consecutive loading is easier to code but it causes visible delays.***
					In the loop that follows, we populate the array of Loaders and attach
					listeners to each Loader. One listens to an image finishing loading, the other
					to an occurance of a loading error. Then we evoke the 'load' method for each Loader
					with the address of the corresponding image.
					*/
					
					loadersArray = [];
					
					for (var i:int = 0; i < numImgs; i++)
					{
						loadersArray[i] = new Loader();
						loadersArray[i].contentLoaderInfo.addEventListener(Event.COMPLETE, imgLoaded);
						loadersArray[i].contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorOccured);
						loadersArray[i].load(new URLRequest(imgsFiles[i]));
					}
				}
			}
			private function imgLoaded(e:Event):void
			{
				/*
				When any of the images finishes loading, the count is incresed by 1
				and the function 'checkLoadStatus' is called.  The function checks iff all the images
				have been loaded successfully.
				*/
				numLoaded += 1;
				checkLoadStatus();
				
			}
			/*
			if a loading error occurs with any of the images, the function 'errorOcurred' runs
			the function dispatches one of the custom events: ImageLoader.LOAD_ERROR.
			Note the syntax when dispatching a custom event.
			*/
			
			private function errorOccured(e:IOErrorEvent):void
			{
				isError = true;
				dispatchEvent(new Event(ImageLoader.LOAD_ERROR));
			}
			
			/*
			The 'checkLoadStatus' function runs each time an image is completely loaded.
			If the number of images loaded is equal to the total number of images to be
			loaded, the function dispatches the custom event: ImageLoader.ALL_LOADED.
			Then the function removes all the listeners and clears Loaders which we no longer
			need as the images have been stored by the function in _bitmapsArray.
			If all the images have been loaded successfully, loadCanRun is set to 'true'
			so the 'loadImgs' method can be called again for a different set of images.
			*/

			private function checkLoadStatus():void
			{
				var i:int;
				
				if(numLoaded==numImgs && isError==false)
				{
					for(i=0; i<numImgs; i++)
					{
						_bitmapsArray[i] = Bitmap(loadersArray[i].content);
					}
					for(i=0;i<numImgs;i++)
					{
						loadersArray[i].contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, errorOccured);
						
						loadersArray[i].contentLoaderInfo.removeEventListener(Event.COMPLETE, imgLoaded);
						
						loadersArray[i]=null;

					}
					loadersArray=[];
					
					loadCanRun = true;
					
					dispatchEvent(new Event(ImageLoader.IMGS_LOADED));
					
				}
			}
				/*
				in order for 'bitmapsArray' to act as a public, read-only property define the getter
				method without defing the setter.
				*/
				
				
			public function get bitmapsArray():Array
			{
				return _bitmapsArray;
			}

		}

	
	
}
