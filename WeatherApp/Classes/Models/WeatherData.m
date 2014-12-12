//
//  WeatherData.m
//  WeatherApp
//
//  Created by Filip Beć on 06/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "WeatherData.h"

@implementation WeatherData

@dynamic currentCondition;

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]
            initWithDictionary:@{@"current_condition": @"currentConditions",
                                 @"weather": @"dailyWeather"}];
}

#pragma mark - Dynamic getter

- (CurrentWeather<Ignore> *)currentCondition
{
    return [self.currentConditions firstObject];
}

@end
