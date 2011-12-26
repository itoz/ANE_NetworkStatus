package jp.itoz.ari.mobile.extensions.sample.NetworkStatusApp {
	import jp.itoz.air.mobile.extensions.NetworkStatus.NetworkStatus;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.StatusEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

    public class NetworkStatusAppiOS extends Sprite
    {
        private var _tf : TextField;
        private var _networkStatus : NetworkStatus;

        public function NetworkStatusAppiOS()
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;

            var _title:TextField = addChild(new TextField( )) as TextField;
            _title.defaultTextFormat=new TextFormat(null,25,0xcc0000);
            _title.autoSize = TextFieldAutoSize.LEFT;
            _title.text = "NetworkStatus Sample";
            
            _tf = addChild(new TextField()) as TextField;
            _tf.defaultTextFormat = new TextFormat(null, 25, 0x1c1f68);
			_tf.y = _title.height;
			_tf.width = stage.stageWidth;
			_tf.height = stage.stageHeight - _tf.y;
			
            _networkStatus = new NetworkStatus();
            _networkStatus.addEventListener(StatusEvent.STATUS, onNetworkStatusEvent);
        }

        /**
         * ネットワーク変化イベントが起きた
         */
        private function onNetworkStatusEvent(event : StatusEvent) : void
        {
			_tf.appendText(event.code + "\n");
		}

        /**
         * 現在のネットワーク状況を取得
         */
		// private function onGetNetworkStatus(event : MouseEvent) : void
		// {
		// _tf.appendText(_networkStatus.getNetworkStatus() + "\n");
		// }

	}
}
