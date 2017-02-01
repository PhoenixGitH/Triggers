//
//  JsonClass.m
//  DiagramEditor
//
//  Created by Diego on 7/9/16.
//  Copyright © 2016 Diego Vaquero Melchor. All rights reserved.
//

#import "Object.h"


@implementation Object

@synthesize attributes, name;

- (instancetype)init
{
    self = [super init];
    if (self) {
        name = @"unknown";

        attributes = [[NSMutableArray alloc] init];

    }
    return self;
}



/*Return nil if that attribute doesn't exists */
-(ClassAttribute *)attributeForName:(NSString *)n{
    for(ClassAttribute * ca in attributes){
        if([ca.name isEqualToString:n]){
            return ca;
        }
    }
    return nil;
}


-(NSString *)description{
    NSString * temp = @"";
    
    //temp = [temp stringByAppendingString:@"---------------\n"];

    for(ClassAttribute * ca in attributes){
        temp = [temp stringByAppendingString:[NSString stringWithFormat:@"%@(%@) : %@ , ", [ca.name description], [ca.type description], [ca.currentValue description]]];
    }
    
    //temp = [temp stringByAppendingString:@"---------------\n"];
    return temp;
}


@end
