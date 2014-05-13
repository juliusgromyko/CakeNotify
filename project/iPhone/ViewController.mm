#import "ViewController.h"
#import "../include/Utils.h"

@implementation ViewController
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    int r=buttonIndex+1;
    if(r==1) {
        NSLog(@"The user select Button 1");
    }
    else if(r==2) {
        NSLog(@"The user select Button 2");
    }
    else if(r==3) {
        NSLog(@"The user select Button 3");
    }
}
@end