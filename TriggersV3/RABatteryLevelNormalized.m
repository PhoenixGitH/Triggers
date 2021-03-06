//
//  RABatteryLevel.m
//  TriggersV3
//
//  Created by Diego on 14/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "RABatteryLevelNormalized.h"
#import <UIKit/UIKit.h>

@implementation RABatteryLevelNormalized

- (instancetype)init
{
    self = [super init];
    if (self) {
        super.information = @"Returns the normalized battery level of the device (between 0 and 1)";
    }
    return self;
}


// Return battery level normalized
-(id)getValue{
    UIDevice *myDevice = [UIDevice currentDevice];
    [myDevice setBatteryMonitoringEnabled:YES];
    
    // Format battery for only two digits.
    double batLeft = (float)[myDevice batteryLevel];
    NSString* formattedNumber = [NSString stringWithFormat:@"%.02f", batLeft];
    return [NSNumber numberWithDouble:atof([formattedNumber UTF8String])];
}


@end
