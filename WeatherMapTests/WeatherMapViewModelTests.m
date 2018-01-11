//
//  WeatherMapViewModelTests.m
//  WeatherMapTests
//
//  Testsuite to validate the view model class functionalities.
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WeatherMapViewModel.h"

@interface WeatherMapViewModelTests : XCTestCase

@property (nonatomic, strong) WeatherMapViewModel *weatherMapViewModel;

@end

@implementation WeatherMapViewModelTests

- (void)setUp {
    [super setUp];
    self.weatherMapViewModel = [[WeatherMapViewModel alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.weatherMapViewModel = nil;
}

- (void)testInitialization {
    WeatherMapViewModel *weatherMapViewModel = [[WeatherMapViewModel alloc] init];
    XCTAssertNotNil(weatherMapViewModel, @"The weathermap view model should not be nil.");
}

- (void)testWeatherInfoForValidCityName {
    NSString *cityName = @"Apex";
    [self.weatherMapViewModel fetchWeatherInfoForCityName:cityName
                                               completion:^(NSError *error) {
       if (error) {
           XCTFail(@"Error: %@", error.localizedDescription);
       } else {
           XCTAssertEqual(self.weatherMapViewModel.cityText, cityName, @"The weather map city passed should be equal to the city text retrieved and assigned to the view model.");
           XCTAssertEqual([self.weatherMapViewModel numberOfRowsInSection:1], 7, @"There should be seven weather meta data information for succesful weather info fetch.");
           XCTAssertNotNil(self.weatherMapViewModel.imageData, @"Valid image data should not be present for proper city search.");
       }
   }];
}

- (void)testWeatherInfoForInvalidCityName {
    NSString *cityName = @"Arcgbkjnm;";
    [self.weatherMapViewModel fetchWeatherInfoForCityName:cityName
                                               completion:^(NSError *error) {
       if (error) {
           XCTFail(@"Error: %@", error.localizedDescription);
       } else {
           XCTAssertNil(self.weatherMapViewModel.cityText, @"The weather map city text should be nil for an invalid city entry.");
           
           XCTAssertEqual([self.weatherMapViewModel numberOfRowsInSection:1], 0, @"No weather meta data information should be received/ constructed.");
           
           XCTAssertNil(self.weatherMapViewModel.imageData, @"Image data should not be available for improper city search.");
       }
   }];
}

@end
