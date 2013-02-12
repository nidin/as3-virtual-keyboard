package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import nid.ui.controls.VirtualKeyBoard;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			VirtualKeyBoard.getInstance().init(this);
			
			var txt:TextField = new TextField();
			txt.width = 300;
			txt.height = 100;
			txt.background = true;
			txt.backgroundColor = 0xCCCCCC;
			txt.defaultTextFormat = new TextFormat("Arial", 25, 0x000000,true,null,null,null,null,"center");
			txt.text = "PRESS HERE"
			addChild(txt);
			txt.x = 175;
			txt.y = 10;
			
			txt.addEventListener(MouseEvent.CLICK, toggleKeyboard);
			
		}
		
		private function toggleKeyboard(e:MouseEvent):void 
		{
			VirtualKeyBoard.getInstance().target = { field:e.currentTarget, fieldName:"Test" };
		}
		
	}

}