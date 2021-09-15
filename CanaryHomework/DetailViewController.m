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
}

- (void)drawUI {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.view.backgroundColor = [UIColor whiteColor];

    });
}


@end
