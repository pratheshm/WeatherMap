//
//  WeatherMapViewController.m
//  WeatherMap
//
//  Created by Prathesh Santh Muthuramalingam on 1/10/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import "WeatherMapViewController.h"
#import "WeatherMapViewModel.h"
#import "WeatherMapHeadCell.h"
#import "WeatherMapInfoCell.h"
#import "WeatherMapHelper.h"
#import "WeatherMapEnum.h"
#import "WeatherMapError.h"

/**
 *  Height of the head and info table view cell.
 */
static CGFloat kWeatherMapHeadCellHeight = 165;
static CGFloat kWeatherMapInfoCellHeight = 44;

@interface WeatherMapViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) IBOutlet UIView *instructionView;
@property (nonatomic, strong) IBOutlet UIView *activityProgressView;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) IBOutlet WeatherMapViewModel *weatherMapViewModel;
@property (nonatomic, assign) WeatherMapViewType weatherMapViewType;

/**
 *  Toggle between subviews under search bar based on the current state(before click/loading/after click)
 */
- (void)toggleView:(WeatherMapViewType)view;
/**
 *  Refresh the view with the recent validated weather info.
 */
- (void)loadCityWeatherInfo;

@end

@implementation WeatherMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // remove the undrawn separator table lines and register the table with the custom cell.
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"WeatherMapHeadCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"headCellIdentifier"];
    [self.tableView registerNib:[UINib nibWithNibName:@"WeatherMapInfoCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"infoCellIdentifier"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Auto load the last city searched upon app launch.
    NSString *lastCity = [WeatherMapHelper retrieveLastVisitedCity];
    if ([lastCity length] > 0) {
        // fill search bar with last retrieved city name
        self.searchBar.text = lastCity;
        
        // load the city weather for the city found
        [self loadCityWeatherInfo];
    } else {
        // if city not found, inform the user to type some city to get the weather information
        [self toggleView:WeatherMapInstructionView];
    }
}

#pragma mark - Tableview Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.weatherMapViewModel numberOfRowsInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.row == 0) ? kWeatherMapHeadCellHeight: kWeatherMapInfoCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // load the first/head cell with the title weather information
    if (indexPath.row == 0) {
        WeatherMapHeadCell *headCell =
        [tableView dequeueReusableCellWithIdentifier:@"headCellIdentifier"];
        if (headCell == nil) {
            headCell = [[WeatherMapHeadCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:@"headCellIdentifier"];
        }

        headCell.cityLabel.text = self.weatherMapViewModel.cityText;
        headCell.cloundInfoLabel.text = self.weatherMapViewModel.cloudInfoText;
        headCell.weatherImageView.image = [UIImage imageWithData:self.weatherMapViewModel.imageData];
        headCell.currentTempLabel.text = self.weatherMapViewModel.currentTempText;
        headCell.hiTempLabel.text = self.weatherMapViewModel.hiTempText;
        headCell.lowTempLabel.text = self.weatherMapViewModel.lowTempText;
        headCell.currentDateLabel.text = self.weatherMapViewModel.currentDateText;

        return headCell;
    }
    
    // load the all the other cells with the weather information details
    WeatherMapInfoCell *infoCell =
    [tableView dequeueReusableCellWithIdentifier:@"infoCellIdentifier"];
    if (infoCell == nil) {
        infoCell = [[WeatherMapInfoCell alloc] initWithStyle:UITableViewCellStyleDefault
                                             reuseIdentifier:@"infoCellIdentifier"];
    }
    switch (indexPath.row) {
        case WeatherMapSunriseInfoIndex:
            infoCell.keyLabel.text = NSLocalizedString(@"SunriseInfoKeyText", nil);
            infoCell.valueLabel.text = self.weatherMapViewModel.sunriseText;
            break;
        case WeatherMapSunsetInfoIndex:
            infoCell.keyLabel.text = NSLocalizedString(@"SunsetInfoKeyText", nil);
            infoCell.valueLabel.text = self.weatherMapViewModel.sunsetText;
            break;
        case WeatherMapHumidityInfoIndex:
            infoCell.keyLabel.text = NSLocalizedString(@"HumidityInfoKeyText", nil);
            infoCell.valueLabel.text = self.weatherMapViewModel.humidityText;
            break;
        case WeatherMapWindInfoIndex:
            infoCell.keyLabel.text = NSLocalizedString(@"WindInfoKeyText", nil);
            infoCell.valueLabel.text = self.weatherMapViewModel.windText;
            break;
        case WeatherMapPressureInfoIndex:
            infoCell.keyLabel.text = NSLocalizedString(@"PressureInfoKeyText", nil);
            infoCell.valueLabel.text = self.weatherMapViewModel.pressureText;
            break;
        case WeatherMapVisibilityInfoIndex:
            infoCell.keyLabel.text = NSLocalizedString(@"VisibilityInfoKeyText", nil);
            infoCell.valueLabel.text = self.weatherMapViewModel.visibilityText;
            break;
            
        default:
            break;
    }

    return infoCell;
}

#pragma mark - SearchBar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self loadCityWeatherInfo];
}

#pragma mark - Private Methods

- (void)toggleView:(WeatherMapViewType)view {
    switch (view) {
        case WeatherMapInstructionView:
            self.instructionView.hidden = NO;
            self.activityProgressView.hidden = YES;
            self.tableView.hidden = YES;
            break;
        case WeatherMapActivityProgressView:
            self.activityProgressView.hidden = NO;
            self.instructionView.hidden = YES;
            self.tableView.hidden = YES;
            break;
        case WeatherMapResultView:
            self.tableView.hidden = NO;
            self.activityProgressView.hidden = YES;
            self.instructionView.hidden = YES;
            break;
        default:
            self.instructionView.hidden = NO;
            self.activityProgressView.hidden = YES;
            self.tableView.hidden = YES;
            break;
    }
}

- (void)loadCityWeatherInfo {
    // show loading spinner while the network call is active
    [self toggleView:WeatherMapActivityProgressView];
    
    [self.weatherMapViewModel fetchWeatherInfoForCityName:self.searchBar.text
                                               completion:^(NSError *error) {
       if (error != nil) {
           // if error request user to enter a valid city
           [self toggleView:WeatherMapInstructionView];
           UIAlertController *alertVC = nil;
           if (error.code == WeatherAppErrorCodeInvalidCity) {
               alertVC =
               [UIAlertController alertControllerWithTitle:NSLocalizedString(@"NoCityMatchAlertTitle", nil)
                                                   message:NSLocalizedString(@"NoCityMatchAlertMessage", nil)
                                            preferredStyle:UIAlertControllerStyleAlert];
           } else {
               alertVC =
               [UIAlertController alertControllerWithTitle:NSLocalizedString(@"GeneralErrorAlertTitle", nil)
                                                   message:NSLocalizedString(@"GeneralErrorAlertMessage", nil)
                                            preferredStyle:UIAlertControllerStyleAlert];
           }
           UIAlertAction *ok =
           [UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", nil)
                                    style:UIAlertActionStyleDefault
                                  handler:nil];
           [alertVC addAction:ok];
           
           [self presentViewController:alertVC animated:YES completion:nil];
       } else {
           // reload the weather info in the view
           [self toggleView:WeatherMapResultView];
           [self.tableView reloadData];
       }
   }];
}

@end
