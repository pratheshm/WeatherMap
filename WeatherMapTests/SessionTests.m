//
//  SessionTests.m
//  WeatherMapTests
//
//  Test suite for session network class.
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WeatherMapConstants.h"

@interface SessionTests : XCTestCase

@property (nonatomic, strong) NSURLSession *defaultSession;

@end

@implementation SessionTests

- (void)setUp {
    [super setUp];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.defaultSession = [NSURLSession sessionWithConfiguration:configuration];
}

- (void)tearDown {
    self.defaultSession = nil;
    [super tearDown];
}

- (void)testCallToGetCityWeatherInfo {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Status code: 200"];
    
    NSString *URLString =
    [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&APPID=%@&units=metric", @"Apex", kAPIKey];
    NSURL *url = [NSURL URLWithString:URLString];
    [[self.defaultSession dataTaskWithURL:url
                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                            if (error) {
                                XCTFail(@"Error: %@", error.localizedDescription);
                            } else {
                                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                XCTAssertEqual([httpResponse statusCode], 200);
                                [expectation fulfill];
                            }
                        }] resume];
    [self waitForExpectationsWithTimeout:5.0
                                 handler:^(NSError *error) {
                                     if(error) {
                                         XCTFail(@"Expectation Failed with error: %@", error);
                                     }
                                 }];
}

- (void)testCallToGetWeatherIndicatorImage {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Status code: 200"];

    NSString *URLString = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", @"04d"];
    NSURL *url = [NSURL URLWithString:URLString];
    [[self.defaultSession dataTaskWithURL:url
                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                            if (error) {
                                XCTFail(@"Error: %@", error.localizedDescription);
                            } else {
                                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                XCTAssertEqual([httpResponse statusCode], 200);
                                [expectation fulfill];
                            }
                        }] resume];
    [self waitForExpectationsWithTimeout:5.0
                                 handler:^(NSError *error) {
                                     if(error) {
                                         XCTFail(@"Expectation Failed with error: %@", error);
                                     }
                                 }];
    
}

@end
