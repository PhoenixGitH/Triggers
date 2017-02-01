//
//  ViewController.m
//  TriggersV3
//
//  Created by Diego on 14/12/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"


#import "Trigger.h"

//Testing purpose
#import "RACurrentDeviceLocation.h"
#import "CurrentDeviceLocationView.h"
#import "Condition.h"
#import "NumberValue.h"
#import "StringValue.h"
#import "RABatteryLevelNormalized.h"
#import "RABatteryLevelPercentage.h"
#import "RAGetCurrentSeconds.h"
#import "WAConsole.h"
#import "RADeviceOrientation.h"
#import "WAVisualAlert.h"
#import "WARest.h"
#import "Object.h"
#import "RAObject.h"
#import "RARest.h"
#import "DefaultView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dele = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    dele.manager = [[LocationManager alloc]init];
    
    
    
    //Test things
    [self testThings];
}

-(void)testThings{
    
    RARest * rar = [[RARest alloc] init];
    rar.baseURL = @"http://api.openweathermap.org/data/2.5/weather?";
    [rar addParamWithKey:@"q" andValue:@"Madrid"];
    [rar addParamWithKey:@"APPID" andValue:@"6faefe9c835124150d6f782947a4c722"];
    
    [rar addKeyToOrder:@"weather"];
    [rar addKeyToOrder:@"description"];
    
    
    DefaultView * dv = (DefaultView *)[rar getCreatingView];
    
    id result = [rar getValue];
    
    
    
    RACurrentDeviceLocation * racdl = [[RACurrentDeviceLocation alloc] init];
    CurrentDeviceLocationView * cdv = (CurrentDeviceLocationView *) [racdl getCreatingView];
    
    int r = 2;
    
/*
    
    Condition * cond = [[Condition alloc] init];
    
    //Object to test
    
    Object * testObj = [[Object alloc] init];
    
    ClassAttribute * ca1 = [[ClassAttribute alloc] init];
    ca1.name = @"name";
    ca1.currentValue = @"pepe";
    [testObj.attributes addObject:ca1];
    
    ClassAttribute * ca2 = [[ClassAttribute alloc] init];
    ca2.name = @"age";
    ca2.currentValue = [NSNumber numberWithInt:23];
    [testObj.attributes addObject:ca2];

    
    
    //Create a temp trigger
    Trigger * secTrigger = [[Trigger alloc] init];
    secTrigger.identifier = @"Checking seconds";
    
    
    //--------- SHOULD EXECUTE ONLY ONCE? ---------
    secTrigger.uniqueFire = NO;
    
    
    //--------- LEFT PART ---------
    
    /*RAObject * rao = [[RAObject alloc] init];
    rao.obj = testObj;
    rao.nameOfAttributeToCheck = @"age";
    cond.leftPart = rao;*/
    
    
    /*RAGetCurrentSeconds * gcs = [[RAGetCurrentSeconds alloc] init];
    cond.leftPart = gcs;*/
    
    
   /* RADeviceOrientation * rado = [[RADeviceOrientation alloc] init];
    cond.leftPart = rado;
    
    
    
    
    //--------- RIGHT PART ---------

    NumberValue * rval = [[NumberValue alloc] init];
    rval.value = [NSNumber numberWithInt:6];
    cond.rightPart = rval;
    
    
    //--------- SET THE CONDITION OPERATOR ---------
    cond.operator = equal;
    
    
    
    //--------- ADD THE CONDITION TO THE TRIGGER ---------
    [secTrigger.conditionsArray addObject:cond];
    
    
    //--------- ACTION TO EXECUTE ---------
    
    WAConsole * wtc = [[WAConsole alloc] init];
    wtc.textToPrint = @"OK";
    [secTrigger.actions addObject:wtc];
    
    /*
    WAVisualAlert * wava = [[WAVisualAlert alloc] init];
    wava.title = @"Info";
    wava.content = @"Phone is looking down";
    [secTrigger.actions addObject:wava];*/
    
    
    /*WARest * war = [[WARest alloc] init];
    war.baseURL = @"ht tps://diagrameditorserver.herokuapp.com/player/true";
    [secTrigger.actions addObject:war];*/
    
    
    
    //--------- ADD THIS TRIGGER TO THE ARRAY ---------
    //[dele.triggersArray addObject:secTrigger];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
