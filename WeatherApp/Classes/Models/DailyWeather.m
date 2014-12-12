//
//  DailyWeather.m
//  WeatherApp
//
//  Created by Filip Beć on 06/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "DailyWeather.h"

@implementation DailyWeather

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]
            initWithDictionary:@{@"maxtempC": @"maxTemperature",
                                 @"mintempC": @"minTemperature",
                                 @"hourly": @"dailyConditions"}];
}

@end
