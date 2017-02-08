//
//  RADeviceID.m
//  TriggersV3
//
//  Created by MISO on 8/2/17.
//  Copyright © 2017 Diego. All rights reserved.
//

#import "RADeviceID.h"

@implementation RADeviceID

-(id) getValue{
    UIDevice *device = [UIDevice currentDevice];
    NSString *identifier = [[device identifierForVendor] description];
    return identifier;
}

@end
