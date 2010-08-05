//
//  MapsAppDelegate.m
//  Maps
//
//  Created by cwiles on 3/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MapsAppDelegate.h"
#import "RootViewController.h"


@implementation MapsAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

