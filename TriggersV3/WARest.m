//
//  WARest.m
//  TriggersV3
//
//  Created by Diego on 16/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "WARest.h"

@implementation WARest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _baseURL = @"";
        _dictionary = nil;
    }
    return self;
}


-(void)writeValue{
    
    
    
    NSURL *url = [NSURL URLWithString:_baseURL];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
   
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";


    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
                                                    
                                                    NSLog(@"Done");
                                                    NSLog(@"Error:%@", [error description]);
        
    }];
    
    [dataTask resume];
}



@end
