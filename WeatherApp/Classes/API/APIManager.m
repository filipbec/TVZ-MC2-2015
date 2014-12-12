//
//  APIManager.m
//  WeatherApp
//
//  Created by Filip Beć on 12/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

+ (AFHTTPRequestOperation *)getWeatherDataForLocation:(NSString *)location success:(void (^)(WeatherData *weatherData))success failure:(void (^)(NSError *error))failure
{
    NSDictionary *params = @{@"q": location,
                             @"format": @"json",
                             @"num_of_days": @(6),
                             @"tp": @(24),
                             @"key": @"3f9356cce3ad483718ca9fed95dd0"};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestOperation *operation = [manager GET:@"https://api.worldweatheronline.com/free/v2/weather.ashx" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error;
        WeatherForecast *forecast = [[WeatherForecast alloc] initWithData:operation.responseData error:&error];
        
        if (error && failure) {
            failure(error);
        } else if (success) {
            // Primjetiti kako smo ovdje odma predali kao argument forecast.data jer u forecast i tako ništa drugo nemamo pa nema razloga da bude tako zapakirano
            success(forecast.data);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return operation;
}

@end
