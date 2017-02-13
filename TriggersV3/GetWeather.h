//
//  GetWeather.h
//  TriggersV3
//
//  Created by MISO on 9/2/17.
//  Copyright © 2017 Diego. All rights reserved.
//

#ifndef GetWeather_h
#define GetWeather_h

#import "RARest.h"

extern NSString * const api_key;

@interface GetWeather : NSObject

-(RARest *) valueForLatLongRARest: (NSString *) latlng;
-(NSDictionary *) valueForCity: (NSString *) city;
-(RARest *) valueForZipCode: (NSString *) zip;

@end


#endif /* GetWeather_h */
