//
//  PHCDetailViewController.m
//  PlayHavenChallenge
//
//  Created by Grunt - Kerry on 1/8/13.
//  Copyright (c) 2013 PlayHaven. All rights reserved.
//

#import "PHCDetailViewController.h"

@interface PHCDetailViewController ()

@end

@implementation PHCDetailViewController
@synthesize urlPath,name;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlPath]];
    UIImage *img = [UIImage imageWithData:imageData];
    imageView.image = img;
    
    [self.view addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 340, 320, 40)];
    nameLabel.font = [UIFont boldSystemFontOfSize:25];
    nameLabel.textAlignment = UITextAlignmentCenter;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.text = name;
    [self.view addSubview:nameLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
