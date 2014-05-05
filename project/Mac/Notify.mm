#import <Cocoa/Cocoa.h>

namespace cakenotify {
    
	// SEND NOTIFICATION
    void Notify(int secondsToFire, const char *bodyText, const char *titleText, int badgeNumber, const char *userInfo){
	    NSUserNotification *notification = [[NSUserNotification alloc] init];
	    
      notification.title = [[NSString alloc] initWithUTF8String:titleText];
      notification.informativeText = [[NSString alloc] initWithUTF8String:bodyText];
	    notification.soundName = NSUserNotificationDefaultSoundName;

	    NSDate *now = [NSDate date];
	    notification.deliveryDate = [now dateByAddingTimeInterval:secondsToFire];
	    notification.deliveryTimeZone= [NSTimeZone defaultTimeZone];

   		if (userInfo) {
          NSError *e = nil;
          NSData *data = [[[NSString alloc] initWithUTF8String:userInfo] dataUsingEncoding:NSUTF8StringEncoding];
          NSDictionary *userInfoDict = [NSJSONSerialization JSONObjectWithData:data options:0 error: &e];
          if (!e) {
            notification.userInfo = userInfoDict;
          }
        }

	    [[NSUserNotificationCenter defaultUserNotificationCenter] scheduleNotification:notification];

      if(badgeNumber>0){
        NSDockTile *badge = [[NSApplication sharedApplication] dockTile];
        [badge setBadgeLabel:[NSString stringWithFormat:@"%d",badgeNumber]];
      }
    }

    // SET APPLICATION BADGE
    void setBadge(int badgeNumber){
      NSDockTile *badge = [[NSApplication sharedApplication] dockTile];
      if(badgeNumber>0){
        [badge setBadgeLabel:[NSString stringWithFormat:@"%d",badgeNumber]];
      }else{
        [badge setBadgeLabel:@""];
      }
    }

    // CANCELL ALL NOTIFICATIONS
    void clearNotifications(){
      NSArray *scheduledNotifications = [[NSUserNotificationCenter defaultUserNotificationCenter] scheduledNotifications];
      for (NSUserNotification *id in scheduledNotifications) {
        [[NSUserNotificationCenter defaultUserNotificationCenter] removeScheduledNotification:id];
      }
      [[NSUserNotificationCenter defaultUserNotificationCenter] removeAllDeliveredNotifications];
    }

    // SHOW ALERT BOX
    void alert(const char *titleText, const char *bodyText, const char *buttonText){
      NSAlert *alert = [[[NSAlert alloc] init] autorelease];
      [alert setMessageText:[[NSString alloc] initWithUTF8String:titleText]];
      [alert setInformativeText:[[NSString alloc] initWithUTF8String:bodyText]];
      [alert addButtonWithTitle:[[NSString alloc] initWithUTF8String:buttonText]];
      [alert runModal];
    }
}
