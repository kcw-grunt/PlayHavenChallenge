//
//  PHCAppDelegate.m
//  PlayHavenChallenge
//
//  Created by Jesus Fernandez on 11/12/12.
//  Copyright (c) 2012 PlayHaven. All rights reserved.
//
//  ============================================================================
//  ============================================================================
//  HEY THERE!
//  This is a standard issue App Delegate, there's nothing to see here.
//  You shouldn't need to change anything here to complete the code challenge.
//
//  I'd check out PHCMasterViewController.m if I were you.
//  ============================================================================
//  ============================================================================

#import "PHCAppDelegate.h"

#import "PHCMasterViewController.h"

@implementation PHCAppDelegate
@synthesize window;
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    PHCMasterViewController *masterViewController = [[PHCMasterViewController alloc] initWithNibName:@"PHCMasterViewController" bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
