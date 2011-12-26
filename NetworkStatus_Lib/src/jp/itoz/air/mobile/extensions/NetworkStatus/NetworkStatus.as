/**
 * Copyright 2011 itoz.jp All rights reserved.
 * Created by  on 11/12/08.
 * @author itoz
 */
package jp.itoz.air.mobile.extensions.NetworkStatus {
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	public class NetworkStatus extends EventDispatcher
    {
        public static const  extensionId : String = "jp.itoz.air.mobile.extensions.NetworkStatus";
        private var _context : ExtensionContext;

        public function NetworkStatus()
        {
            _context = ExtensionContext.createExtensionContext(extensionId, "type");
            _context.addEventListener(StatusEvent.STATUS, onStatusEvent);
        }

        /**
         * 現在のステータスを取得
         */
        public function getNetworkStatus() : String
        {
            return _context.call("getNetworkStatus") as String;
        }

        public function dispose() : *
        {
            return _context.dispose();
        }

        /**
         *ネットワーク状態変化イベント配信
         */
        private function onStatusEvent(event : StatusEvent) : void
        {
            //Event.code
            // static  NSString *CONNECTED_NON = @"CONNECTED_NON";
            // static  NSString *CONNECTED_WIFI = @"CONNECTED_WIFI";
            // static  NSString *CONNECTED_3G = @"CONNECTED_3G";
            
            trace("[ANE] "+extensionId+".NetworkStatus onStatusEvent --------------------------------");
            trace('	event.code: ' + (event.code));
            trace('	event.level: ' + (event.level));
            dispatchEvent(event);
        }
    }
}
