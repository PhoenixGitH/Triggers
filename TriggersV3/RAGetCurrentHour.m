//
//  RAGetCurrentHour.m
//  TriggersV3
//
//  Created by MISO on 3/2/17.
//  Copyright © 2017 Javier. All rights reserved.
//

#import "RAGetCurrentHour.h"

@implementation RAGetCurrentHour : RADevice

// Get the current hour as a value of structure.
-(id) getValue{
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitSecond) fromDate: date];
    
    NSInteger hour = [components hour];
    
    return [NSNumber numberWithInteger: hour];
}

@end
