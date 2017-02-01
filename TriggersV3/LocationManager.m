//
//  LocationManager.m
//  TriggersV3
//
//  Created by Diego on 14/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager



- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [[CLLocationManager alloc] init];
        _manager.delegate = self;
        _manager.distanceFilter = kCLDistanceFilterNone;
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
        
       
        [_manager requestWhenInUseAuthorization];
        
        [_manager startUpdatingLocation];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = locations.lastObject;
    CLLocation *oldLocation;
    if (locations.count > 1) {
        oldLocation = locations[locations.count - 2];
    }
}

@end
