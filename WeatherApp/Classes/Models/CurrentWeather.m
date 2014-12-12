//
//  CurrentWeather.m
//  WeatherApp
//
//  Created by Filip Beć on 06/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "CurrentWeather.h"

@implementation CurrentWeather

@dynamic weatherDescriptionString;

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]
            initWithDictionary:@{@"temp_C": @"temperature",
                                 @"weatherDesc": @"weatherDescriptions"}];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"temperature"]) {
        return YES;
    }
    return [super propertyIsOptional:propertyName];
}

- (NSString<Ignore> *)weatherDescriptionString
{
    WeatherDescription *weatherDesc = [self.weatherDescriptions firstObject];
    if (weatherDesc) {
        return weatherDesc.value;
    }
    return nil;
}

@end
