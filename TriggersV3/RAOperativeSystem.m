//
//  RAOperativeSystem.m
//  TriggersV3
//
//  Created by MISO on 8/2/17.
//  Copyright © 2017 Diego. All rights reserved.
//

#import "RAOperativeSystem.h"

@implementation RAOperativeSystem

-(id) getValue{
    UIDevice *device = [UIDevice currentDevice];
    NSString *Os = [device systemName];
    return Os;
}

@end
