﻿package com.efg.framework
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import mochi.as3.*;
	
	public class GameFrameWork extends MovieClip {
		
		public static const EVENT_WAIT_COMPLETE:String = "wait complete";
		
		//added in chapter 11
		
		public static const KEY_MUTE:int = 77;  // added chapter 11
		public static const KEY_PAUSE:int = 80; //added chapter 11 
		public var paused:Boolean = false;
		public var pausedScreen:BasicScreen; 
		
		public var systemFunction:Function;
		public var currentSystemState:int;
		public var nextSystemState:int;
		public var lastSystemState:int;

		public var appBackBitmapData:BitmapData; 
		public var appBackBitmap:Bitmap; ;
		
		public var frameRate:int; 
		public var timerPeriod:Number; 
		public var gameTimer:Timer;
		
		public var titleScreen:BasicScreen; 
		public var gameOverScreen:BasicScreen; 
		public var instructionsScreen:BasicScreen; 
		public var levelInScreen:BasicScreen; 
		public var scoreBoard:ScoreBoard; 
		
		
		public var scoreBoardTextFormat:TextFormat;
		public var screenTextFormat:TextFormat;
		public var screenButtonFormat:TextFormat;
		
		public var levelInText:String;
		
		public var soundManager:SoundManager;
	
		//chapter 11 added
		public var frameCounter:FrameCounter = new FrameCounter();
		public var lastTime:Number;
		public var timeDifference:Number
		
		//chapter 12 added\
		//Mochi
		public var mochiGameId:String;
		public var mochiBoardId:String;
		public var lastScore:Number;
		
		//Game is our custom class to hold all logic for the game. 
		public var game:Game;
		
		
		
		//waitTime is used in conjunction with the STATE_SYSTEM_WAIT state
		// it suspends the game and allows animation or other processing to finish
		public var waitTime:int;
		public var waitCount:int = 0;
		
		//added chapter 11
		
		
		public var frameRateProfiler:FrameRateProfiler;
		
		//**added chapter 12 for preloader
		public var preloaderStarted:Boolean=false;
		public var preloadString:String=new String();
		public var preloadScreen:BasicScreen;
		
		/*
		the constructor for GameFrameWork.as does not contain any code.  it is 
		simply a placeholder.  We will subclass GameFrameWork.as to create the
		unique Main.as for each game.  The Main.as constructor will contain code
		to call the init function override.
		*/
		
		// Our construction only calls init(). This way, we 
		// can re-init the entire system if necessary
		public function GameFrameWork() {
			
			soundManager = new SoundManager(); // moved
		}
		
		//function added in chapter 11
		public function addedToStage(e:Event = null):void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownListener);
			this.focusRect=false; // added chapter 11 
			stage.focus = stage; // added chapter 11
			
			
			trace("gamFrameWork added to stage");
		}
		
		
		// init() is used to set up all of the things that we should only need to do one time
		public function init():void {
			trace("inner init");
			
		}
		
		public function frameRateProfileComplete(e:Event):void {
			
		}
		
		//*** function added chapter 12
		private function systemPreload():void {
			if (!preloaderStarted) {
				trace("preload started");
				preloadScreen.setDisplayText("Loading: 0%"); //Changed chapter 12
				addChild(preloadScreen)
				//this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, preloadProgress);
				//this.loaderInfo.addEventListener(Event.COMPLETE, preloadComplete);
				preloaderStarted=true;
			}else{
				
				var percentLoaded:int=(this.loaderInfo.bytesLoaded/this.loaderInfo.bytesTotal)*100;
				trace(percentLoaded);
				preloadString="Loading: "+percentLoaded+"%";
				preloadScreen.setDisplayText(preloadString);
				if (percentLoaded >99) {
					trace(">99");
					this.play();
				}
				
				if (currentFrame==3) {
					trace("frame == 3")
					addSounds();
					
					removeChild(preloadScreen);
					nextSystemState = FrameWorkStates.STATE_SYSTEM_TITLE;
					switchSystemState(nextSystemState);
				}
				
			}
			
		}
		
		public function addSounds():void {
			//stub only needed in IDE preloading
		}
		
		public function setApplicationBackGround(width:Number, height:Number, isTransparent:Boolean = false, color:uint = 0x000000):void {
			appBackBitmapData = new BitmapData(width, height, isTransparent, color);
			appBackBitmap = new Bitmap(appBackBitmapData);
			addChild(appBackBitmap);

		}
		public function startTimer(timeBasedAnimation:Boolean=false):void {
			stage.frameRate = frameRate;
			
			if (timeBasedAnimation) {
				lastTime = getTimer();
				addEventListener(Event.ENTER_FRAME, runGameEnterFrame);
			}else{
				timerPeriod = 1000 / frameRate;
				gameTimer=new Timer(timerPeriod); //*** changed removed in new chapter 2
				gameTimer.addEventListener(TimerEvent.TIMER, runGame);
				gameTimer.start();
			}
			
			
		
			
		}
		
		
		public function runGame(e:TimerEvent):void {
			

				systemFunction(); 
				frameCounter.countFrames();
			
		}
		
		public function runGameEnterFrame(e:Event):void {

				timeDifference = getTimer() - lastTime
				lastTime = getTimer();
				systemFunction(); 
				frameCounter.countFrames();
			
		}


		//switchSystem state is called only when the state is to be changed (not every frame like in some switch/case
		//based simple state machines
		
		public function switchSystemState(stateval:int):void {
			lastSystemState = currentSystemState;
			currentSystemState = stateval;
			
			trace("currentSystemState=" + currentSystemState)
			switch(stateval) {
				
				case FrameWorkStates.STATE_SYSTEM_WAIT: 
					systemFunction = systemWait;
					break;
				
				case FrameWorkStates.STATE_SYSTEM_WAIT_FOR_CLOSE:
					systemFunction = systemWaitForClose;
					break;
				
				case FrameWorkStates.STATE_SYSTEM_TITLE:
					systemFunction = systemTitle;
					break;
			
			    case FrameWorkStates.STATE_SYSTEM_INSTRUCTIONS:
					systemFunction = systemInstructions;
					break;
				
				case FrameWorkStates.STATE_SYSTEM_NEW_GAME:
					systemFunction = systemNewGame;
					break;	
				
				case FrameWorkStates.STATE_SYSTEM_NEW_LEVEL:
					systemFunction = systemNewLevel;
					break;
				
				case FrameWorkStates.STATE_SYSTEM_LEVEL_IN:
					systemFunction = systemLevelIn;
					break;
				
				case FrameWorkStates.STATE_SYSTEM_GAME_PLAY:
					systemFunction = systemGamePlay;
					break
				
				case FrameWorkStates.STATE_SYSTEM_GAME_OVER:
					systemFunction = systemGameOver;
					break;
					//*** added chapter 12
				case FrameWorkStates.STATE_SYSTEM_MOCHI_AD: 
					systemFunction = systemMochiAd;
					break;
					
				case FrameWorkStates.STATE_SYSTEM_MOCHI_HIGHSCORES: 
					systemFunction = systemMochiHighscores;
					break;
				case FrameWorkStates.STATE_SYSTEM_PRELOAD: 
					systemFunction = systemPreload;
					break;
				//*** end added chapter 12
			}
				
		}
		
		
		
		
		
		public function systemMochiAd():void {
			
			//format resolotion as string example: 600x400
			var resolution:String = stage.width + "x" + stage.height;
		
			
			MochiAd.showPreGameAd({clip:this, id:mochiGameId, res:resolution, ad_finished:mochiAdComplete, ad_failed:mochiAdComplete, ad_skipped:mochiAdComplete});
			switchSystemState(FrameWorkStates.STATE_SYSTEM_WAIT_FOR_CLOSE);
			nextSystemState = FrameWorkStates.STATE_SYSTEM_TITLE;
		}
		
		//*** new Function for Mochi ads chapter 12
		public  function mochiAdComplete():void {
			switchSystemState(nextSystemState);
		}
		
		//*** added chapter 12 for mochi high scores
		public  function systemMochiHighscores():void {
			var resolution:String = stage.width + "x" + stage.height;
			var o:Object = { n: [15, 15, 14, 2, 13, 14, 0, 10, 14, 2, 2, 1, 10, 7, 15, 4], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
			//var boardID:String = o.f(0,"");
			MochiScores.showLeaderboard({boardID: mochiBoardId, score: lastScore, onClose:mochiHighscoresComplete, res:resolution });
			
			switchSystemState(FrameWorkStates.STATE_SYSTEM_WAIT_FOR_CLOSE);
			nextSystemState = FrameWorkStates.STATE_SYSTEM_TITLE;
		}
		
		//*** new Function for Mochi ads chapter 12
		public  function mochiHighscoresComplete():void {
			switchSystemState(nextSystemState);
	
		}
	
	
		public function systemTitle():void {
			addChild(titleScreen);
			titleScreen.addEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener, false, 0, true);
			switchSystemState(FrameWorkStates.STATE_SYSTEM_WAIT_FOR_CLOSE);
			nextSystemState = FrameWorkStates.STATE_SYSTEM_INSTRUCTIONS;
		}
		
		
		public function systemInstructions():void {
		//	trace("system instructions");
			addChild(instructionsScreen);
			instructionsScreen.addEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener, false, 0, true);
			switchSystemState(FrameWorkStates.STATE_SYSTEM_WAIT_FOR_CLOSE);
			nextSystemState = FrameWorkStates.STATE_SYSTEM_NEW_GAME;
		}
		
		
		public function systemNewGame():void {
			addChild(game);
			game.addEventListener(CustomEventScoreBoardUpdate.UPDATE_TEXT, scoreBoardUpdateListener, false, 0, true);
			game.addEventListener(CustomEventLevelScreenUpdate.UPDATE_TEXT, levelScreenUpdateListener, false, 0, true);
			game.addEventListener(CustomEventSound.PLAY_SOUND, soundEventListener, false, 0, true);
			game.addEventListener(Game.GAME_OVER, gameOverListener, false, 0, true);
			game.addEventListener(Game.NEW_LEVEL, newLevelListener, false, 0, true);
			game.newGame();
			switchSystemState(FrameWorkStates.STATE_SYSTEM_NEW_LEVEL);
		}
		
		
		public function systemNewLevel():void {
			game.newLevel();
			switchSystemState(FrameWorkStates.STATE_SYSTEM_LEVEL_IN);
		}
		
		
		public function systemLevelIn():void {
			addChild(levelInScreen);
			waitTime = 30;
			switchSystemState(FrameWorkStates.STATE_SYSTEM_WAIT);
			nextSystemState = FrameWorkStates.STATE_SYSTEM_GAME_PLAY;
			addEventListener(EVENT_WAIT_COMPLETE, waitCompleteListener, false, 0, true);
			
		}
		
		
		public function systemGameOver():void {
			removeChild(game);
			
			addChild(gameOverScreen);
			gameOverScreen.addEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener, false, 0, true);
			
			switchSystemState(FrameWorkStates.STATE_SYSTEM_WAIT_FOR_CLOSE);
			nextSystemState = FrameWorkStates.STATE_SYSTEM_TITLE;
		}
		
		
		public function systemGamePlay():void {
			
			game.runGame();
			
			
		}
		
		
	
		public function systemWaitForClose():void {
			//do nothing
		}
		
		
		public function systemWait():void {
			waitCount++;
				if (waitCount > waitTime) {
					waitCount = 0;
					dispatchEvent(new Event(EVENT_WAIT_COMPLETE));
				}
		}

	
		public function okButtonClickListener(e:CustomEventButtonId):void {

			switch(e.id) {
				
				case FrameWorkStates.STATE_SYSTEM_TITLE:
					removeChild(titleScreen);
					titleScreen.removeEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener);
					break;
			
			    case FrameWorkStates.STATE_SYSTEM_INSTRUCTIONS:
					removeChild(instructionsScreen);
					instructionsScreen.removeEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener);
					break;					
				
				case FrameWorkStates.STATE_SYSTEM_GAME_OVER:
				
					removeChild(gameOverScreen);
					gameOverScreen.removeEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener);
					break;
				
				
			}
			trace("next system state=" + nextSystemState);
			switchSystemState(nextSystemState);
		}
		
		
		public function scoreBoardUpdateListener(e:CustomEventScoreBoardUpdate):void {
			scoreBoard.update(e.element, e.value);
		}
		
		
		public function levelScreenUpdateListener(e:CustomEventLevelScreenUpdate):void {
			levelInScreen.setDisplayText(levelInText + e.text);
		}
		
		//gameOverListener listens for Game.GAMEOVER simple custom events calls and changes state accordingly
		public function gameOverListener(e:Event):void {
			switchSystemState(FrameWorkStates.STATE_SYSTEM_GAME_OVER);
			game.removeEventListener(CustomEventScoreBoardUpdate.UPDATE_TEXT, scoreBoardUpdateListener);
			game.removeEventListener(CustomEventLevelScreenUpdate.UPDATE_TEXT, levelScreenUpdateListener);
			game.removeEventListener(CustomEventSound.PLAY_SOUND, soundEventListener);
			game.removeEventListener(Game.GAME_OVER, gameOverListener);
			game.removeEventListener(Game.NEW_LEVEL, newLevelListener);
		}
		
		//newLevelListener listens for Game.NEWLEVEL simple custom events calls and changes state accordingly
		public function newLevelListener(e:Event):void {
			switchSystemState(FrameWorkStates.STATE_SYSTEM_NEW_LEVEL);
		}
		
		public function waitCompleteListener(e:Event):void {
			switch(lastSystemState) {
				
				case FrameWorkStates.STATE_SYSTEM_LEVEL_IN:
					removeChild(levelInScreen);
					break
			}
			removeEventListener(EVENT_WAIT_COMPLETE, waitCompleteListener);
			switchSystemState(nextSystemState);
		}
		
		public function soundEventListener(e:CustomEventSound):void {
			if (e.type == CustomEventSound.PLAY_SOUND) {
				//trace("play sound");
				soundManager.playSound(e.name, e.isSoundTrack, e.loops, e.offset, e.volume );
			}else {
				soundManager.stopSound(e.name, e.isSoundTrack);
			}
		}
		
		public  function keyDownListener(e:KeyboardEvent):void { 
			
		trace("key down: " + e.keyCode);
			switch(e.keyCode) {
				case KEY_PAUSE:
					//pause key pressed
					pausedKeyPressedHandler();
					break;
				case KEY_MUTE:
					muteKeyPressedHandler();
					break;
				
			}
			
		}
		
		
		
		
		public function pausedScreenClickListener(e:Event):void {
			removeChild(pausedScreen);
			pausedScreen.removeEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener);
			trace("clicked");
			paused = false;
			stage.focus = game;
		}
		
		
		public  function pausedKeyPressedHandler():void {
			trace("handle pause");
			addChild(pausedScreen);
			pausedScreen.addEventListener(CustomEventButtonId.BUTTON_ID , pausedScreenClickListener, false, 0, true);
			paused = true;
		}
		
		public  function muteKeyPressedHandler():void {
			soundManager.muteSound();
		}
		
	}
}