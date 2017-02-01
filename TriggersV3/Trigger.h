//
//  Trigger.h
//  Triggers
//
//  Created by Diego on 28/11/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Condition.h"
#import "Action.h"

@interface Trigger : NSObject

@property NSString * identifier;
@property NSString * name;
@property NSMutableArray * conditionsArray;
@property NSMutableArray * actions;
@property float secsToRefresh;

@property BOOL uniqueFire; //If this is set to TRUE, this Trigger will execute actions only once
@property BOOL done;

-(BOOL)shouldFire;
-(void)executeActions;
@end
