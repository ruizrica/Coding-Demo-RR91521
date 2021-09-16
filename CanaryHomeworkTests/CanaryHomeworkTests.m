//
//  CanaryHomeworkTests.m
//  CanaryHomeworkTests
//
//  Created by Ricardo Ruiz on 9/15/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CoreDataController.h"
#import "Device+CoreDataClass.h"
#import "Reading+CoreDataClass.h"
#import "Util.h"

#pragma mark - Block Testing
#define setupBlock() __block BOOL blockFinished = NO;
#define awaitBlock() while (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0, true) && !blockFinished);
#define finishedBlock() blockFinished = YES;

@interface CanaryHomeworkTests : XCTestCase

@end

@implementation CanaryHomeworkTests

- (void)testLoadDevices {
    setupBlock()
    [[CoreDataController sharedCache] getAllDevices:^(BOOL completed, BOOL success, NSArray * _Nonnull objects) {
        if (success) {
            XCTAssertTrue(objects.count > 0);
            Device *testDevice = objects.firstObject;
            XCTAssertTrue([testDevice.name isKindOfClass:[NSString class]]);
            XCTAssertTrue([testDevice.deviceID isKindOfClass:[NSString class]]);
            XCTAssertTrue([testDevice.name isKindOfClass:[NSString class]]);
            finishedBlock()
        } else {
            NSLog(@"error loading devices...");
        }
    }];
    awaitBlock()
}

- (void)testGetReadingsForDevice {
    setupBlock()
    NSString *testDeviceId = @"2";
    [[CoreDataController sharedCache] getReadingsForDevice:testDeviceId completionBlock:^(BOOL completed, BOOL success, NSArray * _Nonnull objects) {
        if (success == YES) {
            Reading *testReading = objects.firstObject;
            XCTAssertTrue([testReading.type isKindOfClass:[NSString class]]);
            finishedBlock()
        } else {
            NSLog(@"Error Getting Readings...");
        }
    }];
    awaitBlock()
}

@end
