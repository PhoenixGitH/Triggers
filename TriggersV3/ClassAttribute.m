//
//  ClassAttribute.m
//  DiagramEditor
//
//  Created by Diego on 22/1/16.
//  Copyright © 2016 Diego Vaquero Melchor. All rights reserved.
//

#import "ClassAttribute.h"

@implementation ClassAttribute


@synthesize name, type ;


- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [self initWithName:@""
                   andType:@""
                 andMaxVal:[NSNumber numberWithInt:-1]
                 andMinVal:[NSNumber numberWithInt:-1]
           andDefaultValue:@""];
    }
    return self;
}


- (instancetype)initWithName: (NSString *)n
                     andType: (NSString *)t
                   andMaxVal: (NSNumber *)ma
                   andMinVal: (NSNumber *)mi
             andDefaultValue: (NSString *)dv
{
    self = [super init];
    if (self) {
        name = n;
        type = t;

    }
    return self;
}


#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.type forKey:@"type"];

}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {

        self.name = [coder decodeObjectForKey:@"name"];
        self.type = [coder decodeObjectForKey:@"type"];

    }
    return self;
}

-(NSString *)description{
    return [_currentValue description];
}

@end
