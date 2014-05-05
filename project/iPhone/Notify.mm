#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

namespace cakenotify {
    
    // SEND NOTIFICATION
    void Notify(int secondsToFire, const char *bodyText, const char *titleText, int badgeNumber, const char *userInfo){
        UILocalNotification *localNotif = [[UILocalNotification alloc] init];
        if (localNotif == nil) {
          return;
        }

        NSDate *now = [NSDate date];
        localNotif.fireDate = [now dateByAddingTimeInterval:secondsToFire];
        localNotif.timeZone = [NSTimeZone defaultTimeZone];
        localNotif.alertBody = [[NSString alloc] initWithUTF8String:bodyText];
        localNotif.alertAction = [[NSString alloc] initWithUTF8String:titleText];
        localNotif.soundName = UILocalNotificationDefaultSoundName;
        
        localNotif.applicationIconBadgeNumber = badgeNumber;

        if (userInfo) {
          NSError *e = nil;
          NSData *data = [[[NSString alloc] initWithUTF8String:userInfo] dataUsingEncoding:NSUTF8StringEncoding];
          NSDictionary *userInfoDict = [NSJSONSerialization JSONObjectWithData:data options:0 error: &e];
          if (!e) {
            localNotif.userInfo = userInfoDict;
          }
        }

        [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
        [localNotif release];
    }

    // SET APPLICATION BADGE
    void setBadge(int badgeNumber){
      [UIApplication sharedApplication].applicationIconBadgeNumber = badgeNumber;
    }

    // CANCELL ALL NOTIFICATIONS
    void clearNotifications(){
      [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }

    // SHOW ALERT BOX
    void alert(const char *titleText, const char *bodyText, const char *buttonText){
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[NSString alloc] initWithUTF8String:titleText]
                                                    message:[[NSString alloc] initWithUTF8String:bodyText]
                                                    delegate:nil
                                                    cancelButtonTitle:[[NSString alloc] initWithUTF8String:buttonText]
                                                    otherButtonTitles:nil];
      [alert show];
    }
}
