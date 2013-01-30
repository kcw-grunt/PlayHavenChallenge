//
//  PHCMasterViewController.m
//  PlayHavenChallenge
//
//  Created by Jesus Fernandez on 11/12/12.
//  Copyright (c) 2012 PlayHaven. All rights reserved.
//
//  ============================================================================
//  ============================================================================
//  THIS IS A CODE CHALLENGE
//  This UITableViewController sets up a UITableView with the data you need to
//  complete the code challenge. The data is stored in a plist inside the
//  project as an NSArray of NSDictionary instances.
//
//  There are two keys in each NSDictionary:
//
//   * 'name': NSString that should be displayed in the cell.
//   * 'urlPath': NSString of a URL pointing to an image that should be
//     displayed in the cell.
//
//  REMEMBER: Scrolling performance is critical! Think about ways to make sure
//  scrolling is always fast and smooth.
//  ============================================================================
//  ============================================================================

#import "PHCMasterViewController.h"
#import "PHCDetailViewController.h"
#import "ResizeElement.h"

@interface PHCMasterViewController () {
    NSArray *_objects;
}
@end

@implementation PHCMasterViewController
@synthesize detailViewController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Challenge", @"Challenge");
        
        // Don't change this!
        // You must show ALL of these items in your table view to complete the challenge.
        NSString *challengeListPath = [[NSBundle mainBundle] pathForResource:@"ChallengeList" ofType:@"plist"];
        _objects = [[NSArray alloc] initWithContentsOfFile:challengeListPath];
        
        //Adding  preloading and scaling the images as they are to large to show in the table (400x400)
        // Optimized implementations should never use a full image for table cell due to the por scrolling.
        // The delay in loading is a nice tradeoff of small delay versus a full usability. - Kerry Washington: 1/8/13
        
        NSMutableArray *tempObjects = [[NSMutableArray alloc] init];            
        
        for (NSDictionary *dictionary in _objects) {

                    NSError *err;
                    NSURL *imageURL = [NSURL URLWithString:[dictionary valueForKey:@"urlPath"]];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL options:NSDataReadingUncached error:&err];
                    NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
                    
                    [newDict setObject:[dictionary valueForKey:@"urlPath"] forKey:@"urlPath"];
                    [newDict setObject:[dictionary valueForKey:@"name"] forKey:@"name"];
                    
                    ///Wrote a class to resize image//
                    [newDict setObject:[ResizeElement shrinkImageForTable:imageData] forKey:@"image"];
                    [tempObjects addObject:newDict];
            }
        
        //Added a new "Image" element to the array of dictionaries dump in the IVAR _objects
        _objects = nil;
        _objects = tempObjects;
        
        
    }
    return self;
}

// A UITableView has already been set up for you to show every row in the collection.
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSUInteger const kNameTag = 2;
    static NSUInteger const kUrlTag = 3;
    static NSUInteger const kImageTag = 4;
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 11, 280, 25)];
    UILabel *urlLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 30, 200, 50)];;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 88, 88)];;


    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    // This current implemention shows the name and urlPath of each item in each row.
    
//    cell.textLabel.text = [object valueForKey:@"name"];
//    cell.detailTextLabel.text = [object valueForKey:@"urlPath"];
     
     nameLabel.tag = kNameTag;
     nameLabel.font = [UIFont boldSystemFontOfSize:20];
     nameLabel.textAlignment = UITextAlignmentLeft;
     nameLabel.backgroundColor = [UIColor clearColor];
     [cell.contentView addSubview:nameLabel];
        
     urlLabel.tag = kUrlTag;
     urlLabel.font = [UIFont boldSystemFontOfSize:10];
     urlLabel.textAlignment = UITextAlignmentLeft;
     urlLabel.textColor = [UIColor darkGrayColor];
     urlLabel.backgroundColor = [UIColor clearColor];
     urlLabel.numberOfLines = 2;
     [cell.contentView addSubview:urlLabel];
        
     imageView.tag = kImageTag;
     imageView.backgroundColor = [UIColor clearColor];
     [cell.contentView addSubview:imageView];
        

    
} else {
    // A reusable cell was available, so we just need to get a reference to the subviews
    // using their tags.
    //
    nameLabel = (UILabel *)[cell.contentView viewWithTag:kNameTag];
    urlLabel = (UILabel *)[cell.contentView viewWithTag:kUrlTag];
    imageView = (UIImageView *)[cell.contentView viewWithTag:kImageTag];
}

// Set the relevant data for each subview in the cell.
    nameLabel.text = [[_objects objectAtIndex:indexPath.row] valueForKey:@"name"];
    urlLabel.text = [[_objects objectAtIndex:indexPath.row] valueForKey:@"urlPath"];
    
    imageView.image = [[_objects objectAtIndex:indexPath.row] valueForKey:@"image"];
             
return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}



-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{


    detailViewController = [[PHCDetailViewController alloc] initWithNibName:@"PHCDetailViewController" bundle:nil];
    detailViewController.urlPath = [[_objects objectAtIndex:indexPath.row] valueForKey:@"urlPath"];
    detailViewController.name = [[_objects objectAtIndex:indexPath.row] valueForKey:@"name"];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];


}


@end
