//
//  RADeviceName.m
//  TriggersV3
//
//  Created by MISO on 8/2/17.
//  Copyright © 2017 Diego. All rights reserved.
//


#import "RADeviceName.h"

@implementation RADeviceName

-(id)getValue{
    UIDevice *myDevice = [UIDevice currentDevice];
    NSString *name = [myDevice name];
    return name;
}

@end
