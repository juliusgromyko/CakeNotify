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

	/** Show simply alert box with two buttons
	* titleText:String - title of alert box
	* bodyText:String - body text
	* buttonText1:String - title of first button
	* buttonText2:String - title of second button
	*/
	public static function alert2(titleText:String, bodyText:String, buttonText1:String, buttonText2:String):Int {
		var r:Int = cakenotify_alert2(titleText, bodyText, buttonText1, buttonText2);

		// Normalizing response for MacOS
		if(r>=1000) r-=999;

		return r;
    }
	private static var cakenotify_alert2 = Lib.load("cakenotify", "cakenotify_alert2", 4);
	

	
	/** Set small badge with number on application icon
	* Badge:Int - number to show
	*/
	public static function preventScreenLock(State:Bool=true) {
		#if ios
		return prevent_screen_lock(State);
		#else
		return 0;
		#end
    }
    #if ios
	private static var prevent_screen_lock = Lib.load("cakenotify", "prevent_screen_lock", 1);	
	#end
}