﻿package as3_user_interface_kit.views{	/**	 * AS3 の 描画APIに対応した Canvas コンポーネントです.	 * <p>線、塗の色を設定するだけでサックリ矩形を作れます。</p>	 * @author takanosatoshi	 *	 */	public class DrawableView extends View implements IDrawable	{		private var _lineColor:uint = 0x000000;		private var _useLine:Boolean = true;		private var _lineThickness:Number = 1;		private var _fillColor:uint = 0xffffff;		private var _isLock:Boolean = false;		/**		 * コンストラクタ.		 */		public function DrawableView(fillColor:uint = 0xffffff, lineColor:uint = 0x000000)		{			_fillColor = fillColor;			_lineColor = lineColor;		}		/**		 * @inheritDoc		 *		 */		public function lock():void		{			_isLock = true;		}		/**		 * @inheritDoc		 *		 */		public function unlock():void		{			_isLock = false;			setNeedDisplay();		}		/**		 * @inheritDoc		 * @return		 *		 */		public function get borderColor():uint		{			return _lineColor;		}		public function set borderColor(value:uint):void		{			_lineColor = value;			setNeedDisplay();		}		/**		 * @inheritDoc		 * @return		 *		 */		public function get useBorder():Boolean		{			return _useLine;		}		public function set useBorder(value:Boolean):void		{			_useLine = value;		}		/**		 * @inheritDoc		 * @return		 *		 */		public function get borderWidth():Number		{			return _lineThickness;		}		public function set borderWidth(value:Number):void		{			_lineThickness = value;			if (value == 0)				useBorder = false;			setNeedDisplay();		}		/**		 * @inheritDoc		 * @return		 *		 */		public function get backgroundColor():uint		{			return _fillColor;		}		public function set backgroundColor(value:uint):void		{			_fillColor = value;			setNeedDisplay();		}		/**		 * @inheritDoc		 *		 */		public function changeColor(lineColor:uint, fillColor:uint):void		{			_lineColor = lineColor;			_fillColor = fillColor;			setNeedDisplay();		}		/**		 * @inheritDoc		 */		override protected function draw():void		{			super.draw();			if (!_isLock)			{				graphics.clear();				if (useBorder)					graphics.lineStyle(borderWidth, borderColor);				graphics.beginFill(backgroundColor);				var ofst:Number = borderWidth;				graphics.drawRect(borderWidth / 2, borderWidth / 2, frame.width - ofst, frame.height - ofst);				graphics.endFill();			}		}		public function get isLock():Boolean		{			return _isLock;		}	}}