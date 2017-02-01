//
//  RADeviceOrientation.m
//  TriggersV3
//
//  Created by Diego on 14/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "RADeviceOrientation.h"
#import <UIKit/UIKit.h>


@implementation RADeviceOrientation


/*
 
 0  UIDeviceOrientationUnknown,
 1  UIDeviceOrientationPortrait, // Device oriented vertically, home button on the bottom
 2  UIDeviceOrientationPortraitUpsideDown, // Device oriented vertically, home button on the top
 3  UIDeviceOrientationLandscapeLeft, // Device oriented horizontally, home button on the right
 4  UIDeviceOrientationLandscapeRight, // Device oriented horizontally, home button on the left
 5  UIDeviceOrientationFaceUp, // Device oriented flat, face up
 6  UIDeviceOrientationFaceDown // Device oriented flat, face down
 };
 */


- (instancetype)init
{
    self = [super init];
    if (self) {
        super.information = @"Returns the device orientation.\n0 unknown, 1 Portrait, 2 UpsideDown, 3 LandscapeLeft, 4 LandscapeRight, 5 FaceUp, 6 FaceDown";
    }
    return self;
}

-(id)getValue{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    return [NSNumber numberWithInteger:orientation];
    
}

@end
