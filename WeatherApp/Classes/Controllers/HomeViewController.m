//
//  HomeViewController.m
//  WeatherApp
//
//  Created by Filip Beć on 06/12/14.
//  Copyright (c) 2014 Infinum Ltd. All rights reserved.
//

#import "HomeViewController.h"
#import "WeatherTableViewCell.h"
#import "APIManager.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) WeatherData *weatherData;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // Na svako pojavljivanje ovog screena refreshamo podatke
    // možda možemo smisliti nešto bolje (cache), ali ovo radi
    [self refreshWeatherData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Refresh weather data

- (void)refreshWeatherData
{
#warning TODO - Prije slanja HTTP requesta provjeriti radi li location manager ili je li upisana lokacija u settingsima, pa to proslijediti kao location argument
    [APIManager getWeatherDataForLocation:@"Zagreb" success:^(WeatherData *weatherData) {
        // Spremimo podatke u property
        self.weatherData = weatherData;
        
        // Osvježimo tablicu s desne strane
        [self.tableView reloadData];
        
#warning TODO - Proslijediti podatke i osvježiti UI na controlleru koji prikazuje trenutno vrijeme
        
    } failure:^(NSError *error) {
        // Želimo korisnika obavijestiti da HTTP request nije završio uspješno
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something went wrong" message:@"Application could not load weather data. Please check your Internet connection and try again." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Try again", nil];
        [alert show];
    }];
}

#pragma mark - Table view data source delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weatherData.dailyWeather.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherTableViewCell" forIndexPath:indexPath];
    DailyWeather *weather = self.weatherData.dailyWeather[indexPath.row];
    
    cell.minTempLabel.text = [NSString stringWithFormat:@"%ld", (long)weather.minTemperature];
    cell.maxTempLabel.text = [NSString stringWithFormat:@"%ld", (long)weather.maxTemperature];
    
    cell.weatherDescriptionLabel.text = weather.dayCondition.weatherDescriptionString;
    
#warning TODO - Postaviti određenu sliku ovisno o vremenu i točno ime dana
    
    return cell;
}

@end
