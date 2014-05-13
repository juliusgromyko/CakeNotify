#ifndef CAKENOTIFY_H
#define CAKENOTIFY_H

namespace cakenotify {

	// SEND NOTIFICATION
	void Notify(int secondsToFire, const char *bodyText, const char *titleText, int badgeNumber, const char *userInfo);	

	// SET APPLICATION BADGE
	void setBadge(int number);

	// CANCELL ALL NOTIFICATIONS
	void clearNotifications();

	// SHOW ALERT BOX
	void alert(const char *titleText, const char *bodyText, const char *buttonText);

	// SHOW ALERT BOX WITH TWO BUTTONS
	int alert2(const char *titleText, const char *bodyText, const char *buttonText1, const char *buttonText2);
}

#endif