//
//  StringValue.m
//  TriggersV3
//
//  Created by Diego on 14/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "StringValue.h"

@implementation StringValue


-(id)getValue{
    return (NSString *)super.value;
}


-(NSString *) description{
    NSString  * val = (NSString *)super.value;
    return val;
}
@end
