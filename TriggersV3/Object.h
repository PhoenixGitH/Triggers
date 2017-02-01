//
//  JsonClass.h
//  DiagramEditor
//
//  Created by Diego on 7/9/16.
//  Copyright © 2016 Diego Vaquero Melchor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Object.h"
#import "ClassAttribute.h"

@interface Object : NSObject

@property NSString * name;

@property NSMutableArray * attributes; //ClassAtribute array

-(ClassAttribute *)attributeForName:(NSString *)n;

@end
