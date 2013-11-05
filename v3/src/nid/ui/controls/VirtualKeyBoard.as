package  nid.ui.controls
{
	import caurina.transitions.Tweener;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.text.TextField;
	import nid.ui.controls.vkb.KeyBoardEvent;
	import nid.ui.controls.vkb.KeyBoardUI;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class VirtualKeyBoard extends Sprite 
	{
		private static var instance:VirtualKeyBoard;
		public static function getInstance():VirtualKeyBoard
		{
			if (instance == null)
			{
				instance = new VirtualKeyBoard();
			}
			return instance;
		}
		
		/**
		 * Properties
		 */
		private var targetField:TextField;
		private var referenceText:String='';
		private var keyboard:KeyBoardUI;
		private var isActive:Boolean;
		
		private var _stage:Stage;
		
		public function VirtualKeyBoard() 
		{
			configUI();
			
		}
		
		private function configUI():void 
		{
			keyboard = new KeyBoardUI();
			addChild(keyboard );
			
			keyboard.addEventListener(KeyBoardEvent.UPDATE, updateTarget);
		}
		
		private function updateTarget(e:KeyBoardEvent):void 
		{
			trace(e.char);
			switch(e.char)
			{
				case '{del}':
				{
					referenceText = referenceText.substr(0, referenceText.length - 1);
				}
				break;
				
				case 'enter':
				{
					referenceText += '\n';
					//hide();
					//dispatchEvent(new KeyBoardEvent(KeyBoardEvent.ENTER));
					return;
				}
				break;
				
				case 'close':
				{
					hide();
					dispatchEvent(new KeyBoardEvent(KeyBoardEvent.ENTER));
					return;
				}
				break;
				
				case '{tab}':
				{
					referenceText += '\t';
				}
				break;
				
				case '{space}':
				{
					referenceText += ' ';
				}
				break;
				
				default :
				{
					referenceText += e.char;
				}
				break;
			}
			
			keyboard.inputArea.targetField.text = referenceText;
			
			if (targetField != null)
			{
				targetField.text = referenceText;
			}
		}
		
		public function set target(obj:Object):void
		{
			if (isActive) return;
			
			targetField = obj.field;
			referenceText = targetField.text;
			keyboard.inputArea.fieldName.text = obj.fieldName;
			keyboard.inputArea.targetField.text = referenceText;
			keyboard.inputArea.targetField.displayAsPassword = targetField.displayAsPassword;
			keyboard.inputArea.targetField.restrict = targetField.restrict;
			
			keyboard.build(obj.keyboardType);
			
			show();
		}
		
		public function resize(e:Event=null):void
		{
			if (_stage!=null)
			{
				keyboard.build();
				keyboard.y = isActive ? _stage.stageHeight  - keyboard.height : _stage.stageHeight + 50;
			}
		}
		public function init(target:DisplayObject):void
		{
			_stage 			 = target.stage;
			_stage.scaleMode = StageScaleMode.NO_SCALE;
			_stage.align 	 = StageAlign.TOP_LEFT;
			keyboard._stage  = _stage;
			_stage.addEventListener(Event.RESIZE, resize);
		}
		public function show():void
		{
			keyboard.y = _stage.stageHeight;
			keyboard.alpha = 0;
			_stage.addChild(keyboard);
			Tweener.addTween(keyboard, { alpha:1, y:_stage.stageHeight  - keyboard.height, time:0.5, transition:"easeOutQuart" } );
			isActive = true;
		}
		public function hide():void
		{
			Tweener.addTween(keyboard, {alpha:0, y:_stage.stageHeight + 50, time:0.5, transition:"easeOutQuart",onComplete:flush } );
			dispatchEvent(new Event(Event.CLOSE));
		}
		private function flush():void
		{
			isActive = false;
			if(this.parent != null)
			this.parent.removeChild(this);
		}
	}

}