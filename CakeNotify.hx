package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class CakeNotify {
	
	
    public static function notify(Body:String, Title:String="", Time:Int=0, Badge:Int=0, UserInfo:String="") {
		return cakenotify_notify(Time, Body, Title, Badge, UserInfo);
    }
	private static var cakenotify_notify = Lib.load("cakenotify", "cakenotify_notify", 5);

	public static function setBadge(Badge:Int=0) {
		return cakenotify_set_badge(Badge);
    }
	private static var cakenotify_set_badge = Lib.load("cakenotify", "cakenotify_set_badge", 1);	

	public static function clearNotifications() {
		return cakenotify_clear_notifications();
    }
	private static var cakenotify_clear_notifications = Lib.load("cakenotify", "cakenotify_clear_notifications", 0);

	public static function alert(titleText:String, bodyText:String, buttonText:String) {
		return cakenotify_alert(titleText, bodyText, buttonText);
    }
	private static var cakenotify_alert = Lib.load("cakenotify", "cakenotify_alert", 3);
	
}