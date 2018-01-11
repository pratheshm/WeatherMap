//
//  WeatherMapTests.m
//  WeatherMapTests
//
//  Test suite to check if the model reflect the values assigned to it.
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WeatherMap.h"

@interface WeatherMapTests : XCTestCase

@property (nonatomic, strong) WeatherMap *weatherMap;

@end

@implementation WeatherMapTests

- (void)setUp {
    [super setUp];
    self.weatherMap = [[WeatherMap alloc] init];
    self.weatherMap.city = @"Apex";
    self.weatherMap.country = @"US";
    self.weatherMap.cloudInfo = @"Mist";
    self.weatherMap.currentTemp = @"25.7";
    self.weatherMap.highTemp = @"20";
    self.weatherMap.lowTemp = @"10";
    self.weatherMap.currentDate = @"Jan 11, 2018";
    self.weatherMap.sunrise = @"07:25 AM";
    self.weatherMap.sunset = @"05:22 PM";
    self.weatherMap.humidity = @"72";
    self.weatherMap.windSpeed = @"2.8";
    self.weatherMap.pressure = @"30.2";
    self.weatherMap.visibility = @"10";
    self.weatherMap.iconName =  @"50d";
}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.weatherMap = nil;
}

- (void)testWeatherMapValuesAssigned {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertEqual(self.weatherMap.city, @"Apex");
    XCTAssertEqual(self.weatherMap.country, @"US");
    XCTAssertEqual(self.weatherMap.cloudInfo, @"Mist");
    XCTAssertEqual(self.weatherMap.currentTemp, @"25.7");
    XCTAssertEqual(self.weatherMap.highTemp, @"20");
    XCTAssertEqual(self.weatherMap.lowTemp, @"10");
    XCTAssertEqual(self.weatherMap.currentDate, @"Jan 11, 2018");
    XCTAssertEqual(self.weatherMap.sunrise, @"07:25 AM");
    XCTAssertEqual(self.weatherMap.sunset, @"05:22 PM");
    XCTAssertEqual(self.weatherMap.humidity, @"72");
    XCTAssertEqual(self.weatherMap.windSpeed, @"2.8");
    XCTAssertEqual(self.weatherMap.pressure, @"30.2");
    XCTAssertEqual(self.weatherMap.visibility, @"10");
    XCTAssertEqual(self.weatherMap.iconName, @"50d");
}

@end
