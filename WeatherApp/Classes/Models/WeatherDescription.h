//
//  WeatherDescription.h
//  WeatherApp
//
//  Created by Filip Beć on 06/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "JSONModel.h"

@interface WeatherDescription : JSONModel

@property (nonatomic, strong) NSString *value;
@end
