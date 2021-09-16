# Coding Demo RR91521
### [Summary](#Summary):
* *UI*
  * All ui elements are drawn from the **Theme** class
* *Util*
  * Calculate min, avg and max values from readings
  + (NSDictionary *)calculateReadings:(NSArray *)readings 
```Objective-C 
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
```

### [Problems Found](#Problems):
* *NSInvalidArgumentException*
  * Error loding api data into Core Data. 
  * **Solution:** Added data validation to CoreDataController and corrected type casting.<br/>
    **CoreDataController.m**<br/>
    -(NSArray *)validateObjects:(NSArray *)objectDictionaries
    
```Objective-C 
- (NSArray *)validateObjects:(NSArray *)objectDictionaries {
    
    NSNumberFormatter *numberValidator = [[NSNumberFormatter alloc] init];
    numberValidator.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSMutableArray *validatedObjectDictionaries = [[NSMutableArray alloc]init];
    for (NSDictionary *device in objectDictionaries) {
        NSMutableDictionary *validatedObject = [[NSMutableDictionary alloc]init];
        for (NSString *key in device.allKeys) {
            if ([key isEqualToString:@"value"]) {
                [validatedObject setValue:[numberValidator numberFromString:[NSString stringWithFormat:@"%@",device[key]]] forKey:[NSString stringWithFormat:@"%@",key]];
            } else {
                [validatedObject setValue:[NSString stringWithFormat:@"%@",device[key]] forKey:[NSString stringWithFormat:@"%@",key]];
            }
        }
        [validatedObjectDictionaries addObject:validatedObject];
    }
    return validatedObjectDictionaries;
}

```` 

    
* *getReadingsForDevice - Not Corrently Implemented*
  * getReadingsForDevice loads no data.
  * **Solution:** Implemented completion block with parameters<br/>
    **CoreDataController.m**<br/>
    completionBlock(YES, YES, objects);
    
 ```Objective-C 
 // getReadingsForDevice
completionBlock:^(NSArray *objects, NSError *error) {
                   // Below completionBlock was missing...
                    if (completionBlock != nil){
                        completionBlock(YES, YES, objects);
                    }
                }];

```` 
