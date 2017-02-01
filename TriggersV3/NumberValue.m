//
//  NumberValue.m
//  TriggersV3
//
//  Created by Diego on 14/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "NumberValue.h"

@implementation NumberValue

-(id)getValue{
    return (NSNumber *)super.value;
}

-(NSString *) description{
    NSNumber * val = (NSNumber *)super.value;
    return [NSString stringWithFormat:@"%.2f", val.floatValue];
}

@end
