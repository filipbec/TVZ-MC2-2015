//
//  NSString+Reverse.m
//  MC2-radionica1
//
//  Created by Filip Beć on 22/11/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "NSString+Reverse.h"

@implementation NSString (Reverse)

- (instancetype)reverse
{
    // stvaramo novi string koji ima obrnut poredak slova
    int length = [self length];
    NSMutableString *reverse = [[NSMutableString alloc] init];
    
    for (int i = length-1; i >= 0; --i) {
        [reverse appendFormat:@"%c",[self characterAtIndex:i]];
    }
    return [NSString stringWithString:reverse];
}

@end
