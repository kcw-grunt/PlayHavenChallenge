//
//  PHCMasterViewController.h
//  PlayHavenChallenge
//
//  Created by Jesus Fernandez on 11/12/12.
//  Copyright (c) 2012 PlayHaven. All rights reserved.
//
//  ============================================================================
//  ============================================================================
//  HEY THERE!
//  So this table view controller is part of the code challenge. Hop on over to
//  PHCMasterViewController.m to see some more notes about this challenge.
//  ============================================================================
//  ============================================================================

#import <UIKit/UIKit.h>
#import "FTWCache.h"
#import "NSString+MD5.h"

@class PHCDetailViewController;

@interface PHCMasterViewController : UITableViewController

@property (strong, nonatomic) PHCDetailViewController *detailViewController;

@end
