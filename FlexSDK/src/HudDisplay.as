package 
{
    import org.flixel.*;
	import org.flixel.data.FlxAnim;
	
    public class HudDisplay extends FlxGroup
    {
		
		public var scoreDisplay:FlxText;
		public var livesDisplay:FlxText;
		
		
		private var _lineCounter:int = 0;		
		private var _myState:*;
		private var _hearts:FlxGroup;
		private var _resetTick:Number = 8;
		private var _gameOverScreen:GameOverScreen;


		private var _old_health:uint
		
        public function HudDisplay(MyState:*):void
        {
            super();

			_myState = MyState;
			
			//_chatterBoxTest = new ChatterBox(25, 50,250);
		    //add(_chatterBoxTest);
			//_chatterBoxTest.maxLines = 5;
			
			scoreDisplay = new FlxText(14, 2, 300, "SCORE: " + FlxG.score.toString());
			scoreDisplay.setFormat("NES", 8, 0xffffffff, "right");
			scoreDisplay.scrollFactor.x = scoreDisplay.scrollFactor.y = 0;
			scoreDisplay.antialiasing = false;
			this.add(scoreDisplay);
			
			livesDisplay = new FlxText(14, 10, 300, "LIVES: " + GlobalVars.lives.toString());
			livesDisplay.setFormat("NES", 8, 0xffffffff, "right");
			livesDisplay.scrollFactor.x = livesDisplay.scrollFactor.y = 0;
			livesDisplay.antialiasing = false;
			this.add(livesDisplay);
			
			_hearts = new FlxGroup();
            var tmpH:FlxSprite;
            for (var hCount:Number = 0; hCount < _myState._player._max_health; hCount++)
            {
                tmpH = new FlxSprite(0 + (hCount * 7), 0);
				//tmpH.loadGraphic(GlobalVars.ImgHearts, true, false);
                tmpH.scrollFactor.x = tmpH.scrollFactor.y = 0;
                tmpH.addAnimation("on", [0]);
                tmpH.addAnimation("off", [1]);
                tmpH.play("on");
                _hearts.add(this.add(tmpH));
            }			
			_old_health = _myState._player.health;
			showHearts();
			
			//oneMaxLine();

        }
    
        override public function update():void
        {
            super.update();

			
			////////////death handler

			if (_myState._player.dead) 
			{
				if (_resetTick == 8)
				{
					GlobalVars.lives--;
					if (FlxG.score > 99) { FlxG.score = FlxG.score - 100; }
				}
				if (_resetTick < 9)
					_resetTick -= FlxG.elapsed * 3;
			}
			if (_resetTick <= 0) 
			{
				_resetTick = 9;
				checkStates();
			}

            ////////////score			
			if(_old_score != FlxG.score)
            {
                scoreDisplay.text = FlxG.score.toString();
            }
            ////////////health			
			if(_myState._player.health != _old_health)
            {
                for(var i:Number = 0; i < _myState._player._max_health; i++)
                {
                    if (i >= _myState._player.health)
                    {
                        _hearts.members[i].play("off");
                    }
                    else
                    {
                        _hearts.members[i].play("on");
                    }
                }
            }
			
            ////////////checkers
			_old_health = _myState._player.health;
			var _old_score:uint = FlxG.score;
        }
				
		private function checkStates():void
		{
			if (GlobalVars.lives < 0) 
			{
				_gameOverScreen = new GameOverScreen(0, -314);
				add(_gameOverScreen);
			}
			else
			{
				this.kill();
				if (_myState.toString() == "[object GameStage]") { FlxG.state = new Stage1()}
			}			
		}
		
		private function showHearts():void
		{
			for(var i:Number = 0; i < _myState._player._max_health; i++)
            {
                if (i >= _myState._player.health)
                {
                    _hearts.members[i].play("off");
                }
                else
                {
                    _hearts.members[i].play("on");
                }
            }
		}
		
		/*public function oneMaxLine():void
		{
			_chatterBoxTest.fadeOutDelay = 6;
			_chatterBoxTest.fadeOutTimer = 2;
			_chatterBoxTest.maxLines = 0;
		}
		
		
		public function addLine(myText:Array):void
		{
			for (var textLines:uint = 0; textLines < myText.length; textLines++)
			{
				if (_lineCounter == myText.length)
				{
					_lineCounter = 0;
				}

			}
		}
		
		public function fadeWithDelay():void
		{
			_chatterBoxTest.fadeOutDelay = 1;
			_chatterBoxTest.fadeOutTimer = 2;
		}*/
		

	}
} 