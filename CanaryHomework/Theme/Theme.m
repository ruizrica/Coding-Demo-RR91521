//
//  Theme.m
//  CanaryHomework
//
//  Created by Kenetic Labs on 9/15/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import "Theme.h"

@implementation Theme

+ (UILabel *)rrLabel:(CGRect)rect {
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.backgroundColor = [kColorFlatBlack colorWithAlphaComponent:0.3];
    label.font = kFontDemiBoldItalicWSize(14);
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

@end
