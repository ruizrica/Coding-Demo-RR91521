//
//  DetailViewController.m
//  CanaryHomework
//
//  Created by Michael Schroeder on 9/24/19.
//  Copyright © 2019 Michael Schroeder. All rights reserved.
//

#import "DetailViewController.h"
#import "Util.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [NSString stringWithFormat:@"About %@",self.device.name];
    [self drawUI];
//    NSLog(@"Device: %@",self.device);
}

- (void)drawUI {
        
    NSSet *readings = [Util calculateReadings:self.device.readings];
    NSLog(@"Readings %@",readings);


    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        // Temp
        float xOffset = 20;
        UILabel *minTemp = [Theme rrLabel:CGRectMake(xOffset, 110, 60, 30)];
        minTemp.text = @"MIN:";
        [self.view addSubview:minTemp];
        
        UILabel *avgTemp = [Theme rrLabel:CGRectMake(xOffset+70, 110, 60, 30)];
        avgTemp.text = @"AVG:";
        [self.view addSubview:avgTemp];
        
        UILabel *maxTemp = [Theme rrLabel:CGRectMake(xOffset+140, 110, 60, 30)];
        maxTemp.text = @"MAX:";
        [self.view addSubview:maxTemp];
        
        // Humidity
        float yOffset = 190;
        UILabel *minHumidity = [Theme rrLabel:CGRectMake(xOffset, yOffset, 60, 30)];
        minHumidity.text = @"MIN:";
        [self.view addSubview:minHumidity];
        
        UILabel *avgHumidity = [Theme rrLabel:CGRectMake(xOffset+70, yOffset, 60, 30)];
        avgHumidity.text = @"AVG:";
        [self.view addSubview:avgHumidity];
        
        UILabel *maxHumidity = [Theme rrLabel:CGRectMake(xOffset+140, yOffset, 60, 30)];
        maxHumidity.text = @"MAX:";
        [self.view addSubview:maxHumidity];

    });
}


@end
