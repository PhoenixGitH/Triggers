//
//  RACurrentDeviceLocation.m
//  TriggersV3
//
//  Created by Diego on 14/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "RACurrentDeviceLocation.h"
#import "AppDelegate.h"
#import "CurrentDeviceLocationView.h"

@implementation RACurrentDeviceLocation



- (instancetype)init
{
    self = [super init];
    if (self) {
        super.name = @"Get device location";
        super.information = @"Returns the current device localization";
    }
    return self;
}



-(id)getValue{
    
    AppDelegate * dele = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    return dele.manager.manager.location;

}

-(UIView *)getCreatingView{
    NSArray * arr =[[NSBundle mainBundle] loadNibNamed:@"CurrentDeviceLocationView" owner:self options:nil];
    CurrentDeviceLocationView * view = (CurrentDeviceLocationView *) [arr firstObject];
    
    view.titleLabel.text = super.name;
    view.map.showsUserLocation = YES;
    return view;
}

@end
