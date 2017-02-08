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
    float latitude = dele.manager.manager.location.coordinate.latitude;
    float longitude = dele.manager.manager.location.coordinate.longitude;
    
    //CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    //__block NSString *countryCode;
    
    
    //__block dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    //dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        /*[geocoder reverseGeocodeLocation:dele.manager.manager.location
                   completionHandler:^(NSArray *placemarks, NSError *error) {
                       NSLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
                       
                       if (error){
                           NSLog(@"Geocode failed with error: %@", error);
                           return;
                           
                       }
                       
                       
                       CLPlacemark *placemark = [placemarks objectAtIndex:0];
                       
                       NSLog(@"placemark.ISOcountryCode %@",placemark.ISOcountryCode);
                       countryCode = placemark.ISOcountryCode;
                       NSLog(@"placemark.country %@",placemark.country);
                       NSLog(@"placemark.postalCode %@",placemark.postalCode);
                       NSLog(@"placemark.administrativeArea %@",placemark.administrativeArea);
                       NSLog(@"placemark.locality %@",placemark.locality);
                       NSLog(@"placemark.subLocality %@",placemark.subLocality);
                       NSLog(@"placemark.subThoroughfare %@",placemark.subThoroughfare);
                       //dispatch_semaphore_signal(semaphore);
                       
                   }];*/
        
    //});
        
    //dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return [NSString stringWithFormat: @"%f,%f", latitude,longitude];

}

-(UIView *)getCreatingView{
    NSArray * arr =[[NSBundle mainBundle] loadNibNamed:@"CurrentDeviceLocationView" owner:self options:nil];
    CurrentDeviceLocationView * view = (CurrentDeviceLocationView *) [arr firstObject];
    
    view.titleLabel.text = super.name;
    view.map.showsUserLocation = YES;
    return view;
}

@end
