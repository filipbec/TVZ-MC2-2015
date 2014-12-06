//
//  HomeViewController.m
//  WeatherApp
//
//  Created by Filip Beć on 06/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "HomeViewController.h"
#import "WeatherTableViewCell.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://echo.jsontest.com/key/value/one/two"];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                            // handle response and data
                                            [self deserializeData:data];
                                        }];
    [task resume]; // start task
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tessting

- (void)deserializeData:(NSData *)data
{
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (error) {
        NSLog(@"ERROR: %@",error);
    } else {
        NSLog(@"%@", dict);
        NSLog(@"%@", dict[@"object"]);
        NSLog(@"%@", dict[@"nesto"]);
    }
}

#pragma mark - Table view data source delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherTableViewCell" forIndexPath:indexPath];
    return cell;
}



- (void)didSelectButtonForCell:(WeatherTableViewCell *)cell
{
    NSIndexPath *index = [self.tableView indexPathForCell:cell];
}

@end
