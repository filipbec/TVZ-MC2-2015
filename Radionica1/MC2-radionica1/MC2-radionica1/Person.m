//
//  Person.m
//  MC2-radionica1
//
//  Created by Filip Beć on 22/11/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName dateOfBirth:(NSDate *)dateOfBirth
{
    // naša specijalna init metoda, uvijek mora pozivati [super init], u nekim drugim programskim jezicima ta metoda se zove konstruktor
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.dateOfBirth = dateOfBirth;
    }
    return self;
}

// override gettera age
- (NSInteger)age
{
    // kod preuzet sa SO - proučiti dokumentaciju tako da saznate kako radi
    NSDate *endingDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear;
    
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:self.dateOfBirth toDate:endingDate options:0];
    
    return [dateComponents year];
}

@end
