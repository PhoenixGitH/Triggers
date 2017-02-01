//
//  AppDelegate.h
//  TriggersV3
//
//  Created by Diego on 14/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManager.h"
#import "Trigger.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSTimer * timer;
}

@property (strong, nonatomic) UIWindow *window;


@property LocationManager * manager;

@property NSMutableArray * triggersArray;

@end

