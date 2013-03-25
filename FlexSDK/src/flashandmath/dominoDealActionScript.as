/*
Flash CS4+ AS3 tutorial by Doug Ensley.

http://www.flashandmath.com/

Last modified: December 5, 2010
*/

/*The domino images used in our example were created by Jesse Fuchs and Tom Hart from free SVG images created by David Bellot, 
and are themselves available for use under a Creative Commons License.
********************

dominoDeal
*** adapted by Mark W. Matthews
*********************************/

// Load the custom classes for working with dominoes
import Domino;
import DominoLoader;

// Align buttons and make "deal button" visible 
btnRepeat.x = btnPull.x;
btnRepeat.y = btnPull.y;
btnPull.visible = false;
btnRepeat.visible = false;

txtOutput.wordWrap=true;
txtOutput.mouseEnabled=false;
txtOutput.text="Loading images. Please wait...";

/* 
Create a board that we can attach all objects to. This will allow us to move the effect easily to different parts of the stage, if desired.
*/
var board:Sprite = new Sprite();
board.x = 50;
board.y = 110;
addChild(board);

// Array to hold loaded dominoes and a separate array for the shuffled set:
var arrDominoes:Array = [ ];
var arrSet:Array = new Array(28);

// Variables for things that will need to be referenced in multiple functions:
var topDomino:Domino;
var dominoLdr:DominoLoader;  

// turnRadius is radius of the semicircular path followed by y and z coordinates of each domino when pulled.
var turnRadius:Number = 150;

// The domino will move in "turnSteps" many steps over a "turnTime" millisecond period.
var turnSteps:Number = 16;
var turnTime:Number = 400;

// Between dominoes pulled there is a slight pause of this many milliseconds:
var delayTime:Number = 200;

// A global variable counts the number of dominoes pulled so we know when to stop:
var numPulled:int = 0;

// Each domino will have the same perspective projection values set.
var pp:PerspectiveProjection = new PerspectiveProjection();
pp.fieldOfView=20;
pp.projectionCenter=new Point(0,0);

// The makeDominoes function sets up file names that correspond to the files in the "dominoes-50" subfolder located in the same folder as this fla source file.  
makeDominoes();

function makeDominoes():void {
	var arrSide0:Array = ["00","01","02","03","04","05","06","11","12","13","14","15","16","22","23","24","25","26","33","34","35","36","44","45","46","55","56","66"];
//	var arrSide1:Array = ["0","1","2","3","4","5","6"];
	var arrDominoStrings:Array = new Array(28);
	var i:int; //, j:int;
	
	// Fill arrDominoStrings with the 28 file names for the domino faces
/*	for (i=0; i<7; i++) {
		for (j=0; j<7; j++) {
			arrDominoStrings[7*i+j] = "dominoes-50/"+arrSide0[j]+arrSide1[i]+"-50.png";
		}
	}
*/
	for (i=0; i<28; i++) {
		arrDominoStrings[i] = "dominoes-50/"+arrSide0[i]+"-50.png";
	}
	
	/* 
	DominoLoader object is constructed with an array of file names of domino faces 
	and a single file name for the domino back
	*/
	dominoLdr = new DominoLoader(arrDominoStrings,"dominoes-50/txback-50.png");
	dominoLdr.addEventListener(DominoLoader.DOMINOES_LOADED, loadComplete);
	dominoLdr.addEventListener(DominoLoader.LOAD_ERROR, loadError);
}

// Called when all domino image files have completely loaded. Primarily calls the setupPile function, defined further below.
function loadComplete(e:Event):void {
	setupPile();
	
	btnPull.visible = true;
	
	dominoLdr.removeEventListener(DominoLoader.DOMINOES_LOADED, loadComplete);
	dominoLdr.removeEventListener(DominoLoader.LOAD_ERROR, loadError);
	
	txtOutput.text="";
	
	txtOutput.visible=false;
}

// Actions to take if there is a file error:
function loadError(e:Event):void {
	txtOutput.text="Error loading images. The server may be busy. Try refreshing the page.";
	dominoLdr.removeEventListener(DominoLoader.DOMINOES_LOADED, loadComplete);
	dominoLdr.removeEventListener(DominoLoader.LOAD_ERROR, loadError);
}

// Set up the pile of dominoes by "shuffling" the loaded dominoes
function setupPile():void {
	var i:int;
	var r:int;
	var dom:Domino;
	
	// Remove all current children of board
	while (board.numChildren>0) {
		board.removeChildAt(0);
	}
	
	// arrSet is initially empty. arrDominoes is initially the array of 
	//   Domino objects from the DominoLoader object dominoLdr
	arrSet = new Array(28);
	arrDominoes = (dominoLdr.getDominoArray()).concat();
	
	// Remove random dominoes from arrDominoes and place them on arrSet. 
	//   Each is set to be initially facedown.
	for (i=0; i<28; i++) {
		r = Math.floor(arrDominoes.length * Math.random());
		dom = arrDominoes.splice(r,1)[0] as Domino;
		
		dom.makeFaceDown();
		dom.transform.perspectiveProjection=pp;
		board.addChild(dom);
		
		// Position each domino
		dom.x = 0;
		dom.y = 0;
		dom.z = 0;
		
		arrSet[i] = dom;
	}
}

/* 
Timers for managing the animation. The first timer manages the turn, and the second timer provides a delay between dominos dealt.
*/
var tmTurn:Timer = new Timer(turnTime/turnSteps,turnSteps);
tmTurn.addEventListener(TimerEvent.TIMER, tmTurn_Move);
tmTurn.addEventListener(TimerEvent.TIMER_COMPLETE, tmTurn_Done);

var tmDelay:Timer = new Timer(delayTime,1);
tmDelay.addEventListener(TimerEvent.TIMER_COMPLETE, tmDelay_Done);

// This is the main function that handles all motion on each Timer "tick."
function tmTurn_Move(te:TimerEvent):void {
	// r is an angle (degrees) measure between 0 and 180, and ang is equivalent radian measure 
	var r:Number = tmTurn.currentCount/turnSteps*180;
	var ang:Number = r*Math.PI/180;
	
	// x coordinate moves in a line, y and z move in a sine-curve arc
	topDomino.x = (150+35*numPulled)*r/180;
	topDomino.y = turnRadius*Math.sin(ang);
	topDomino.z = -1.5*turnRadius*Math.sin(ang);
	
	// Rotate about the horizontal axis
	topDomino.rotateView(180-r,"horizontal");
}

// When the turning timer is finished, we start the delay timer, which has no TIMER handler because its job is to fire exactly once.
function tmTurn_Done(te:TimerEvent):void {
	/* Calling this method sets the topDomino to be truly "face up" so the 
	domino "knows" its own orientation for possible subsequent actions.
	*/
	topDomino.makeFaceUp();
	
	tmDelay.reset();
	tmDelay.start();
}

/* When the delay timer is finished (firing exactly once), 
we set up for the next domino to be dealt until there are five. */

function tmDelay_Done(te:TimerEvent):void {
	
	if (numPulled < 7) {
		
		numPulled++;
		
		/* Remove new top domino from arrSet and ensure the topDomino is above 
		(in the display list) all else on the board. */
		topDomino = arrSet.splice(arrSet.length - 1,1)[0];
		board.setChildIndex(topDomino,board.numChildren-1);
		
		// Start the turning timer
		tmTurn.reset();
		tmTurn.start();
	}
	else {
		// Show the "Shuffle" button once all 7 dominoes are pulled.
		btnRepeat.visible = true;
	}
}

// Handler for a click on the "Deal 5" button
btnPull.addEventListener(MouseEvent.CLICK, dealUp);

function dealUp(me:MouseEvent):void {
	btnPull.visible = false;
	numPulled++;

	/* Remove new top domino from arrSet and ensure the topDomino is above 
	(in the display list) all else on the board. */
	topDomino = arrSet.splice(arrSet.length - 1,1)[0];	
	board.setChildIndex(topDomino,board.numChildren-1);
	
	// Start the turning timer
	tmTurn.reset();
	tmTurn.start();
}

btnRepeat.addEventListener(MouseEvent.CLICK, reset);

function reset(me:MouseEvent):void {
	numPulled = 0;
	setupPile();
	btnRepeat.visible = false;
	btnPull.visible = true;
}