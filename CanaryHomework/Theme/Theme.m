//
//  Theme.m
//  CanaryHomework
//
//  Created by Kenetic Labs on 9/15/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import "Theme.h"

@implementation Theme

+ (UIView *)deviceDetails:(NSDictionary *)readings {
    
    UIView *details = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    NSDictionary *temperatureReading = readings[@"temperatureReading"];
    NSDictionary *humidityReading = readings[@"humidityReading"];
        
    details.backgroundColor = [UIColor whiteColor];
        
    // Temp
    float xOffset = 20;
    float yOffsetTemp = 130;
    float labelHeight = 30;
    
    UILabel *temperatureLabel = [Theme label:CGRectMake(xOffset, yOffsetTemp-labelHeight, 200, labelHeight)];
    temperatureLabel.text = @"Temperature";
    temperatureLabel.backgroundColor = [UIColor clearColor];
    temperatureLabel.font = kFontBoldItalicWSize(18);
    temperatureLabel.textAlignment = NSTextAlignmentLeft;
    [details addSubview:temperatureLabel];

    UILabel *minTempLabel = [Theme label:CGRectMake(xOffset, yOffsetTemp, 60, labelHeight)];
    minTempLabel.text = @"MIN:";
    [details addSubview:minTempLabel];
    
    UILabel *minTemp = [Theme label:CGRectMake(xOffset, yOffsetTemp+30, 60, 30)];
    minTemp.backgroundColor = [UIColor clearColor];
    minTemp.text = @"-";
    if (temperatureReading[@"min"]) {
        minTemp.text = [NSString stringWithFormat:@"%@",temperatureReading[@"min"]];
    }
    [details addSubview:minTemp];
    
    
    UILabel *avgTempLabel = [Theme label:CGRectMake(xOffset+70, yOffsetTemp, 60, 30)];
    avgTempLabel.text = @"AVG:";
    [details addSubview:avgTempLabel];
    
    UILabel *avgTemp = [Theme label:CGRectMake(xOffset+70, yOffsetTemp+30, 60, 30)];
    avgTemp.backgroundColor = [UIColor clearColor];
    avgTemp.text = @"-";
    if (temperatureReading[@"min"]) {
        avgTemp.text = [NSString stringWithFormat:@"%@",temperatureReading[@"avg"]];
    }
    [details addSubview:avgTemp];
    
    UILabel *maxTempLabel = [Theme label:CGRectMake(xOffset+140, yOffsetTemp, 60, 30)];
    maxTempLabel.text = @"MAX:";
    [details addSubview:maxTempLabel];
    
    UILabel *maxTemp = [Theme label:CGRectMake(xOffset+140, yOffsetTemp+30, 60, 30)];
    maxTemp.backgroundColor = [UIColor clearColor];
    maxTemp.text = @"-";
    if (temperatureReading[@"min"]) {
        maxTemp.text = [NSString stringWithFormat:@"%@",temperatureReading[@"max"]];
    }
    [details addSubview:maxTemp];
    
    // Humidity
    float yOffset = yOffsetTemp+100;
    
    UILabel *humidityLabel = [Theme label:CGRectMake(xOffset, yOffsetTemp+70, 200, labelHeight)];
    humidityLabel.text = @"Humidity";
    humidityLabel.backgroundColor = [UIColor clearColor];
    humidityLabel.font = kFontBoldItalicWSize(18);
    humidityLabel.textAlignment = NSTextAlignmentLeft;
    [details addSubview:humidityLabel];
    
    UILabel *minHumidityLabel = [Theme label:CGRectMake(xOffset, yOffset, 60, 30)];
    minHumidityLabel.text = @"MIN:";
    [details addSubview:minHumidityLabel];
    
    UILabel *minHumidity = [Theme label:CGRectMake(xOffset, yOffset+30, 60, 30)];
    minHumidity.text = @"-";
    minHumidity.backgroundColor = [UIColor clearColor];
    if (temperatureReading[@"min"]) {
        minHumidity.text = [NSString stringWithFormat:@"%@",humidityReading[@"min"]];
    }
    [details addSubview:minHumidity];
    
    UILabel *avgHumidityLabel = [Theme label:CGRectMake(xOffset+70, yOffset, 60, 30)];
    avgHumidityLabel.text = @"AVG:";
    [details addSubview:avgHumidityLabel];
    
    UILabel *avgHumidity = [Theme label:CGRectMake(xOffset+70, yOffset+30, 60, 30)];
    avgHumidity.text = @"-";
    avgHumidity.backgroundColor = [UIColor clearColor];
    if (temperatureReading[@"avg"]) {
        avgHumidity.text = [NSString stringWithFormat:@"%@",humidityReading[@"avg"]];
    }
    [details addSubview:avgHumidity];
    
    UILabel *maxHumidityLabel = [Theme label:CGRectMake(xOffset+140, yOffset, 60, 30)];
    maxHumidityLabel.text = @"MAX:";
    [details addSubview:maxHumidityLabel];
    
    UILabel *maxHumidity = [Theme label:CGRectMake(xOffset+140, yOffset+30, 60, 30)];
    maxHumidity.text = @"-";
    maxHumidity.backgroundColor = [UIColor clearColor];
    if (temperatureReading[@"max"]) {
        maxHumidity.text = [NSString stringWithFormat:@"%@",humidityReading[@"max"]];
    }
    [details addSubview:maxHumidity];

    return details;
}

+ (UILabel *)label:(CGRect)rect {
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.backgroundColor = [kColorFlatBlack colorWithAlphaComponent:0.3];
    label.font = kFontDemiBoldItalicWSize(12);
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

@end
