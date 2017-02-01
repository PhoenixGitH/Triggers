//
//  WAVisualAlert.m
//  TriggersV3
//
//  Created by Diego on 15/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "WAVisualAlert.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@implementation WAVisualAlert

- (instancetype)init
{
    self = [super init];
    if (self) {
        super.information = @"Shows an alert view";
    }
    return self;
}


-(void)writeValue{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:_title
                                 message:_content
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {

                                }];
    

    
    [alert addAction:yesButton];

    AppDelegate * dele = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    

    [dele.window.rootViewController presentViewController:alert animated:YES completion:nil];
}
@end
