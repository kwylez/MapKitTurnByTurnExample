//
//  MapsAppDelegate.h
//  Maps
//
//  Created by cwiles on 3/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

@interface MapsAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

