//
//  CurrentDeviceLocationView.h
//  TriggersV3
//
//  Created by Diego on 19/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface CurrentDeviceLocationView : UIView
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet MKMapView *map;

@end
