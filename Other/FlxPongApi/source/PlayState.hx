package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.effects.particles.FlxEmitter;

class PlayState extends FlxState
{
	private var _player:FlxSprite;
	private var _playerBullets:Emitter;
	
	override public function create():Void
	{
		FlxG.cameras.bgColor = Reg.lite;
		
		#if !FLX_NO_MOUSE
		FlxG.mouse.hide();
		#end
		
		_player = new PongSprite( 16, Std.int( ( FlxG.height - 16 ) / 2 ), 4, 4, Reg.med_dark );
		
		_playerBullets = new Emitter( Std.int( _player.x + _player.width ), Std.int( _player.y + _player.height / 2 ), 4 );
		
		add( _player );
		add( _playerBullets );
		
		super.create();
	}
	
	override public function update():Void
	{
		_player.y = FlxG.mouse.y;
		
		if ( FlxG.mouse.pressed ) {
			_playerBullets.emitParticle();
		}
		
		super.update();
	}	
}