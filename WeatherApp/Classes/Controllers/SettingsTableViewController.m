//
//  SettingsTableViewController.m
//  WeatherApp
//
//  Created by Filip Beć on 29/11/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "SettingsManager.h"

@interface SettingsTableViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *locationNameTextField;
@property (weak, nonatomic) IBOutlet UISwitch *autoDefineLocationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoRefreshSwitch;

@end

@implementation SettingsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SettingsManager *manager = [SettingsManager sharedManager];
    
    self.locationNameTextField.text = manager.locationName;
    self.autoDefineLocationSwitch.on = manager.autoDefineLocation;
    self.autoRefreshSwitch.on = manager.autoRefresh;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - Switch actions

- (IBAction)autoDefineLocationActionHandler:(id)sender
{
    [SettingsManager sharedManager].autoDefineLocation = self.autoDefineLocationSwitch.on;
}

- (IBAction)autoRefreshSwitchActionHandler:(id)sender
{
    [SettingsManager sharedManager].autoRefresh = self.autoRefreshSwitch.on;
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [SettingsManager sharedManager].locationName = self.locationNameTextField.text;
    
    [textField resignFirstResponder];
    return NO;
}


@end
