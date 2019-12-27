package;

import flixel.FlxSprite;
import openfl.Assets;
import flixel.tile.FlxTilemap;
import flixel.FlxState;
import flixel.FlxG;
import LemurCam;

class PlayState extends FlxState
{

	var walkable:FlxTilemap;
	var walls:FlxTilemap;
	var camTRG:LemurCam;

	var dragging = false;

	override public function create():Void
	{
		super.create();

		// map
		walkable = new FlxTilemap();
		var mapCsv:String = Assets.getText(AssetPaths.level01_walkable__csv);
		walkable.loadMapFromCSV(mapCsv, AssetPaths.dungeon01b__png, 16, 16);
		add(walkable);

		walls = new FlxTilemap();
		var mapCsvWalls:String = Assets.getText(AssetPaths.level01_walls__csv);
		walls.loadMapFromCSV(mapCsvWalls, AssetPaths.dungeon01b__png, 16, 16);
		add(walls);

		camTRG = new LemurCam(48, 48);
		add(camTRG);
		FlxG.camera.follow(camTRG, LOCKON, 1);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

	}
}
