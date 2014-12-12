//
//  CurrentWeather.h
//  WeatherApp
//
//  Created by Filip Beć on 06/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "JSONModel.h"
#import "WeatherDescription.h"

@protocol WeatherDescription;

@interface CurrentWeather : JSONModel

@property (nonatomic, assign) NSInteger temperature;
@property (nonatomic, assign) NSInteger weatherCode;
@property (nonatomic, strong) NSArray<WeatherDescription> *weatherDescriptions;

/// Dinamički property. Ne pojavljuje se u JSON-u pa stavljamo Ignore, dohvaća prvi element iz weatherDescriptions arraya koji u pravilu uvijek ima samo jedan element
@property (nonatomic, strong, readonly) NSString<Ignore> *weatherDescriptionString;

@end
