//
//  RAObject.m
//  TriggersV3
//
//  Created by Diego on 16/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "RAObject.h"
#import "ClassAttribute.h"

@implementation RAObject


- (instancetype)init
{
    self = [super init];
    if (self) {
        _obj = nil;
        _nameOfAttributeToCheck = @"";
        super.information = @"Returns the current value of the attribute";
    }
    return self;
}


-(id)getValue{
    if(_obj == nil){ //Is the object nil?
        return nil;
    }else{
        if(_nameOfAttributeToCheck.length == 0){ //Check if the attribute exists
            return nil;
        }else{
            
            for(ClassAttribute * ca in _obj.attributes){
                if([ca.name isEqualToString:_nameOfAttributeToCheck]){
                    return ca.currentValue;
                }
            }
            return nil; //This attribute doesn't exist
        }
    }
}


@end
