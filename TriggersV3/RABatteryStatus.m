//
//  RABatteryStatus.m
//  TriggersV3
//
//  Created by Diego on 14/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "RABatteryStatus.h"
#import <UIKit/UIKit.h>


@implementation RABatteryStatus


- (instancetype)init
{
    self = [super init];
    if (self) {
        super.information = @"Returns the current battery status of the device. (0 unknown, 1 unplegged, 2 charging, 3 full)";
    }
    return self;
}

// 0 unknown, 1 unplegged, 2 charging, 3 full
-(id)getValue{
    UIDevice *myDevice = [UIDevice currentDevice];
    [myDevice setBatteryMonitoringEnabled:YES];
    int state = [myDevice batteryState];
    return [NSNumber numberWithInt:state];
}


@end
