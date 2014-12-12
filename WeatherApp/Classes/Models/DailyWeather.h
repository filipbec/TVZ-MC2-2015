//
//  DailyWeather.h
//  WeatherApp
//
//  Created by Filip Beć on 06/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "JSONModel.h"
#import "CurrentWeather.h"

@protocol CurrentWeather;

@interface DailyWeather : JSONModel

@property (nonatomic, assign) NSInteger maxTemperature;
@property (nonatomic, assign) NSInteger minTemperature;

@property (nonatomic, strong) NSArray<CurrentWeather> *dailyConditions;

/// Dinamički property. Ne pojavljuje se u JSON-u pa stavljamo Ignore, dohvaća prvi element iz dailyConditions arraya koji u pravilu uvijek ima samo jedan element
@property (nonatomic, strong, readonly) CurrentWeather *dayCondition;

@end
