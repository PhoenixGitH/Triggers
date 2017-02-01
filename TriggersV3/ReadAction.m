//
//  ReadAction.m
//  TriggersV2
//
//  Created by Diego on 5/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "ReadAction.h"

#import <UIKit/UIKit.h>
#import "DefaultView.h"


@implementation ReadAction


-(UIView *)getCreatingView{
    NSArray * arr =[[NSBundle mainBundle] loadNibNamed:@"DefaultView" owner:self options:nil];
    DefaultView * view = (DefaultView *) [arr firstObject];
    
    view.titleLabel.text = _name;
    view.informationTextView.text = _information;
    return view;
}



@end
