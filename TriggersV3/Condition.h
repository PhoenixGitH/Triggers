//
//  Condition.h
//  Triggers
//
//  Created by Diego on 25/11/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassAttribute.h"
#import "Action.h"


@interface Condition : NSObject


typedef enum operators
{
    equal,
    greaterThan,
    lowerThan,
    greaterOrEqualThan,
    lowerOrEqualThan,
    distinct,
    inRangeOf,
    outOfRangeOf
} Operator;



@property Operator operator;


@property id leftPart;
@property id rightPart;



-(BOOL)executeComparation;
-(NSString *)getExpression;

+(NSMutableArray *)getOperatorsArrayForLeftObject:(id)left;
-(void)setOperatorFronString:(NSString *)str;

@end
