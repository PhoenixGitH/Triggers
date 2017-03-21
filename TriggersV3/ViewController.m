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
#import "APIModel.h"
#import "CallModel.h"



@interface ViewController ()

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    /*if (self){
        [self initializeForm];
    }*/
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    /*if (self){
        [self initializeForm];
    }*/
    return self;
}

- (void) typeForm: (NSArray *) parametros andSeccion: (XLFormSectionDescriptor *) seccion andCounter: (int) i{
    XLFormRowDescriptor * row;
    NSString *tipo = [parametros[i] getTipo];
    if([tipo caseInsensitiveCompare: @"String"] == NSOrderedSame){
        row = [XLFormRowDescriptor formRowDescriptorWithTag:[NSString stringWithFormat:@"textField%i",i] rowType:XLFormRowDescriptorTypeText title:[parametros[i] getNombre]];
        [row.cellConfigAtConfigure setObject:[parametros[i] getTipo] forKey:@"textField.placeholder"];
    }else if([tipo caseInsensitiveCompare: @"Double"] == NSOrderedSame){
        row = [XLFormRowDescriptor formRowDescriptorWithTag:[NSString stringWithFormat:@"textField%i",i] rowType:XLFormRowDescriptorTypeNumber title:[parametros[i] getNombre]];
        [row.cellConfigAtConfigure setObject:[parametros[i] getTipo] forKey:@"textField.placeholder"];
    }else if([tipo caseInsensitiveCompare: @"Float"] == NSOrderedSame){
        row = [XLFormRowDescriptor formRowDescriptorWithTag:[NSString stringWithFormat:@"textField%i",i] rowType:XLFormRowDescriptorTypeNumber title:[parametros[i] getNombre]];
        [row.cellConfigAtConfigure setObject:[parametros[i] getTipo] forKey:@"textField.placeholder"];
    }else if([tipo caseInsensitiveCompare: @"Double"] == NSOrderedSame){
        row = [XLFormRowDescriptor formRowDescriptorWithTag:[NSString stringWithFormat:@"textField%i",i] rowType:XLFormRowDescriptorTypeNumber title:[parametros[i] getNombre]];
        [row.cellConfigAtConfigure setObject:[parametros[i] getTipo] forKey:@"textField.placeholder"];
    }else{
        return;
    }
    [seccion addFormRow:row];

}

- (void) showSection: (APIModel*) api{
    
    XLFormSectionDescriptor *section = [self.form formSectionAtIndex:1];
    [self.form removeFormSection:section];
    [self fillNewSection: api];
}

- (void) fillNewSection: (APIModel*) api{
    
    XLFormSectionDescriptor *section = [XLFormSectionDescriptor formSection];
    section.title = @"Introduce los parametros necesarios";
    
    NSArray *parametros = [api getParams];
    
    for(int i = 0; i<parametros.count; i++){
     // Title
     NSLog(@"Value: %i", i);
     [self typeForm:parametros andSeccion:section andCounter:i];
    }
    XLFormRowDescriptor *row;
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeButton title:@"Send"];
    row.action.formBlock = ^(XLFormRowDescriptor * sender) {
        [self validate: api];
    };
    
    NSMutableArray* opt = [[NSMutableArray alloc] init];
    int i = 0;
    for(ValueModel* value in [api getValues]){
        XLFormOptionsObject* obj = [XLFormOptionsObject formOptionsObjectWithValue:@(i) displayText:[value getNombre]];
        [opt addObject:obj];
        i++;
    }
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"param" rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Value to get:" ];
    row.selectorOptions = opt;
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:nil displayText:@"Select a value"];
    
    [section addFormRow:row];

    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeButton title:@"Validate" ];
    
    row.action.formBlock = ^(XLFormRowDescriptor * sender){
        [self validate: api];
    };
    [section addFormRow:row];
    [self.form addFormSection:section];
    
}

- (void)initializeForm: /*(NSArray *) parametros Apis:*/(NSArray *) apis{ //andValues: (NSArray*) values{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"Ask for a value"];
    
    // First section
    section = [XLFormSectionDescriptor formSection];
    section.title = @"Seleccione un api";
    
    NSMutableArray* opt = [[NSMutableArray alloc] init];
    
    for(APIModel* value in apis){
        XLFormOptionsObject* obj = [XLFormOptionsObject formOptionsObjectWithValue:[value getName] displayText:[value getName]];
        [opt addObject:obj];
    }
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"API" ];
    row.selectorOptions = opt;
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Select a value"];
    [section addFormRow:row];
    [form addFormSection:section];
    
    // 2nd section
    section = [XLFormSectionDescriptor formSection];
    
    //[self fillNewSection:section andApi: apis[1]];
    
    [form addFormSection:section];
    
    self.form = form;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dele = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    dele.manager = [[LocationManager alloc]init];
    
}

- (void) viewDidAppear:(BOOL)animated{
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
    
    
    RARest * rar = [[RARest alloc] init];
    rar.baseURL = @"https://triggerstest.herokuapp.com/api/API/";
    
    // Search for key inside the JSON
    // [rar addKeyToOrder:@"params"];
    
    // DefaultView * dv = (DefaultView *)[rar getCreatingView];
    
    id result = [rar getValue];
    
    NSError *err;
    
    //NSDictionary* dict = [result dictionaryRepresentation];
    NSArray* api = [result objectForKey:@"APIs"];
    NSMutableArray* apis = [[NSMutableArray alloc] init];
    for (id key in api)
    {
        APIModel *api = [[APIModel alloc] initWithDictionary:key error:&err];
        [apis addObject:api];
    }
    
    
    //APIModel *api = [[APIModel alloc] initWithDictionary:result error:&err];
    
    
    [self initializeForm: apis];
    //[self showDialog: [[parametros objectAtIndex:0] getNombre] andParam:[[parametros objectAtIndex:0] getTipo] andGroup:group];
    
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
    //[dele.triggersArray addObject:secTrigger];
    
    
}

/*-(void) showDialog: (NSString *)name andParam:(NSString *)tipo andGroup:(dispatch_group_t) group{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *string = [NSString stringWithFormat:@"Introduce %@ del tipo %@",name,tipo];
        UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Parameter required"
                                 message:string
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
        UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Validate"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    NSString *texto = [[alert textFields][0] text];
                                    if([self validate:texto andType:tipo]){
                                        dispatch_group_leave(group);
                                    }else{
                                        [self showDialog: name andParam:tipo andGroup:group];
                                    }
                                }];
    
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Insert value";
        textField.secureTextEntry = YES;
        }];
        [alert addAction:yesButton];
        [self presentViewController:alert animated:NO completion:nil];
        NSLog(@"\n");
    });
}*/

- (NSDictionary *) getValues{
    NSMutableDictionary * result = [NSMutableDictionary dictionary];
    for (XLFormSectionDescriptor * section in self.form.formSections) {
        if (!section.isMultivaluedSection){
            for (XLFormRowDescriptor * row in section.formRows) {
                if (row.tag && ![row.tag isEqualToString:@""]){
                    [result setObject:(row.value ?: [NSNull null]) forKey:row.tag];
                }
            }
        }
        else{
            NSMutableArray * multiValuedValuesArray = [NSMutableArray new];
            for (XLFormRowDescriptor * row in section.formRows) {
                if (row.value){
                    [multiValuedValuesArray addObject:row.value];
                }
            }
            [result setObject:multiValuedValuesArray forKey:section.multivaluedTag];
        }
    }
    return result;
}


-(void) validate: (APIModel *) api{
    NSDictionary *dict = [self getValues];
    
    NSArray *parameters = [api getParams];
    NSMutableArray <ParameterModel*> *params = [[NSMutableArray alloc] init];
    
    for(int i = 0; i<parameters.count; i++){
        id val = [dict objectForKey:[NSString stringWithFormat:@"textField%i",i]];
        if(val == [NSNull null] || val == [NSDecimalNumber notANumber]){
            WAVisualAlert * wava = [[WAVisualAlert alloc] init];
            wava.title = @"Info";
            wava.content = @"Be sure to check every value type.";
            [wava writeValue];
            return;
        }
        ParameterModel *param = [[ParameterModel alloc] initWithValues:[parameters[i] getNombre] andValue:val];
        [params addObject:param];
    }
    
    NSArray *values = [api getValues];
    id get = [[dict objectForKey:@"param"] valueData];
    
    //for(int i = 0; i<values.count; i++){
        CallModel *call = [[CallModel alloc] initWithValues:params andUrl:[api getURL] andParam:[[values objectAtIndex:[get integerValue]] getRuta]];
        NSLog(@"Hola tenemos un api con valores: %@", call);
        NSData *data = [call toJSONData];
        WARest *rest = [[WARest alloc] init];
        rest.baseURL = @"http://triggerstest.herokuapp.com/api/Call";
        rest.data = data;
        [rest writeValue];
    //}
    
    
}

- (void) formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)formRow oldValue:(id)oldValue newValue:(id)newValue{
    if([formRow.title  isEqual: @"API"]){
        RARest * rar = [[RARest alloc] init];
        rar.baseURL = [@"https://triggerstest.herokuapp.com/api/API/" stringByAppendingString: [newValue valueData]];
        id result = [rar getValue];
        NSError *err;
        APIModel *api = [[APIModel alloc] initWithDictionary:result error:&err];
        [self showSection:api];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
