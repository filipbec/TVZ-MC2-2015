//
//  SettingsManager.m
//  WeatherApp
//
//  Created by Filip Beć on 29/11/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "SettingsManager.h"

#define kLocationNameKey        @"hr.tvz.LocationNameKey"
#define kAutoDefineLocationKey  @"hr.tvz.AutoDefineLocation"
#define kAutoRefreshKey         @"hr.tvz.AutoRefresh"

@implementation SettingsManager

@dynamic locationName, autoDefineLocation, autoRefresh;

+ (instancetype)sharedManager
{
    static SettingsManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SettingsManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
        [self.locationManager startUpdatingLocation];
    }
    return self;
}

#pragma mark - Dynamic properties

- (void)setLocationName:(NSString *)locationName
{
    if (locationName) {
        [[NSUserDefaults standardUserDefaults] setObject:locationName forKey:kLocationNameKey];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kLocationNameKey];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)locationName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kLocationNameKey];
}

- (void)setAutoDefineLocation:(BOOL)autoDefineLocation
{
    [[NSUserDefaults standardUserDefaults] setObject:@(autoDefineLocation) forKey:kAutoDefineLocationKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)autoDefineLocation
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kAutoDefineLocationKey] boolValue];
}

- (void)setAutoRefresh:(BOOL)autoRefresh
{
    [[NSUserDefaults standardUserDefaults] setObject:@(autoRefresh) forKey:kAutoRefreshKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)autoRefresh
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kAutoRefreshKey] boolValue];
}

@end
