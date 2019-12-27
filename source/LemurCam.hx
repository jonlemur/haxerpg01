package;

import flixel.math.FlxPoint;
import openfl.sensors.Accelerometer;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;

class LemurCam extends FlxSprite
{

    var zoom = 1.0;
	var minZoom = 0.6;
	var maxZoom = 1.9;
	var zoomSpeedDrag = 10; // higher is slower

	var dragging = false;
	var dragStart:FlxPoint;
	var dragSpeed = 25;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);

        // makeGraphic(16, 16, FlxColor.BLUE);

        // FlxG.camera.follow(camTrg, TOPDOWN, 1);
        
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // CAMERA ZOOM
		if (FlxG.mouse.wheel != 0)
		{
			if (zoom <= maxZoom && zoom >= minZoom)
			{	
				zoom += (FlxG.mouse.wheel / 10);

				if (zoom > maxZoom)
				{
					zoom = maxZoom;
				}
				else if (zoom < minZoom)
				{
					zoom = minZoom;
				}

				FlxG.camera.zoom = zoom;
			}

		}

		if (FlxG.mouse.justPressedMiddle)
		{
			dragStart = FlxG.mouse.getWorldPosition();
			dragging = true;
		}
		else if (FlxG.mouse.justReleasedMiddle)
		{
			dragging = false;
		}

		if (dragging)
		{
			var currentPos = FlxG.mouse.getWorldPosition();
			if (currentPos != dragStart)
			{
				var offset = dragStart.subtract(currentPos.x, currentPos.y);
				dragStart = currentPos;
				//trace(offset);
				
				// x += offset.x;
				// y += offset.y;
				velocity.set(offset.x*dragSpeed, offset.y*dragSpeed);

				//FlxG.camera.setPosition(FlxG.camera.x + offset.x/10, FlxG.camera.y + offset.y/10);
				// FlxG.camera.x += offset.x/10;
				// FlxG.camera.y += offset.y/10;
				
				// camTrg.velocity.x = 100;	
			}
		}else{
			velocity.set(0, 0);
		}

		

    }
}