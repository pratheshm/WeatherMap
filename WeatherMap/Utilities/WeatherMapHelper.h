//
//  WeatherMapHelper.h
//  WeatherMap
//
//. Helper class to perform calculations/processing/and other functionalities that can be resused.
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherMapHelper : NSObject

/**
 *  Save/Retrieve the last city visited.
 */
+ (NSString *)retrieveLastVisitedCity;
+ (void)saveLastVisitedCity:(NSString *)city;

/**
 *  Helper method to parse all the weather info values from the callback JSON response
 */
+ (NSString *)cloudInfoFromResponse:(NSDictionary *)response;
+ (NSString *)iconNameFromResponse:(NSDictionary *)response;
+ (NSString *)countryFromResponse:(NSDictionary *)response;
+ (NSString *)currentTemperatureFromResponse:(NSDictionary *)response;
+ (NSString *)highTemperatureFromResponse:(NSDictionary *)response;
+ (NSString *)lowTemperatureFromResponse:(NSDictionary *)response;
+ (NSString *)currentFormattedDateFromResponse:(NSDictionary *)response;
+ (NSString *)formattedSunriseTimeFromResponse:(NSDictionary *)response;
+ (NSString *)formattedSunsetTimeFromResponse:(NSDictionary *)response;
+ (NSString *)humidityFromResponse:(NSDictionary *)response;
+ (NSString *)windSpeedFromResponse:(NSDictionary *)response;
+ (NSString *)pressureFromResponse:(NSDictionary *)response;
+ (NSString *)visibilityFromResponse:(NSDictionary *)response;
+ (NSString *)formattedDatefromResponseTime:(NSString *)responseTime;
+ (NSString *)formattedTimefromResponseTime:(NSString *)responseTime;

@end
