//
//  SettingsManager.h
//  WeatherApp
//
//  Created by Filip Beć on 29/11/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface SettingsManager : NSObject <CLLocationManagerDelegate>

+ (instancetype)sharedManager;

@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, assign) BOOL autoDefineLocation;
@property (nonatomic, assign) BOOL autoRefresh;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end
