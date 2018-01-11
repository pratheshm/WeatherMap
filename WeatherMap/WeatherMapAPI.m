//
//  WeatherMapAPI.m
//  WeatherMap
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import "WeatherMapAPI.h"
#import "WeatherMapHelper.h"
#import "SessionManager.h"
#import "WeatherMapError.h"
#import "WeatherMapConstants.h"

@implementation WeatherMapAPI

+ (void)getInfoForCityName:(NSString *)cityName
                completion:(void (^)(NSURLSessionDataTask* task, WeatherMap *weatherMap, NSError* error))completionBlock {
    NSString *URLString =
    [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&APPID=%@&units=metric", cityName, kAPIKey];
    [[SessionManager sharedInstance] GET:URLString
                                 success:^(NSURLSessionDataTask *task, id responseObject) {
                                     if (responseObject !=  nil) {
                                         NSString *city = responseObject[@"name"];
                                         if ([city length] > 0) {
                                             WeatherMap *weatherMapObj = [[WeatherMap alloc] init];
                                             weatherMapObj.cloudInfo = [WeatherMapHelper cloudInfoFromResponse:responseObject];
                                             weatherMapObj.iconName  = [WeatherMapHelper iconNameFromResponse:responseObject];
                                             weatherMapObj.city = city;
                                             weatherMapObj.country = [WeatherMapHelper countryFromResponse:responseObject];
                                             weatherMapObj.currentTemp = [WeatherMapHelper currentTemperatureFromResponse:responseObject];
                                             weatherMapObj.highTemp = [WeatherMapHelper highTemperatureFromResponse:responseObject];
                                             weatherMapObj.lowTemp = [WeatherMapHelper lowTemperatureFromResponse:responseObject];
                                             weatherMapObj.currentDate = [WeatherMapHelper currentFormattedDateFromResponse:responseObject];
                                             weatherMapObj.sunrise = [WeatherMapHelper formattedSunriseTimeFromResponse:responseObject];
                                             weatherMapObj.sunset = [WeatherMapHelper formattedSunsetTimeFromResponse:responseObject];
                                             weatherMapObj.humidity = [WeatherMapHelper humidityFromResponse:responseObject];
                                             weatherMapObj.windSpeed = [WeatherMapHelper windSpeedFromResponse:responseObject];
                                             weatherMapObj.pressure = [WeatherMapHelper pressureFromResponse:responseObject];
                                             weatherMapObj.visibility = [WeatherMapHelper visibilityFromResponse:responseObject];
                                             
                                             if (completionBlock != nil) {
                                                 completionBlock(task, weatherMapObj, nil);
                                             }
                                         } else {
                                             NSError *error =
                                             [NSError errorWithDomain:WeatherMapErrorDomain
                                                                 code:WeatherAppErrorCodeInvalidCity
                                                             userInfo:@{ NSLocalizedDescriptionKey: @"City name entered is invalid." }];
                                             if (completionBlock != nil) {
                                                 completionBlock(task, nil, error);
                                             }
                                         }
                                     }
                                 } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                     if (completionBlock != nil) {
                                         completionBlock(task, nil, error);
                                     }
                                 }];
    
}

+ (void)getImageWithName:(NSString *)name
              completion:(void (^)(NSURLSessionDataTask* task, NSData *data, NSError* error))completionBlock {
    NSString *URLString = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", name];
    [[SessionManager sharedInstance] GETData:URLString
                                     success:^(NSData *data, NSURLSessionDataTask *task, id responseObject) {
                                         if (completionBlock != nil) {
                                             completionBlock(task, data, nil);
                                         }
                                     } failure:^(NSData *data, NSURLSessionDataTask *task, NSError *error) {
                                         if (completionBlock != nil) {
                                             completionBlock(task, nil, error);
                                         }
                                     }];
}

@end
