//
//  DetailViewController.m
//  CanaryHomework
//
//  Created by Michael Schroeder on 9/24/19.
//  Copyright © 2019 Michael Schroeder. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [NSString stringWithFormat:@"About %@",self.device.name];
    [self drawUI];
    NSLog(@"Device: %@",self.device);
}

- (void)drawUI {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        float xOffset = 20;
        UILabel *min = [[UILabel alloc]initWithFrame:CGRectMake(xOffset, 110, 60, 30)];
        min.backgroundColor = [kColorFlatBlack colorWithAlphaComponent:0.3];
        min.font = kFontDemiBoldItalicWSize(14);
        min.text = @"MIN:";
        min.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:min];
        
        UILabel *avg = [[UILabel alloc]initWithFrame:CGRectMake(xOffset+70, 110, 60, 30)];
        avg.backgroundColor = [kColorFlatBlack colorWithAlphaComponent:0.3];
        avg.font = kFontDemiBoldItalicWSize(14);
        avg.text = @"AVG:";
        avg.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:avg];
        
        UILabel *max = [[UILabel alloc]initWithFrame:CGRectMake(xOffset+140, 110, 60, 30)];
        max.backgroundColor = [kColorFlatBlack colorWithAlphaComponent:0.3];
        max.font = kFontDemiBoldItalicWSize(14);
        max.text = @"MAX:";
        max.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:max];

    });
}


@end
