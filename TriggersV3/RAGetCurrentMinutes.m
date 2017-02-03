//
//  RAGetCurrentMinutes.m
//  TriggersV3
//
//  Created by MISO on 3/2/17.
//  Copyright © 2017 Javier. All rights reserved.
//


#import "RAGetCurrentMinutes.h"

@implementation RAGetCurrentMinutes

// Get the value of the current minutes via date
-(id)getValue{
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:date];
    
    NSInteger minutes = [components minute];

    return [NSNumber numberWithInteger:minutes];
}

@end
