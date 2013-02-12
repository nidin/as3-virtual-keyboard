package nid.ui.controls.vkb 
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	import nid.ui.controls.VirtualKeyBoard;
	import nid.ui.controls.vkb.keys.DarkKey;
	import nid.ui.controls.vkb.keys.LightKey;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class KeyBoardUI extends Sprite
	{
		
		/**
		 * Bitmap Icons
		 */
		[Embed(source = 'images/keyboard/close22.png')]
		internal var close_icon:Class;
		[Embed(source='images/keyboard/shift_icon.png')]
		internal var shift_icon:Class;
		[Embed(source='images/keyboard/delete_icon.png')]
		internal var delete_icon:Class;
		[Embed(source='images/keyboard/space_icon.png')]
		internal var space_icon:Class;
		[Embed(source='images/keyboard/tab_icon.png')]
		internal var tab_icon:Class;
		
		/**
		 * Key dimensions
		 */
		internal const n_w:int = 70; // normal key width
		internal const n_h:int = 60; // normal key height
		
		internal const del_w:int = 80;
		internal const del_h:int = 60;
		
		internal const space_w:int = 315;
		internal const space_h:int = 60;
		
		internal const enter_w:int = 150;
		internal const enter_h:int = 60;
		
		internal const shift_w:int = 80;
		internal const shift_h:int = 60;
		
		internal const alt_w:int = 80;
		internal const alt_h:int = 60;
		
		internal const tab_w:int = 80;
		internal const tab_h:int = 60;
		
		internal const abc_w:int = 100;
		internal const abc_h:int = 60;
		
		internal const num_w:int = 100;
		internal const num_h:int = 50;
		
		
		private var numeric:Array 
		= [	[{ c:'1', w:n_w, h:n_h , t:'L' }, 	  { c:'2', w:n_w, h:n_h , t:'L' }, { c:'3', w:n_w, h:n_h , t:'L' }, 	  { c:'4', w:n_w, h:n_h , t:'L' }, { c:'5', w:n_w, h:n_h , t:'L' }, { c:'6', w:n_w, h:n_h , t:'L' }, { c:'7', w:n_w, h:n_h , t:'L' }, { c:'8', w:n_w, h:n_h , t:'L' }, { c:'9', w:n_w, h:n_h , t:'L' }, { c:'0', w:n_w, h:n_h , t:'L' }],
			[{ c:'@', w:n_w, h:n_h , t:'L' }, 	  { c:'#', w:n_w, h:n_h , t:'L' }, { c:'$', w:n_w, h:n_h , t:'L' }, 	  { c:'%', w:n_w, h:n_h , t:'L' }, { c:'*', w:n_w, h:n_h , t:'L' }, { c:'-', w:n_w, h:n_h , t:'L' }, { c:'+', w:n_w, h:n_h , t:'L' }, { c:'(', w:n_w, h:n_h , t:'L' }, { c:')', w:n_w, h:n_h , t:'L' }],
			[{ c:'{tab}', w:tab_w, h:tab_h , t:'D' }, { c:'!', w:n_w, h:n_h , t:'L' }, { c:'"', w:n_w, h:n_h , t:'L' }, 	  { c:"'", w:n_w, h:n_h , t:'L' }, { c:':', w:n_w, h:n_h , t:'L' }, { c:';', w:n_w, h:n_h , t:'L' }, { c:',', w:n_w, h:n_h , t:'L' }, { c:'?', w:n_w, h:n_h , t:'L' }, { c:'{del}', w:del_w, h:del_h , t:'D' }],
			[{ c:'ABC', w:abc_w, h:abc_h , t:'D' }, { c:'/', w:n_w, h:n_h , t:'D' }, { c:'{space}', w:space_w, h:space_h , t:'D' }, { c:'.', w:n_w, h:n_h , t:'D' }, { c:'enter', w:enter_w, h:enter_h , t:'D' }] ];
		
		private var number_pad:Array 
		= [	[ { c:'1', w:num_w, h:num_h , t:'L' }, 	   { c:'2', w:num_w, h:num_h , t:'L' }, { c:'3', w:num_w, h:num_h , t:'L' }],
			[ { c:'4', w:num_w, h:num_h , t:'L' },     { c:'5', w:num_w, h:num_h , t:'L' }, { c:'6', w:num_w, h:num_h , t:'L' }],
			[ { c:'7', w:num_w, h:num_h , t:'L' },     { c:'8', w:num_w, h:num_h , t:'L' }, { c:'9', w:num_w, h:num_h , t:'L' }],
			[ { c:'*', w:num_w, h:num_h , t:'L' },     { c:'0', w:num_w, h:num_h , t:'L' },	{ c:'#', w:num_w, h:num_h , t:'L' }],
			[ { c:'{del}', w:150, h:del_h , t:'D' }, { c:'enter', w:enter_w, h:enter_h , t:'D' }]	];
		
		private var numeric_alt:Array 
		= [	[ { c:'~', w:n_w, h:n_h , t:'L' }, 	   { c:'`', w:n_w, h:n_h , t:'L' }, { c:'|', w:n_w, h:n_h , t:'L' }, { c:'•', w:n_w, h:n_h , t:'L' }, { c:'√', w:n_w, h:n_h , t:'L' }, { c:'π', w:n_w, h:n_h , t:'L' }, { c:'÷', w:n_w, h:n_h , t:'L' }, { c:'x', w:n_w, h:n_h , t:'L' }, { c:'{', w:n_w, h:n_h , t:'L' }, { c:'}', w:n_w, h:n_h , t:'L' }], 
			[ { c:'{tab}', w:tab_w, h:tab_h , t:'D' }, { c:'₤', w:n_w, h:n_h , t:'L' }, { c:'#', w:n_w, h:n_h , t:'L' }, { c:'€', w:n_w, h:n_h , t:'L' }, { c:'°', w:n_w, h:n_h , t:'L' }, { c:'^', w:n_w, h:n_h , t:'L' }, { c:'_', w:n_w, h:n_h , t:'L' }, { c:'=', w:n_w, h:n_h , t:'L' }, { c:'[', w:n_w, h:n_h , t:'L' }, { c:']', w:n_w, h:n_h , t:'L' }], 
			[ { c:'ALT', w:alt_w, h:alt_h , t:'D' }, { c:'™', w:n_w, h:n_h , t:'L' }, { c:'®', w:n_w, h:n_h , t:'L' }, { c:"©", w:n_w, h:n_h , t:'L' }, { c:'¶', w:n_w, h:n_h , t:'L' }, { c:'\/', w:n_w, h:n_h , t:'L' }, { c:'<', w:n_w, h:n_h , t:'L' }, { c:'>', w:n_w, h:n_h , t:'L' }, { c:'{del}', w:del_w, h:del_h , t:'D' }],
			[ { c:'ABC', w:abc_w, h:abc_h , t:'D' }, { c:',', w:n_w, h:n_h , t:'D' }, { c:'{space}', w:space_w, h:space_h , t:'D' }, { c:'.', w:n_w, h:n_h , t:'D' }, { c:'enter', w:enter_w, h:enter_h , t:'D' }]	];
		
		private var alphabets_lower:Array 
		= [	[{ c:'q', w:n_w, h:n_h , t:'L' }, 		{ c:'w', w:n_w, h:n_h , t:'L' }, { c:'e', w:n_w, h:n_h , t:'L' }, { c:'r', w:n_w, h:n_h , t:'L' }, { c:'t', w:n_w, h:n_h , t:'L' }, { c:'y', w:n_w, h:n_h , t:'L' }, { c:'u', w:n_w, h:n_h , t:'L' }, { c:'i', w:n_w, h:n_h , t:'L' }, { c:'o', w:n_w, h:n_h , t:'L' }, { c:'p', w:n_w, h:n_h , t:'L' }],
			[{ c:'a', w:n_w, h:n_h , t:'L' }, 		{ c:'s', w:n_w, h:n_h , t:'L' }, { c:'d', w:n_w, h:n_h , t:'L' }, { c:'f', w:n_w, h:n_h , t:'L' }, { c:'g', w:n_w, h:n_h , t:'L' }, { c:'h', w:n_w, h:n_h , t:'L' }, { c:'j', w:n_w, h:n_h , t:'L' }, { c:'k', w:n_w, h:n_h , t:'L' }, { c:'l', w:n_w, h:n_h , t:'L' }],
			[{ c:'{shift}', w:shift_w, h:shift_h , t:'D' },	{ c:'z', w:n_w, h:n_h , t:'L' }, { c:'x', w:n_w, h:n_h , t:'L' }, { c:'c', w:n_w, h:n_h , t:'L' }, { c:'v', w:n_w, h:n_h , t:'L' }, { c:'b', w:n_w, h:n_h , t:'L' }, { c:'n', w:n_w, h:n_h , t:'L' }, { c:'m', w:n_w, h:n_h , t:'L' }, { c:'{del}', w:del_w, h:del_h , t:'D' }],
			[{ c:'?123', w:abc_w, h:abc_h , t:'D' }, 	{ c:'/', w:n_w, h:n_h , t:'D' }, { c:'{space}', w:space_w, h:space_h , t:'D' }, { c:'.', w:n_w, h:n_h , t:'D' }, { c:'enter', w:enter_w, h:enter_h , t:'D' }]	];
			
		private var alphabets_upper:Array 
		= [	[ { c:'Q', w:n_w, h:n_h , t:'L' }, 		 { c:'W', w:n_w, h:n_h , t:'L' }, { c:'E', w:n_w, h:n_h , t:'L' }, 		 { c:'R', w:n_w, h:n_h , t:'L' }, { c:'T', w:n_w, h:n_h , t:'L' }, { c:'Y', w:n_w, h:n_h , t:'L' }, { c:'U', w:n_w, h:n_h , t:'L' }, { c:'I', w:n_w, h:n_h , t:'L' }, { c:'O', w:n_w, h:n_h , t:'L' }, { c:'P', w:n_w, h:n_h , t:'L' }], 
			[ { c:'A', w:n_w, h:n_h , t:'L' }, 		 { c:'S', w:n_w, h:n_h , t:'L' }, { c:'D', w:n_w, h:n_h , t:'L' }, 		 { c:'F', w:n_w, h:n_h , t:'L' }, { c:'G', w:n_w, h:n_h , t:'L' }, { c:'H', w:n_w, h:n_h , t:'L' }, { c:'J', w:n_w, h:n_h , t:'L' }, { c:'K', w:n_w, h:n_h , t:'L' }, { c:'L', w:n_w, h:n_h , t:'L' }], 
			[ { c:'{shift}', w:shift_w, h:shift_h , t:'D' }, { c:'Z', w:n_w, h:n_h , t:'L' }, { c:'X', w:n_w, h:n_h , t:'L' }, 		 { c:'C', w:n_w, h:n_h , t:'L' }, { c:'V', w:n_w, h:n_h , t:'L' }, { c:'B', w:n_w, h:n_h , t:'L' }, { c:'N', w:n_w, h:n_h , t:'L' }, { c:'M', w:n_w, h:n_h , t:'L' }, { c:'{del}', w:del_w, h:del_h , t:'D' }], 
			[ { c:'?123', w:abc_w, h:abc_h , t:'D' },  { c:'/', w:n_w, h:n_h , t:'D' }, { c:'{space}', w:space_w, h:space_h , t:'D' }, { c:'.', w:n_w, h:n_h , t:'D' }, { c:'enter', w:enter_w, h:enter_h , t:'D' }]	];
		
		
		private var layouts:Dictionary = new Dictionary();
		private var currentType:String = KeyBoardTypes.ALPHABETS_LOWER;
		private var keyholder:Sprite;
		private var bg:Shape = new Shape();
		private var close:DarkKey;
		public var inputArea:InputArea;
		public var _stage:Stage;
		
		public function KeyBoardUI() 
		{
			config();
			addEventListener(Event.ADDED_TO_STAGE, build);
		}
		
		private function config():void 
		{
			currentType = KeyBoardTypes.ALPHABETS_LOWER;
			
			bg = new Shape();
			addChild(bg);
			
			inputArea = new InputArea();
			addChild(inputArea);
			
			close = new DarkKey("back", 35, 40, new close_icon());
			close.y = 0;
			close.addEventListener(MouseEvent.CLICK, deactivate);
			inputArea.addChild(close);
			//backBtn = new Button2('BACK');
			//backBtn.addEventListener(MouseEvent.CLICK, deactivate);
			//backBtn.y = 15;
			//inputArea.addChild(backBtn);
			
			layouts[KeyBoardTypes.NUMBER_PAD] 		= number_pad;
			layouts[KeyBoardTypes.NUMERIC] 			= numeric;
			layouts[KeyBoardTypes.NUMERIC_ALT] 		= numeric_alt;
			layouts[KeyBoardTypes.ALPHABETS_LOWER] 	= alphabets_lower;
			layouts[KeyBoardTypes.ALPHABETS_UPPER] 	= alphabets_upper;
		}
		
		private function deactivate(e:MouseEvent):void 
		{
			VirtualKeyBoard.getInstance().hide();
		}
		public function build(param:*=null):void
		{
			if (param!= null && param is String)
			{
				currentType = param;
			}
			var currentLayout:Array = layouts[currentType];
			
			if (keyholder != null)
			{
				removeChild(keyholder);
				keyholder = null;
			}
			keyholder = new Sprite();
			
			var k_w:int = ((_stage.stageWidth - 40) / 10) - 10;
			var k_h:int = 60;
			var x_pox:int = 0;
			var y_pox:int = 0;
			
			for (var raws:int = 0; raws < currentLayout.length; raws++)
			{
				var raw:Sprite = new Sprite();
				
				for (var columns:int = 0; columns < currentLayout[raws].length; columns++)
				{
					var key:IKey;
					var ko:Object = currentLayout[raws][columns];
					var icon:Bitmap = null;
					
					k_w = ko.w * ((_stage.stageWidth - 40) / 800);
					k_h = ko.h;
					
					switch(currentLayout[raws][columns].c)
					{
						case '{del}':	icon = new delete_icon(); 	break;
						case '{shift}':	icon = new shift_icon();	break;
						case '{space}':	icon = new space_icon();	break;
						case '{tab}':	icon = new tab_icon();		break;
					}
					trace(currentLayout[raws][columns].c,'icon:',icon);
					key = KeyFactory.getKey(ko.c, k_w, k_h, ko.t, icon);
					
					key.x = x_pox;
					key.y = y_pox;
					
					key.addEventListener(MouseEvent.CLICK, handlEvent);
					key.addEventListener(TouchEvent.TOUCH_TAP, handlEvent);
					
					raw.addChild(DisplayObject(key));
					x_pox += (key.width +10);
				}
				
				x_pox = 0;
				y_pox += (k_h +10);
				
				raw.x = _stage.stageWidth / 2 - raw.width / 2;
				
				keyholder.addChild(raw);
			}
			
			keyholder. y = inputArea.height + 20;
			addChild(keyholder);
			
			bg.graphics.clear();
			bg.graphics.beginFill(0x000000);
			bg.graphics.drawRect(0, 0, _stage.stageWidth, keyholder.height + 40);
			bg.graphics.endFill();
			bg.y = inputArea.height;
			
			inputArea.width = _stage.stageWidth;
			
			close.x = _stage.stageWidth - close.width - 5;
			
		}
		
		private function handlEvent(e:Event):void 
		{
			var kid:String = e.currentTarget.kid;
			setTimeout(changeLayout, 1, kid);
		}
		internal function changeLayout(kid:String):void
		{
			switch(kid)
			{
				case '?123':
				{
					build(KeyBoardTypes.NUMERIC);
				}
				break;
				
				case 'ALT':
				{
					build(KeyBoardTypes.NUMERIC_ALT);
				}
				break;
				
				case 'ABC':
				{
					build(KeyBoardTypes.ALPHABETS_LOWER);
				}
				break;
				
				case '{shift}':
				{
					build(currentType == KeyBoardTypes.ALPHABETS_LOWER?KeyBoardTypes.ALPHABETS_UPPER:KeyBoardTypes.ALPHABETS_LOWER);
				}
				break;
				
				default:
				{
					dispatchEvent(new KeyBoardEvent(KeyBoardEvent.UPDATE, kid));
				}
				break;
			}
		}
		
	}

}