//
//  APIManager.h
//  WeatherApp
//
//  Created by Filip Beć on 12/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#import "WeatherForecast.h"

@interface APIManager : NSObject

+ (AFHTTPRequestOperation *)getWeatherDataForLocation:(NSString *)location
                                              success:(void (^)(WeatherData *weatherData))success
                                              failure:(void (^)(NSError *error))failure;

@end
