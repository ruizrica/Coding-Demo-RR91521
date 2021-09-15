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
        
        float xOffset = 20;
        UILabel *min = [Theme rrLabel:CGRectMake(xOffset, 110, 60, 30)];
        min.text = @"MIN:";
        [self.view addSubview:min];
        
        UILabel *avg = [Theme rrLabel:CGRectMake(xOffset+70, 110, 60, 30)];
        avg.text = @"AVG:";
        [self.view addSubview:avg];
        
        UILabel *max = [Theme rrLabel:CGRectMake(xOffset+140, 110, 60, 30)];
        max.text = @"MAX:";
        [self.view addSubview:max];

    });
}


@end
