//
//  CallModel.m
//  TriggersV3
//
//  Created by Miso on 6/3/17.
//  Copyright © 2017 Javier. All rights reserved.
//

#import "CallModel.h"

@implementation ParameterModel

-(id) initWithValues:(NSString *)name andValue:(NSString *)value{
    self = [self init];
    self.name = name;
    self.value = value;
    return self;
}

-(NSString *) getName{
    return _name;
}
-(NSString *) getValue{
    return _value;
}

@end

@implementation CallModel

-(id) initWithValues:(NSArray<ParameterModel> *)params andUrl:(NSString *)url andParam:(NSString *)param{
    self = [self init];
    self.params = params;
    self.url = url;
    self.parametro = param;
    return self;
}

-(NSString *) getUrl{
    return _url;
}
-(NSString *) getParametro{
    return _parametro;
}

-(NSArray *) getParams{
    return _params;
}

@end
