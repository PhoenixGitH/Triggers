//
//  RAGetCurrentDate.m
//  TriggersV3
//
//  Created by MISO on 3/2/17.
//  Copyright © 2017 Diego. All rights reserved.
//

#import "RAGetCurrentDate.h"

@implementation RAGetCurrentDate : RADevice

-(id) getValue{
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd/MM/YYYY HH:mm:ss"];
    
    return [format stringFromDate:[NSDate date]];
}

@end
