//
//  ViewController.m
//  MC2-radionica1
//
//  Created by Filip Beć on 22/11/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    int x = 2;
    
    // NSString example
    NSString *string1 = @"Hello, World!";
    NSString *string2 = [NSString stringWithFormat:@"int: %ld, string: %@", (long)x, string1];
    NSLog(@"%@", string2); // ispit u konzolu, objekti uvijek imaju %@ format

    
    // NS(Mutable)Array example
    NSMutableArray *array = [NSMutableArray new];
    [array addObject:@"x"];
    [array addObject:string2];
    NSLog(@"%@", array);
    
    
    // NS(Mutable)Dictionary example
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    [dictionary setObject:string1 forKey:@"prvi"];
    dictionary[@"prvi"] = string1;  // isto kao linija iznad, skraćena sintaksa
    
    // NSNumber example
    NSNumber *numberX = [NSNumber numberWithInt:x];
    [array addObject:numberX];
    NSLog(@"%@", array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
