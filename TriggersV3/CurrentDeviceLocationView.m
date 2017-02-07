//
//  CurrentDeviceLocationView.m
//  TriggersV3
//
//  Created by Diego on 19/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "CurrentDeviceLocationView.h"

@implementation CurrentDeviceLocationView : UIView

// Locate the position of the user in the UIMap.
- (void) locateUser{
    _map.userTrackingMode = YES;
}

@end
