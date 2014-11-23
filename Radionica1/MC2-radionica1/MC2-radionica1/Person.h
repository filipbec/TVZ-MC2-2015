//
//  Person.h
//  MC2-radionica1
//
//  Created by Filip Beć on 22/11/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

@property (nonatomic, strong) NSDate *dateOfBirth;
@property (nonatomic, assign, readonly) NSInteger age;

// deklaracija metode - u ovom slučaju to je posebna inicijalizacijska metoda
// instancetype je klučna riječ koja predtavlja klasu u kojoj definiramo metodu, u ovom slučaju je to klasa Person
- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                      dateOfBirth:(NSDate *)dateOfBirth;

@end
