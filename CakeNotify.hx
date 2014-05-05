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
	
	/** Schedule local notification
	* Body:String - text of notification
	* Title:String="" - title of notification
	* Time:Int=0 - delay in seconds before displaying notification
	* Badge:Int=0 - set small badge with number over application icon
	* UserInfo:String="" - any data that you want to save (json for example)
	*/
    public static function notify(Body:String, Title:String="", Time:Int=0, Badge:Int=0, UserInfo:String="") {
		return cakenotify_notify(Time, Body, Title, Badge, UserInfo);
    }
	private static var cakenotify_notify = Lib.load("cakenotify", "cakenotify_notify", 5);

	/** Set small badge with number on application icon
	* Badge:Int - number to show
	*/
	public static function setBadge(Badge:Int=0) {
		return cakenotify_set_badge(Badge);
    }
	private static var cakenotify_set_badge = Lib.load("cakenotify", "cakenotify_set_badge", 1);	

	/** Remove all delivered and scheduled notifications
	*/
	public static function clearNotifications() {
		return cakenotify_clear_notifications();
    }
	private static var cakenotify_clear_notifications = Lib.load("cakenotify", "cakenotify_clear_notifications", 0);

	/** Show simply alert box
	* titleText:String - title of alert box
	* bodyText:String - body text
	* buttonText:String - title of default button
	*/
	public static function alert(titleText:String, bodyText:String, buttonText:String) {
		return cakenotify_alert(titleText, bodyText, buttonText);
    }
	private static var cakenotify_alert = Lib.load("cakenotify", "cakenotify_alert", 3);
	
}