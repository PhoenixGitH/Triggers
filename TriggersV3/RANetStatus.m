//
//  RANetStatus.m
//  TriggersV3
//
//  Created by Miso on 9/2/17.
//  Copyright © 2017 Diego. All rights reserved.
//

#import "RANetStatus.h"

@implementation RANetStatus

-(id)getValue{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if (status == ReachableViaWiFi)
    {
        return @"Wifi";
    }
    else if (status == ReachableViaWWAN)
    {
        return @"3G";
    }
    return @"Nothing reachable";
}

@end
