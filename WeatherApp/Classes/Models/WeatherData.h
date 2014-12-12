//
//  WeatherData.h
//  WeatherApp
//
//  Created by Filip Beć on 06/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "JSONModel.h"
#import "CurrentWeather.h"
#import "DailyWeather.h"


@protocol CurrentWeather;
@protocol DailyWeather;

@interface WeatherData : JSONModel

/// Sadrži uvijek samo jedan element, koristiti currentCondition property koji vraća taj element
@property (nonatomic, strong) NSArray<CurrentWeather> *currentConditions;
/// Array koji sardrži podatke o vremenu za sljedećih 5 dana
@property (nonatomic, strong) NSArray<DailyWeather> *dailyWeather;


/// Dinamički property. Ne pojavljuje se u JSON-u pa stavljamo Ignore, dohvaća prvi element iz currentConditions arraya koji u pravilu uvijek ima samo jedan element
@property (nonatomic, strong, readonly) CurrentWeather<Ignore> *currentCondition;

@end
