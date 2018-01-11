//
//  WeatherHelperTests.m
//  WeatherMapTests
//
//  Test suite for helper class to check the functionalities are working as expected.
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WeatherMapHelper.h"

@interface WeatherHelperTests : XCTestCase

@property (nonatomic, strong) NSDictionary *responseDict;

@end

@implementation WeatherHelperTests

- (void)setUp {
    [super setUp];

    NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
    NSString *commonDictionaryPath = [thisBundle pathForResource:@"TestData" ofType:@"plist"];
    if (commonDictionaryPath) {
        self.responseDict = [[NSDictionary alloc] initWithContentsOfFile:commonDictionaryPath];
    }
}

- (void)tearDown {
    [super tearDown];
    self.responseDict = nil;
}

- (void)testWeatherInfoDataTranslation {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertTrue([[WeatherMapHelper cloudInfoFromResponse:self.responseDict] isEqualToString:@"Light Intensity Drizzle"],
                  @"Cloud Info is as expected");
    XCTAssertTrue([[WeatherMapHelper iconNameFromResponse:self.responseDict] isEqualToString:@"09d"],
                  @"Icon name is as expected");
    XCTAssertTrue([[WeatherMapHelper countryFromResponse:self.responseDict] isEqualToString:@"US"],
                  @"Country is as expected");
    XCTAssertTrue([[WeatherMapHelper currentTemperatureFromResponse:self.responseDict] isEqualToString:@"13.0"],
                  @"Current Temp is as expected");
    XCTAssertTrue([[WeatherMapHelper highTemperatureFromResponse:self.responseDict] isEqualToString:@"14"],
                  @"High Temp is as expected");
    XCTAssertTrue([[WeatherMapHelper lowTemperatureFromResponse:self.responseDict] isEqualToString:@"12"],
                  @"Low temp is as expected");
    XCTAssertTrue([[WeatherMapHelper currentFormattedDateFromResponse:self.responseDict] isEqualToString:@"Jan 11, 2018"],
                  @"Current Date is as expected");
    XCTAssertTrue([[WeatherMapHelper formattedSunriseTimeFromResponse:self.responseDict] isEqualToString:@"08:05 AM"],
                  @"Sunrise Time is as expected");
    XCTAssertTrue([[WeatherMapHelper formattedSunsetTimeFromResponse:self.responseDict] isEqualToString:@"05:41 PM"],
                  @"Sunset Time is as expected");
    XCTAssertTrue([[WeatherMapHelper humidityFromResponse:self.responseDict] isEqualToString:@"93"],
                  @"Humidity is as expected");
    XCTAssertTrue([[WeatherMapHelper windSpeedFromResponse:self.responseDict] isEqualToString:@"3.1"],
                  @"Windspeed is as expected");
    XCTAssertTrue([[WeatherMapHelper pressureFromResponse:self.responseDict] isEqualToString:@"29.8"],
                  @"Pressure is as expected");
    XCTAssertTrue([[WeatherMapHelper visibilityFromResponse:self.responseDict] isEqualToString:@"6"],
                  @"Visibility is as expected");
}

@end
