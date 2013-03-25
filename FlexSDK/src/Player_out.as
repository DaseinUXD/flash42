 package
{
    import org.flixel.*;
    
    public class Player extends FlxSprite
    {
        private var _move_speed:int = 4;
        private var _jump_power:int = 100 ;   
        public var _max_health:int = 10;
		private var _stars:FlxGroup;
		private var _inGroup:FlxGroup;
		
        public var _hurt_counter:Number = 0;
		
		public var canFly:Boolean = false;
		
		private var _bloodGibs:FlxEmitter; 
		
		private var myState1:*;
		
		private var _canJump:Boolean = false;
		private var keyDown:Number = 0;
		
		public function Player(X:Number,Y:Number,Stars:FlxGroup, PlayerGibs:FlxGroup, myState:*):void
        {
            super(X, Y);

			myState1 = myState;
			
			_inGroup = PlayerGibs;
			_stars = Stars;
			
			loadGraphic(GlobalVars.Astronaut, true, false, 2, 4);
            maxVelocity.x = 40;
            maxVelocity.y = 120;
			
            //Set the player health
            health = GlobalVars.myPlayerHealth;
            //Gravity
            acceleration.y = 200;            
            //Friction
            drag.x = 50;
			
            //bounding box tweaks
			width = 2;
            height = 4;
			
            addAnimation("fullHealth", [0], 10, false);
            addAnimation("health3", [1], 10, false);
            addAnimation("health2", [2], 10, false);
            addAnimation("health1", [3], 10, false);
			
			play("fullHealth");
			
			_bloodGibs = new FlxEmitter(x, y);
			_bloodGibs.setXSpeed(-20,20);
			_bloodGibs.setYSpeed(-30,0);
			_bloodGibs.setRotation(0,0);
			_bloodGibs.createSprites(GlobalVars.Blood, 20, 16, false,.5 ,.1);
			myState1.lyrSprites.add(_bloodGibs);
			myState1._collideGroup.add(_bloodGibs);
		}
		
        override public function update():void
        {
			if (_hurt_counter > 0)
			{
				_hurt_counter -= FlxG.elapsed*3;
			}		
			
			if (y > myState1._map.height)
			{
				kill();
			}
			
			if (!FlxG.keys.LEFT && !FlxG.keys.RIGHT)
			{
				acceleration.x = 0;
			}
			
			if(FlxG.keys.LEFT)
			{
				facing = LEFT;
				acceleration.x = -drag.x;
			}
			else if (FlxG.keys.RIGHT)
			{
				facing = RIGHT;
				acceleration.x = drag.x;
			}
			if ((FlxG.keys.justPressed("X")) && _canJump == false)
			{
				FlxG.play(GlobalVars.Jump);
				_canJump = true;
				velocity.y =- _jump_power;
				//FlxG.play(GlobalVars.JumpSound);
			}
			if (FlxG.keys.justReleased("X") && _canJump == true && velocity.y < 0)
			{
				velocity.y = -.01;
			}
			if(FlxG.keys.justPressed("C"))
			{
				fireBullet(facing);

			}  

            super.update();
			_canJump = true;
        }

        override public function hurt(Damage:Number):void
        {
			if (_hurt_counter <= 0)
			{
				FlxG.play(GlobalVars.Hit);
				//FlxG.play(GlobalVars.PlayerHitSound);
				_hurt_counter = 3;

				return super.hurt(Damage);
			}
			if (health == 3)
			{
				play("health3");
			}
			if (health == 2)
			{
				play("health2");
			}
			if (health == 1)
			{
				play("health1");
			}
		}     
		
		private function fireBullet(dir:uint):void
        {
			var XVelocity:Number;
            if (dir == RIGHT) XVelocity = 400;
				else XVelocity = -400;
            
			for(var i:uint = 0; i < _stars.members.length; i++)
				if(!_stars.members[i].exists)
				{
					FlxG.play(GlobalVars.LaserSnd);
					if (dir == RIGHT)
					{		
						
						_stars.members[i].resetStar(this.x + 2, this.y, XVelocity, 0);
						return;
					}else
					{
						_stars.members[i].resetStar(this.x-2, this.y, XVelocity, 0);
						return;	
					}
				}
        }
		
		override public function kill():void
		{
			FlxG.play(GlobalVars.Death);
			_bloodGibs.start(true, 1, 20);
			_bloodGibs.at(this);
			super.kill();
		}
		
		override public function hitBottom(Contact:FlxObject,Velocity:Number):void
        {
			_canJump = false;
			canFly = true;
			myState1.flameSprite.keyDown = 0;
            return super.hitBottom(Contact, Velocity);
        }
	}
}
