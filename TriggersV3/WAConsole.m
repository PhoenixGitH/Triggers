//
//  WAConsole.m
//  TriggersV3
//
//  Created by Diego on 15/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "WAConsole.h"

@implementation WAConsole

- (instancetype)init
{
    self = [super init];
    if (self) {
        _textToPrint = @"noText";
    }
    return self;
}


-(void)writeValue{
    NSLog(@"%@", _textToPrint);
}
@end
