# Coding Demo RR91521

[anchor](#Problems)
### Problems Found:
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
