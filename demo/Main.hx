class Main {
    public static function main(){
        CakeNotify.notify("You wouldn't see this notification", "Sample Notification", 5, 6, "{AnyData: 'COOL'}");
        CakeNotify.clearNotifications();
        CakeNotify.setBadge(0);
        CakeNotify.notify("AppCake presents CakeNotify", "Sample Notification", 5, 2, "{AnyData: 'COOL'}");
        CakeNotify.setBadge(8);
        CakeNotify.alert("Any message here","Use alert box to inform user about anything","Got it!");
    }
}