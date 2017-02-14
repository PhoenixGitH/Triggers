//
//  WeatherPackage.h
//  TriggersV3
//
//  Created by MISO on 10/2/17.
//  Copyright © 2017 Javier. All rights reserved.
//

#ifndef WeatherPackage_h
#define WeatherPackage_h

#import "JSONModel.h"

@interface Main: JSONModel

@property (nonatomic) int humidity;
@property (nonatomic) float temp;
@property (nonatomic) float temp_min;
@property (nonatomic) int pressure;
@property (nonatomic) float temp_max;

-(float) getMin;
-(float) getMax;
-(float) getTemp;
-(int) getHumidity;
-(int) getPressure;

@end

@interface Wind : JSONModel

@property (nonatomic) float speed;
@property (nonatomic) float deg;

-(float) getSpeed;
-(float) getDegrees;

@end

@interface Clouds : JSONModel

@property (nonatomic) int all;

-(int)getCloud;

@end

@interface System : JSONModel

@property (nonatomic) NSString *country;
@property (nonatomic) long sunset;
@property (nonatomic) long sunrise;

-(NSString *) getCountry;
-(long) getSunset;
-(long) getSunrise;

@end

@interface WeatherInfo : JSONModel

@property (nonatomic) NSString *name;
@property (nonatomic) long id;
@property (nonatomic) NSString *description;
@property (nonatomic) NSString *main;

-(NSString *) getName;
-(long) getId;
-(NSString *) getMain;
-(NSString *) getDescription;

@end

@interface WeatherPackage : JSONModel

@property (nonatomic) NSString *name;
@property (nonatomic) long id;
@property (nonatomic) long cod;
@property (nonatomic) long dt;
@property (nonatomic) NSString *base;
@property (nonatomic) Main *main;
@property (nonatomic) System *sys;
@property (nonatomic) Clouds *clouds;
@property (nonatomic) Wind *wind;
@property (nonatomic) NSArray <WeatherInfo *> *weather;


-(NSString *) getName;
-(long) getId;
-(long) getCode;
-(long) getDt;
-(NSString *) getBase;
-(Main *) getMain;
-(System *) getSys;
-(NSArray *) getWeather;
-(Clouds *) getClouds;
-(Wind *) getWind;

@end

#endif /* WeatherPackage_h */
