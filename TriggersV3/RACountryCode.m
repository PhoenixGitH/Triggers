//
//  RACountryCode.m
//  TriggersV3
//
//  Created by MISO on 15/2/17.
//  Copyright © 2017 Javier. All rights reserved.
//

#import "RACountryCode.h"

#import "AppDelegate.h"
#import "CurrentDeviceLocationView.h"

@implementation RACountryCode

- (instancetype)init
{
    self = [super init];
    if (self) {
        super.name = @"Get device country code";
        super.information = @"Returns the current device country";
    }
    return self;
}

-(id)getValue{
    AppDelegate * dele = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    
    [geocoder reverseGeocodeLocation:dele.manager.manager.location
                   completionHandler:^(NSArray *placemarks, NSError *error) {
                       dispatch_async(dispatch_get_global_queue(0, 0), ^{
                           
                           NSLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
                           
                           if (error){
                               NSLog(@"Geocode failed with error: %@", error);
                               return;
                               
                           }
                           
                           
                           _placemark = [placemarks objectAtIndex:0];
                           dispatch_group_leave(group);
                       });
                   }
     ];
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    return _placemark.ISOcountryCode;
}

-(UIView *)getCreatingView{
    NSArray * arr =[[NSBundle mainBundle] loadNibNamed:@"CurrentDeviceLocationView" owner:self options:nil];
    CurrentDeviceLocationView * view = (CurrentDeviceLocationView *) [arr firstObject];
    
    view.titleLabel.text = super.name;
    view.map.showsUserLocation = YES;
    return view;
}

@end
