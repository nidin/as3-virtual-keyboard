package nid.ui.controls.vkb 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class KeyBoardEvent extends Event 
	{
		
		public static const UPDATE:String = "update";
		public static const ENTER:String = "enter";
		
		public var char:String;
		
		public function KeyBoardEvent(type:String,data:String="", bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			char = data;
		} 
		
	}
	
}