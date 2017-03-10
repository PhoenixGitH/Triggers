//
//  WeatherPackage.m
//  TriggersV3
//
//  Created by MISO on 10/2/17.
//  Copyright © 2017 Javier. All rights reserved.
//

#import "WeatherPackage.h"

@implementation WeatherPackage

-(NSString *) getName{
    return _name;
}

-(long) getId{
    return _id;
}
-(long) getCode{
    return _cod;
}
-(long) getDt{
    return _dt;
}
-(NSString *) getBase{
    return _base;
}
-(Main *) getMain{
    return _main;
}
-(System *) getSys{
    return _sys;
}
-(Clouds *) getClouds{
    return _clouds;
}
-(NSArray<WeatherInfo> *) getWeather{
    return _weather;
}
-(Wind *)getWind{
    return _wind;
}

@end

@implementation Main

-(float) getMin{
    return _temp_min;
}

-(float) getMax{
    return _temp_max;
}
-(int) getHumidity{
    return _humidity;
}
-(float) getTemp{
    return _temp;
}
-(int) getPressure{
    return _pressure;
}

@end

@implementation WeatherInfo

@synthesize description;

-(long) getId{
    return _id;
}
-(NSString *) getMain{
    return _main;
}
-(NSString *) getName{
    return _name;
}
-(NSString *) getDescription{
    return description;
}

@end

@implementation Clouds

-(int)getCloud{
    return _all;
}

@end


@implementation Wind

-(float)getSpeed{
    return _speed;
}
-(float)getDegrees{
    return _deg;
}

@end

@implementation System

-(long)getSunset{
    return _sunset;
}
-(long)getSunrise{
    return _sunrise;
}
-(NSString *)getCountry{
    return _country;
}

@end
