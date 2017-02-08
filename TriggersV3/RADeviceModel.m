//
//  RADeviceModel.m
//  TriggersV3
//
//  Created by MISO on 8/2/17.
//  Copyright © 2017 Diego. All rights reserved.
//

#import "RADeviceModel.h"

@implementation RADeviceModel

-(id) getValue{
    UIDevice *device = [UIDevice currentDevice];
    NSString *model = [device model];
    return model;
}

@end
