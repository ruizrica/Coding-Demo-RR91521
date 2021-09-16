# Coding Demo RR91521

### Problems Found:
* *NSInvalidArgumentException*
  * Error loding api data into Core Data. 
  * **Solution:** Added data validation to CoreDataController and corrected type casting.
CoreDataController.m
(NSArray *)validateObjects:(NSArray *)objectDictionaries
