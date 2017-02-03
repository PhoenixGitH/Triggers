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
#import "RABatteryStatus.h"
#import "RAGetCurrentSeconds.h"
#import "RAGetCurrentMinutes.h"
#import "RAGetCurrentDate.h"
#import "RAGetCurrentHour.h"
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
    
    // Extract the weather time via API.
    // Instead of using a name I would use coordinates.
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
    

    
    Condition * cond = [[Condition alloc] init];
    
    //Object to test
    
    /*Object * testObj = [[Object alloc] init];
    
    ClassAttribute * ca1 = [[ClassAttribute alloc] init];
    ca1.name = @"name";
    ca1.currentValue = @"pepe";
    [testObj.attributes addObject:ca1];
    
    ClassAttribute * ca2 = [[ClassAttribute alloc] init];
    ca2.name = @"age";
    ca2.currentValue = [NSNumber numberWithInt:23];
    [testObj.attributes addObject:ca2];*/

    
    
    //Create a temp trigger
    Trigger * secTrigger = [[Trigger alloc] init];
    secTrigger.identifier = @"Checking hour";
    
    
    //--------- SHOULD EXECUTE ONLY ONCE? ---------
    secTrigger.uniqueFire = NO;
    
    
    //--------- LEFT PART ---------
    
    /*RAObject * rao = [[RAObject alloc] init];
    rao.obj = testObj;
    rao.nameOfAttributeToCheck = (NSString *) @"name";
    cond.leftPart = rao;*/
    
    
    /*RAGetCurrentSeconds * gcs = [[RAGetCurrentSeconds alloc] init];
    cond.leftPart = gcs;*/
    
    //Trying new minute getter. WORKING
    /*RAGetCurrentMinutes * gcm = [[RAGetCurrentMinutes alloc] init];
    cond.leftPart = gcm;*/
    
    //Trying new hour getter. WORKING
    /*RAGetCurrentHour * gch = [[RAGetCurrentHour alloc] init];
    cond.leftPart = gch;*/
    
    // Trying new Date getter. Working.
    /*RAGetCurrentDate *gcd = [[RAGetCurrentDate alloc] init];
    cond.leftPart = gcd;*/
    
    // Working, only on real devices.
    /*RABatteryLevelPercentage *gcbp = [[RABatteryLevelPercentage alloc] init];
    cond.leftPart = gcbp;*/
    
    // Working
    /*RABatteryLevelNormalized *gcbn = [[RABatteryLevelNormalized alloc] init];
    cond.leftPart = gcbn;*/
    
    // Working too.
    RABatteryStatus *gcbs = [[RABatteryStatus alloc] init];
    cond.leftPart = gcbs;
    
    
   /*RADeviceOrientation * rado = [[RADeviceOrientation alloc] init];
    cond.leftPart = rado;*/
    
    
    
    
    //--------- RIGHT PART ---------

    // For float.
    /*NumberValue * rval = [[NumberValue alloc] init];
    rval.value = [NSNumber numberWithFloat: 0.92f];*/
    
    NumberValue * rval = [[NumberValue alloc] init];
    rval.value = [NSNumber numberWithInteger:2];
    
    /*StringValue * string = [[StringValue alloc] init];
    string.value = @"pepe";*/
    
    //Testing date
    /*StringValue *date = [[StringValue alloc] init];
    date.value = @"03/02/2017 13:06:40";*/
    
    cond.rightPart = rval;
    
    
    //--------- SET THE CONDITION OPERATOR ---------
    cond.operator = equal;
    
    
    
    //--------- ADD THE CONDITION TO THE TRIGGER ---------
    [secTrigger.conditionsArray addObject:cond];
    
    
    //--------- ACTION TO EXECUTE ---------
    
    /*WAConsole * wtc = [[WAConsole alloc] init];
    wtc.textToPrint = @"OK";
    [secTrigger.actions addObject:wtc];*/
    
    
    WAVisualAlert * wava = [[WAVisualAlert alloc] init];
    wava.title = @"Info";
    wava.content = @"The date is MM/DD/AAAA HH:mm:ss";
    [secTrigger.actions addObject:wava];
    
    
    /*WARest * war = [[WARest alloc] init];
    war.baseURL = @"https://diagrameditorserver.herokuapp.com/player/true";
    [secTrigger.actions addObject:war];*/
    
    
    
    //--------- ADD THIS TRIGGER TO THE ARRAY ---------
    [dele.triggersArray addObject:secTrigger];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
