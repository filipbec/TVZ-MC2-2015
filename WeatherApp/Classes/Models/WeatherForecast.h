//
//  WeatherForecast.h
//  WeatherApp
//
//  Created by Filip Beć on 06/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "JSONModel.h"
#import "WeatherData.h"

@interface WeatherForecast : JSONModel

@property (nonatomic, strong) WeatherData *data;

@end
