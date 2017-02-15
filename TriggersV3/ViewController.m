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
#import "RADeviceName.h"
#import "RAOperativeSystem.h"
#import "RAOSVersion.h"
#import "RADeviceModel.h"
#import "RADeviceID.h"
#import "WAConsole.h"
#import "RADeviceOrientation.h"
#import "RANetStatus.h"
#import "WAVisualAlert.h"
#import "WARest.h"
#import "Object.h"
#import "RAObject.h"
#import "RARest.h"
#import "GetWeather.h"
#import "DefaultView.h"
#import "WeatherPackage.h"
#import "RACountryCode.h"
#import "RACityName.h"



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
    
    /*// Extract the weather time via API.
    // Instead of using a name I would use coordinates.
    RARest * rar = [[RARest alloc] init];
    rar.baseURL = @"http://api.openweathermap.org/data/2.5/weather?";
    [rar addParamWithKey:@"q" andValue:@"Madrid"];
    [rar addParamWithKey:@"APPID" andValue:@"6faefe9c835124150d6f782947a4c722"];
    
    // Search for key inside the JSON
    [rar addKeyToOrder:@"weather"];
    // Search again, after the one up.
    [rar addKeyToOrder:@"description"];
     
    DefaultView * dv = (DefaultView *)[rar getCreatingView];
    
    id result = [rar getValue];*/
    
    
    //int r = 2;
    

    
    Condition * cond = [[Condition alloc] init];
    
    //Object to test
    
    /*Object * testObj = [[Object alloc] init];
    
    ClassAttribute * ca1 = [[ClassAttribute alloc] init];
    ca1.name = @"name";
    ca1.currentValue = @"pepe";
    [testObj.attributes addObject:ca1];
    
    ClassAttribute * ca2 = [[ClassAttribute alloc] init];
    ca2.name = @"age";
    ca2.currentValue = [NSNumber numberWithInt:2];
    [testObj.attributes addObject:ca2];*/

    
    
    //Create a temp trigger
    Trigger * secTrigger = [[Trigger alloc] init];
    secTrigger.identifier = @"Checking device name";
    
    
    //--------- SHOULD EXECUTE ONLY ONCE? ---------
    secTrigger.uniqueFire = NO;
    
    
    //--------- LEFT PART ---------
    
    /*RAObject * rao = [[RAObject alloc] init];
    rao.obj = testObj;
    rao.nameOfAttributeToCheck = (NSString *) @"age";
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
    /*RABatteryStatus *gcbs = [[RABatteryStatus alloc] init];
    cond.leftPart = gcbs;*/
    
    //trying devices. WORKING
    /*RADeviceName *rdn = [[RADeviceName alloc] init];
    cond.leftPart = rdn;
     
     //Trying orientation. Working.
     RADeviceOrientation * rado = [[RADeviceOrientation alloc] init];
     cond.leftPart = rado;
     
     RADeviceID *rdid = [[RADeviceID alloc] init];
     cond.leftPart = rdid;
    
    RADeviceModel *rdm = [[RADeviceModel alloc] init];
    cond.leftPart = rdm;
    
    RAOSVersion *rdv = [[RAOSVersion alloc] init];
    cond.leftPart = rdv;
    
    RAOperativeSystem *rdon = [[RAOperativeSystem alloc] init];
    cond.leftPart = rdon;*/
    
     //End devices type.
    
    //testing net status. Working.
    /*RANetStatus *net = [[RANetStatus alloc] init];
    cond.leftPart = net;*/
    
    // Testing Packages from Rest.
    // Weather working, with wherever you need to find.
    /*GetWeather *wea = [[GetWeather alloc] init];
    RARest *rar = [wea valueForCity:@"Madrid"];
    NSError *error;
    WeatherPackage *pack = [[WeatherPackage alloc] initWithDictionary: [rar getValue] error:&error];
    
    NumberValue *hum = [[NumberValue alloc] init];
    hum.value = [NSNumber numberWithInteger: [[pack getMain] getHumidity]];
    cond.leftPart = hum;*/
    // End weather.
    
    //Trying current Location. Working
    /*RACurrentDeviceLocation * racdl = [[RACurrentDeviceLocation alloc] init];
    CurrentDeviceLocationView * cdv = (CurrentDeviceLocationView *) [racdl getCreatingView];
    [cdv locateUser];
    self.view = cdv;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"%@", [racdl getValue]);
    });
     cond.leftPart = racdl; */

    // Trying countryCode. working
    /*RACountryCode *rcc = [[RACountryCode alloc] init];
    cond.leftPart = rcc;*/
    
    // Trying country. Working!
    RACityName *rcn = [[RACityName alloc] init];
    cond.leftPart = rcn;
    
    //--------- RIGHT PART ---------

    // For float.
    /*NumberValue * rval = [[NumberValue alloc] init];
    rval.value = [NSNumber numberWithFloat: 0.92f];*/
    
    // To Check numbers.
    /*NumberValue * rval = [[NumberValue alloc] init];
    rval.value = [NSNumber numberWithInteger:2];*/
    
    /*StringValue * string = [[StringValue alloc] init];
    string.value = @"pepe";*/
    
    //Testing date
    /*StringValue *date = [[StringValue alloc] init];
    date.value = @"03/02/2017 13:06:40";*/
    
    //Testing Weather description. Working.
    /*StringValue *weather = [[StringValue alloc] init];
    weather.value = @"few clouds";*/
    
    //cond.rightPart = weather;
    
    //Testing coordinates comparition. Working
    /*StringValue *location = [[StringValue alloc] init];
    location.value = @"10.9,4.5";
    
    cond.rightPart = location;*/
    
    
    //Testing device things. WORKING!
    /*StringValue *name = [[StringValue alloc] init];
    name.value = @"iOS";*/
    
    // Testing device connectivity. Working!
    /*StringValue *state = [[StringValue alloc] init];
    state.value = @"Wifi";
    cond.rightPart = state;*/
    
    //Testing a value of WeatherPackage. Working
    /*NumberValue *humidity = [[NumberValue alloc] init];
    humidity.value = [NSNumber numberWithInteger:100];
    cond.rightPart = humidity;*/
    
    // Testing country things. Working!
    StringValue *cou = [[StringValue alloc] init];
    cou.value = @"United States";
    cond.rightPart = cou;
    
    
    //--------- SET THE CONDITION OPERATOR ---------
    cond.operator = equal;
    
    
    
    //--------- ADD THE CONDITION TO THE TRIGGER ---------
    [secTrigger.conditionsArray addObject:cond];
    
    
    //--------- ACTION TO EXECUTE ---------
    
    
    // Trying multi actions. WORKING
    /*WAConsole * wtc = [[WAConsole alloc] init];
    wtc.textToPrint = @"OK";
    [secTrigger.actions addObject:wtc];*/
    
    
    WAVisualAlert * wava = [[WAVisualAlert alloc] init];
    wava.title = @"Info";
    wava.content = @"You are in US";
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
