//
//  Condition.m
//  Triggers
//
//  Created by Diego on 25/11/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "Condition.h"
#import <CoreLocation/CoreLocation.h>
#import "Object.h"
#import "ReadAction.h"


@implementation Condition

- (instancetype)initWithLeftPart:(id)l
                    andRightPart:(id)r
                     andOperator:(Operator)o
{
    self = [super init];
    if (self) {
        _rightPart = r;
        _leftPart = l;
        _operator = o;
    }
    return self;
}

+(NSMutableArray *)getOperatorsArrayForLeftObject:(id)left
{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    if([left isKindOfClass:[NSNumber class]]){
        [array addObject:@"=="];
        [array addObject:@"!="];
        [array addObject:@">"];
        [array addObject:@"<"];
        [array addObject:@">="];
        [array addObject:@"<="];
    }else if( [left isKindOfClass:[NSString class]]){
        [array addObject:@"=="];
        [array addObject:@"!="];
        /*[array addObject:@">"];
        [array addObject:@"<"];
        [array addObject:@">="];
        [array addObject:@"<="];*/
    }else if( [left isKindOfClass:[CLLocation class]]){
        [array addObject:@"in range of"];
        [array addObject:@"out of range of"];
    }else{
        
    }
    
    
    return array;
}


-(BOOL)executeComparation{
    
    
    
    id l = [_leftPart getValue]; //It could be either an action or a value
    id r = [_rightPart getValue];
    
    
    if([l isKindOfClass:[NSNumber class]] && [l class] == [r class]){ //Both numbers
        return [self compareAsNumbersLeft:l andRight:r];
    }else if([l isKindOfClass:[NSString class]] && [l class] == [r class]){ //Both strings
        return [self compareAsStringsLeft:l andRight:r];
    }else{ //Incompatible types
        
    }
    
    return false;
}

-(BOOL)compareAsNumbersLeft:(NSNumber *)l
                   andRight:(NSNumber *)r
{
    
    
    
    switch (_operator) {
        case greaterThan:
            if(l.floatValue > r.floatValue){
                return YES;
            }else{
                return NO;
            }
            break;
            
        case lowerThan:
            if(l.floatValue < r.floatValue){
                return YES;
            }else{
                return NO;
            }
            break;
            
        case greaterOrEqualThan:
            if(l.floatValue >= r.floatValue){
                return YES;
            }else{
                return NO;
            }
            break;
        
        case lowerOrEqualThan:
            if(l.floatValue <= r.floatValue){
                return YES;
            }else{
                return NO;
            }
            break;
            
        case equal:
            if(l.floatValue == r.floatValue){
                return YES;
            }else{
                return NO;
            }
            break;
            
        case distinct:
            if(!(l.floatValue == r.floatValue)){
                return YES;
            }else{
                return NO;
            }
            break;
            
        default:
            return NO;
            break;
    }
    
    return NO;

}


-(BOOL)compareAsStringsLeft:(NSString *)l
                   andRight:(NSString *)r
{

    
    switch (_operator) {
        case greaterThan:
            if(l.length > r.length){
                return YES;
            }else{
                return NO;
            }
            break;
            
        case lowerThan:
            if(l.length < r.length){
                return YES;
            }else{
                return NO;
            }
            break;
            
        case greaterOrEqualThan:
            if(l.length >= r.length){
                return YES;
            }else{
                return NO;
            }
            break;
            
        case lowerOrEqualThan:
            if(l.length <= r.length){
                return YES;
            }else{
                return NO;
            }
            break;
            
        case equal:
            if([l isEqualToString:r]){
                return YES;
            }else{
                return NO;
            }
            break;
            
        case distinct:
            if(!([l isEqualToString:r])){
                return YES;
            }else{
                return NO;
            }
            break;
            
        default:
            return NO;
            break;
    }

    return NO;
}


-(BOOL)compareAsLocations{
    /*CLLocation * l = (CLLocation *)_leftToCompare;
    CLLocation * r = (CLLocation *)_rightToCompare;
    
    switch (_operator) {
            default:
            break;
    }*/
    return false;
}

-(void)setOperatorFronString:(NSString *)str{
    if([str isEqualToString:@">="]){
        _operator = greaterOrEqualThan;
    }else if([str isEqualToString:@"<="]){
        _operator = lowerOrEqualThan;
    }else if([str isEqualToString:@"<"]){
        _operator = lowerThan;
    }else if([str isEqualToString:@">"]){
        _operator = greaterThan;
    }else if([str isEqualToString:@"=="]){
        _operator = equal;
    }else if([str isEqualToString:@"!="]){
        _operator = distinct;
    }else{
        _operator = equal;
    }
}
-(NSString *)description{
    NSString * result = @"";
    
    result = [result stringByAppendingString:[NSString stringWithFormat:@"%@", [[_leftPart getValue]description]]];
    
    
    NSString * op = @"";
    if(_operator == equal){
        op = @" == ";
    }else if(_operator == greaterThan){
        op = @" > ";
    }else if(_operator == lowerThan){
        op = @" < ";
    }else if(_operator == greaterOrEqualThan){
        op = @" >= ";
    }else if(_operator == lowerOrEqualThan){
        op = @" <= ";
    }else if(_operator == distinct){
        op = @" != ";
    }
    
    result = [result stringByAppendingString:[NSString stringWithFormat:@" %@ ", op]];
    
    
    if([_rightPart isKindOfClass:[Object class]]){
        // result = [result stringByAppendingString:[NSString stringWithFormat:@"%@", [_attributeToInspect description]]];
    }else{
         result = [result stringByAppendingString:[NSString stringWithFormat:@"%@", [[_rightPart getValue]description]]];
    }
   
    
    result = [result stringByAppendingString:@" "];
    
    return result;
}

-(NSString *)getExpression{
    NSString * result = [self description];
    
    result = [result stringByAppendingString:@" -> "];
    
    BOOL isTrue = [self executeComparation];
    
    if(isTrue == YES){
        result = [result stringByAppendingString:@" TRUE "];
    }else{
        result = [result stringByAppendingString:@" FALSE "];
    }
    return result;
}
@end
