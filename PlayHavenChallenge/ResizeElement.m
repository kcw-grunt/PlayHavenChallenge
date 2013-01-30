//
//  ResizeElement.m
//  PlayHavenChallenge
//
//  Created by Kerry Washington on 1/7/13.
//  Copyright (c) 2013 PlayHaven. All rights reserved.
//

#import "ResizeElement.h"

@implementation ResizeElement


+(id) shrinkImageForTable:(NSData *)data{

    UIImage *recvdImage;
    UIImage *tableImage;
    recvdImage = [UIImage imageWithData:data];
    
    CGSize tableSize = CGSizeMake(88,88);
    UIGraphicsBeginImageContext(tableSize);
    [recvdImage drawInRect:CGRectMake(0,0,tableSize.width,tableSize.height)];
    tableImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tableImage;
}

@end
