//
//  Trigger.m
//  Triggers
//
//  Created by Diego on 28/11/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "Trigger.h"
#import "WriteAction.h"

@implementation Trigger



- (instancetype)init
{
    self = [super init];
    if (self) {
        _identifier = @"---";
        _name = @"unknown";
        _actions = [[NSMutableArray alloc] init];
        _conditionsArray = [[NSMutableArray alloc] init];
        _secsToRefresh = 1.0;
        _uniqueFire = false;
        _done = false;
    }
    return self;
}


-(void)addAction:(Action *)action{
    [_actions addObject:action];
}

-(void)addCondition:(Condition *)condition{
    [_conditionsArray addObject:condition];
}


//Return yes if all conditions are true
-(BOOL)shouldFire{
    
    BOOL result = false;
    
    
    if(_uniqueFire == TRUE){ // Check conditions only if not fired yet
        
        
        if(_done == false){ //Not done yet, check condition
            result = [self checkCondition];
        }else{ //It is done, return NO
            return false;
        }
        
    }else{ //Check everyThing always
        result = [self checkCondition];
    }
    
    
    //If result == TRUE, it will fire, so now we set it to done
    if(result == TRUE && _uniqueFire == TRUE){
        NSLog(@"This trigger is done. No more actions will be executed");
        _done = YES;
    }
    
    return result;
}

-(BOOL)checkCondition{

    //Check all the conditions of this trigger
    for(Condition * con in _conditionsArray){
        
        //For each condition check it result
        BOOL result = [con executeComparation];
        
        //If this condition is false, the trigger won't execute, so return FALSE
        if(result == FALSE){
            return NO;
        }
    }

    
    //Every condition return YES
    if(_conditionsArray.count == 0){
        return NO; //Don't fire trigger if it doesn't have conditions
    }else{
        return YES;
    }

}

-(void)executeActions{
    
    for(WriteAction * wa in _actions){
        [wa writeValue];
    }

}
@end
