//
//  SecondViewController.m
//  MC2-radionica1
//
//  Created by Filip Beć on 22/11/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "SecondViewController.h"
#import "Person.h"
#import "NSString+Reverse.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

/// Property - možemo mu pristupati iz bilo koje metode ovog controllera pomoću self.person
@property (nonatomic, strong) Person *person;

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // primjer kako mijenjamo UI elemente iz koda
    self.label.text = @"test";
    
    // napravit ćemo neku osobu, primjer kako pozivamo metode iz controllera
    self.person = [self createNewPerson];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// #pragma mark se koristi za označavanje skupine metoda koje imaju sličnu funkciju
#pragma mark - Button action handlers

- (IBAction)showAlertButtonActionHandler:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert title"
                                                    message:@"Alert message."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)changeLabelTextButtonActionHandler:(id)sender
{
    NSString *reverseName = [self.person.firstName reverse];
    
    NSString *labelText = [NSString stringWithFormat:@"%@ %@ star je %ld godine. Njegovo ime napisano naopako: %@", self.person.firstName, self.person.lastName, (long)self.person.age, reverseName];
    
    self.label.text = labelText;
}

#pragma mark - Utility

- (Person *)createNewPerson
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:@"1990-11-15"];
   
    // varijabla person je lokalna i nema nikakve veze sa property person, njemu pristupamo sa self.person
    Person *person = [[Person alloc] initWithFirstName:@"Ivan"
                                              lastName:@"Horvat"
                                           dateOfBirth:date];
    return person;
}

@end
