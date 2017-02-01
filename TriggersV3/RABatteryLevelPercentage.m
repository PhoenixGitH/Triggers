//
//  RABatteryLevelPercentage.m
//  TriggersV3
//
//  Created by Diego on 15/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "RABatteryLevelPercentage.h"
#import <UIKit/UIKit.h>

@implementation RABatteryLevelPercentage


- (instancetype)init
{
    self = [super init];
    if (self) {
        super.information = @"Returns the percentage battery level of the device (between 0 and 100)";
    }
    return self;
}

// Return battery level normalized
-(id)getValue{
    UIDevice *myDevice = [UIDevice currentDevice];
    [myDevice setBatteryMonitoringEnabled:YES];
    
    double batLeft = (float)[myDevice batteryLevel];
    int percent = batLeft*100;
    return [NSNumber numberWithInt:percent];
}

@end
