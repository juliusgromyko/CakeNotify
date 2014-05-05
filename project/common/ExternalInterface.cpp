#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "Utils.h"


using namespace cakenotify;


// SEND NOTIFICATION
static value cakenotify_notify(value secondsToFire, value bodyText, value titleText, value badgeNumber, value userInfo)
{
	cakenotify::Notify(val_int(secondsToFire), val_string(bodyText), val_string(titleText), val_int(badgeNumber), val_string(userInfo));
	return alloc_null();
}
DEFINE_PRIM(cakenotify_notify,5);

// SET APPLICATION BADGE
static value cakenotify_set_badge(value badgeNumber)
{
	cakenotify::setBadge(val_int(badgeNumber));
  	return alloc_null();
}
DEFINE_PRIM(cakenotify_set_badge,1);

// CANCELL ALL NOTIFICATIONS
static value cakenotify_clear_notifications()
{
	cakenotify::clearNotifications();
  	return alloc_null();
}
DEFINE_PRIM(cakenotify_clear_notifications,0);

// SHOW ALERT BOX
static value cakenotify_alert(value titleText, value bodyText,value buttonText)
{
	cakenotify::alert(val_string(titleText), val_string(bodyText), val_string(buttonText));
	return alloc_null();
}
DEFINE_PRIM(cakenotify_alert,3);

// MAIN ENTRY POINT
extern "C" void cakenotify_main ()
{	
	val_int(0); // Fix Neko init
}
DEFINE_ENTRY_POINT (cakenotify_main);
extern "C" int cakenotify_register_prims () { return 0; }