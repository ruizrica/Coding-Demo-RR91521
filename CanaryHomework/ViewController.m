//
//  ViewController.m
//  CanaryHomework
//
//  Created by Michael Schroeder on 9/19/19.
//  Copyright © 2019 Michael Schroeder. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "CoreDataController.h"
#import "Device+CoreDataProperties.h"
#import "Theme.h"

@interface ViewController ()

@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) UILayoutGuide *safeArea;
@property(nonatomic, retain) NSArray *devices;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Devices";
    // Do any additional setup after loading the view.
    self.safeArea = self.view.layoutMarginsGuide;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTableView];
    [self loadDevices];
}

- (void)setupTableView {
    self.tableView = [UITableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.tableView];
    [[self.tableView.topAnchor constraintEqualToAnchor:self.safeArea.topAnchor] setActive:true];
    [[self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:true];
    [[self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor] setActive:true];
    [[self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:true];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}
#pragma mark - Device Data

- (void)loadDevices {
 
    [[CoreDataController sharedCache] getAllDevices:^(BOOL completed, BOOL success, NSArray * _Nonnull objects) {
        if (success) {
            self.devices = objects;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        } else {
            NSLog(@"error loading devices...");
        }
    }];
}

#pragma mark - UITableView Data Source

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    Device *device = [self.devices objectAtIndex:indexPath.row];
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",device.name];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    int count = 0;
    if (self.devices.count == 0) {
        UILabel *noDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        noDataLabel.text = @"Loading...".uppercaseString;
        noDataLabel.textColor = [UIColor systemGray2Color];
        noDataLabel.font = [UIFont fontWithName:@"AvenirNext-BoldItalic" size:20.0f];
        noDataLabel.textAlignment = NSTextAlignmentCenter;
        tableView.backgroundView = noDataLabel;
    } else {
        count = 1;
        tableView.backgroundView = nil;
    }
    return count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.devices.count;
}

#pragma mark UITableView Delegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Device *device = [self.devices objectAtIndex:indexPath.row];
    [[CoreDataController sharedCache] getReadingsForDevice:device.deviceID completionBlock:^(BOOL completed, BOOL success, NSArray * _Nonnull objects) {
        if (success == YES) {
            DetailViewController *dc = [DetailViewController new];
            dc.device = device;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController pushViewController:dc animated:YES];
            });
        } else {
            NSLog(@"Error Getting Readings...");
        }
    }];
}

@end
