//
//  Util.m
//  CanaryHomework
//
//  Created by Kenetic Labs on 9/15/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import "Util.h"
#import "Reading+CoreDataClass.h"

@implementation Util

+ (NSDictionary *)calculateReadings:(NSArray *)readings {
    
    NSDictionary *calculatedReadings = @{};
    if (readings.count > 0) {
        
        float temperatureReading = 0.00;
        int tempReadingCount = 0;
        NSMutableArray *tempMinMax = [[NSMutableArray alloc]init];
        
        float humidityReading = 0.00;
        int humidReadingCount = 0;
        NSMutableArray *humidMinMax = [[NSMutableArray alloc]init];
        for (Reading* reading in readings) {
            if ([reading.type isEqualToString:@"temperature"]) {
                [tempMinMax addObject:[NSNumber numberWithFloat:(reading.value.floatValue)]];
                temperatureReading = (temperatureReading+reading.value.floatValue);
                tempReadingCount++;
            }
            if ([reading.type isEqualToString:@"humidity"]) {
                [humidMinMax addObject:[NSNumber numberWithFloat:(reading.value.floatValue)]];
                humidityReading = (humidityReading+reading.value.floatValue);
                humidReadingCount++;
            }
        }
        tempMinMax = [tempMinMax sortedArrayUsingSelector: @selector(compare:)].mutableCopy;
        humidMinMax = [tempMinMax sortedArrayUsingSelector: @selector(compare:)].mutableCopy;
        calculatedReadings = @{@"temperatureReading":@{ @"min": tempMinMax.firstObject, @"avg":[NSNumber numberWithFloat:(temperatureReading/tempReadingCount)], @"max":tempMinMax.lastObject,
        },@"humidityReading":@{  @"min": humidMinMax.firstObject, @"avg":[NSNumber numberWithFloat:(humidityReading/humidReadingCount)], @"max":humidMinMax.lastObject }};
    }
    return calculatedReadings;
}
@end
