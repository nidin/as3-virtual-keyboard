package nid.ui.controls.vkb.keys 
{
	import com.greensock.TweenMax;
	import flash.display.Bitmap;
	import flash.display.GradientType;
	import flash.display.Shape;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import nid.ui.controls.vkb.IKey;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class DarkKey extends Sprite implements IKey
	{
		
		private var bg:Shape;
		private var char:TextField;
		private var font:Arial;
		public var kid:String;
		
		public function DarkKey(_kid:String, _width:int = 60, _height:int = 60,icon:Bitmap=null ) 
		{
			this.buttonMode 	= true;
			this.mouseChildren 	= false;
			
			kid = _kid;
			
			var fillType:String = GradientType.LINEAR;
			var colors:Array = [0x4B4D4C, 0x333534];
			var alphas:Array = [1, 1];
			var ratios:Array = [0x00, 0xFF];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(_width, _height, Math.PI / 2, 0, 0);
			var spreadMethod:String = SpreadMethod.PAD;
			
			bg = new Shape();
			bg.graphics.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);        
			bg.graphics.drawRoundRect(0, 0, _width , _height, 5, 5);
			bg.graphics.endFill();
			addChild(bg);			
			
			if (icon == null)
			{
				font = new Arial();
				
				char = new TextField();
				char.selectable = false;
				char.embedFonts = true;
				char.defaultTextFormat = new TextFormat("Arial", 30, 0xffffff, true, null, null, null, null, "center");
				char.text = kid;
				char.autoSize = TextFieldAutoSize.LEFT;
				char.x = _width / 2 - char.width / 2;
				char.y = _height / 2 - char.height / 2;
				char.filters = [new DropShadowFilter(1, 45, 0x000000, 1, 1, 1, 1, 3, true)];
				addChild(char);
			}
			else
			{
				icon.x = _width / 2 - icon.width / 2;
				icon.y = _height / 2 - icon.height / 2;
				addChild(icon);
			}
			
			addEventListener(MouseEvent.MOUSE_OVER, handleEvents);
			addEventListener(MouseEvent.MOUSE_OUT, handleEvents);
		}
		
		private function handleEvents(e:MouseEvent):void 
		{
			if (e.type == MouseEvent.MOUSE_OVER)
			{
				TweenMax.to(this, 0.1, {colorMatrixFilter:{amount:1, contrast:1.1, brightness:1.3}});
			}
			else
			{
				TweenMax.to(this, 0.1, { colorMatrixFilter: { }} );
			}
		}
	}

}