//
//  GetWeather.m
//  TriggersV3
//
//  Created by MISO on 9/2/17.
//  Copyright © 2017 Diego. All rights reserved.
//

#import "GetWeather.h"


NSString * const api_key = @"6faefe9c835124150d6f782947a4c722";

@implementation GetWeather

-(NSDictionary *) valueForCity: (NSString *) city{
    /*RARest * rar = [[RARest alloc] init];
    rar.baseURL = @"http://api.openweathermap.org/data/2.5/weather?";
    [rar addParamWithKey:@"q" andValue:city];
    [rar addParamWithKey:@"APPID" andValue:api_key];    return rar;*/
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://api.openweathermap.org/data/2.5/weather?q=Madrid&APPID=%@",api_key];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    return json;
}

-(RARest *) valueForLatLongRARest:(NSString *)latlng{
    RARest * rar = [[RARest alloc] init];
    rar.baseURL = @"http://api.openweathermap.org/data/2.5/weather?";
    NSArray *array = [latlng componentsSeparatedByString:@","];
    [rar addParamWithKey:@"lat" andValue:array[0]];
    [rar addParamWithKey:@"lon" andValue:array[1]];
    [rar addParamWithKey:@"APPID" andValue: api_key];
    return rar;
}

//TODO: Pending of implementention.
-(RARest *) valueForZipCode:(NSString *)zip{
    return [[RARest alloc] init];
}

@end
