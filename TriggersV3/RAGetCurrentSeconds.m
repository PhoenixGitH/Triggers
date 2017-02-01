//
//  RAGetCurrentSeconds.m
//  TriggersV3
//
//  Created by Diego on 15/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "RAGetCurrentSeconds.h"

@implementation RAGetCurrentSeconds

-(id)getValue{
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:date];
    
    NSInteger seconds = [components second];
    
    
    return [NSNumber numberWithInteger:seconds];
}

@end
