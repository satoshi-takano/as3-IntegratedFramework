package as3_animation_kit.interpolator
{
	import as3_animation_kit.IEasing;

	/**
	 * Robert Penner Cubic イージング関数.
	 * @see http://www.robertpenner.com/
	 * @author tkn
	 *
	 */
	public class RPCubic
	{
		private static var _easeIn:IEasing;
		private static var _easeOut:IEasing;
		private static var _easeInOut:IEasing;

		/**
		 * easeIn 関数を返します.
		 * @return
		 *
		 */
		public static function easeIn():IEasing
		{
			if (_easeIn == null)
				_easeIn = new EaseIn();
			return _easeIn;
		}
		
		/**
		 * easeOut 関数を返します.
		 * @return
		 *
		 */
		public static function easeOut():IEasing
		{
			if (_easeOut == null)
				_easeOut = new EaseOut();
			return _easeOut;
		}
		
		/**
		 * easeInOut 関数を返します.
		 * @return
		 *
		 */
		public static function easeInOut():IEasing
		{
			if (_easeInOut == null)
				_easeInOut = new EaseInOut();
			return _easeInOut;
		}

	}
}

import as3_animation_kit.IEasing;

internal class EaseIn implements IEasing
{
	/**
	 * @inheritDoc
	 */
	public function calculate(t:Number, b:Number, c:Number, d:Number):Number
	{
		return c * (t /= d) * t * t + b;
	}
}

internal class EaseOut implements IEasing
{
	/**
	 * @inheritDoc
	 */
	public function calculate(t:Number, b:Number, c:Number, d:Number):Number
	{
		return c * ((t = t / d - 1) * t * t + 1) + b;
	}
}

internal class EaseInOut implements IEasing
{
	/**
	 * @inheritDoc
	 */
	public function calculate(t:Number, b:Number, c:Number, d:Number):Number
	{
		return ((t /= d / 2) < 1) ? c / 2 * t * t * t + b : c / 2 * ((t -= 2) * t * t + 2) + b;
	}
}