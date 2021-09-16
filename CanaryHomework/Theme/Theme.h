//
//  Theme.h
//  CanaryHomework
//
//  Created by Kenetic Labs on 9/15/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - Default iPhone/iPad Size Constants
#define kScreenSize [[UIScreen mainScreen] bounds].size
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

#pragma mark - Custom Flat Colors
#define kColorFlatTurquoise [UIColor colorWithRed:26.0/255.0f green:188.0/255.0f blue:156.0/255.0f alpha:1.0]
#define kColorFlatGreen [UIColor colorWithRed:0.152 green:0.684 blue:0.373 alpha:1.000]
#define kColorFlatBlue [UIColor colorWithRed:41.0/255.0f green:128.0/255.0f blue:185.0/255.0f alpha:1.0]
#define kColorFlatDarkBlue [UIColor colorWithRed:41.0/255.0f green:128.0/255.0f blue:185.0/255.0f alpha:1.0]
#define kColorFlatMidnight [UIColor colorWithRed:44.0/255.0f green:62.0/255.0f blue:80.0/255.0f alpha:1.0]
#define kColorFlatPurple [UIColor colorWithRed:142.0/255.0f green:68.0/255.0f blue:173.0/255.0f alpha:1.0]
#define kColorFlatOrange [UIColor colorWithRed:243.0/255.0f green:156.0/255.0f blue:18.0/255.0f alpha:1.0]
#define kColorFlatRed [UIColor colorWithRed:192.0/255.0f green:57.0/255.0f blue:43.0/255.0f alpha:1.0]
#define kColorFlatSilver [UIColor colorWithRed:189.0/255.0f green:195.0/255.0f blue:199.0/255.0f alpha:1.0]
#define kColorFlatGray [UIColor colorWithRed:127.0/255.0f green:140.0/255.0f blue:141.0/255.0f alpha:1.0]
#define kColorFlatLightGray [UIColor colorWithRed:0.585 green:0.645 blue:0.653 alpha:1.000]
#define kColorFlatYellow [UIColor colorWithRed:0.917 green:0.771 blue:0.273 alpha:1.000]
#define kColorDarkGray [UIColor darkGrayColor]
#define kColorFlatBlack [UIColor colorWithRed:0.227 green:0.227 blue:0.227 alpha:1]
#define kColorFlatDarkOrange [UIColor colorWithRed:0.828 green:0.332 blue:0.000 alpha:1.000]

#pragma mark - Fonts Dynamic
#define kFontBoldWSize(x) [UIFont fontWithName:@"AvenirNext-Bold" size:x]
#define kFontBoldItalicWSize(x) [UIFont fontWithName:@"AvenirNext-BoldItalic" size:x]
#define kFontDemiBoldWSize(x) [UIFont fontWithName:@"AvenirNext-DemiBold" size:x]
#define kFontDemiBoldItalicWSize(x) [UIFont fontWithName:@"AvenirNext-DemiBoldItalic" size:x]
#define kFontMediumWSize(x) [UIFont fontWithName:@"AvenirNext-Medium" size:x]
#define kFontMediumItalicWSize(x) [UIFont fontWithName:@"AvenirNext-MediumItalic" size:x]

NS_ASSUME_NONNULL_BEGIN

@interface Theme : NSObject
+ (UIView *)deviceDetails:(NSDictionary *)readings;
+ (UILabel *)label:(CGRect)rect;
@end

NS_ASSUME_NONNULL_END
