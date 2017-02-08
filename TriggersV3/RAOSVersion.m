//
//  RAOSVersion.m
//  TriggersV3
//
//  Created by MISO on 8/2/17.
//  Copyright © 2017 Diego. All rights reserved.
//

#import "RAOSVersion.h"

@implementation RAOSVersion

-(id) getValue{
    UIDevice *device = [UIDevice currentDevice];
    NSString *version = [device systemVersion];
    return version;    
}

@end
