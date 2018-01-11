//
//  WeatherMapHelper.m
//  WeatherMap
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import "WeatherMapHelper.h"

@implementation WeatherMapHelper

+ (NSString *)retrieveLastVisitedCity {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"kLastVisitedCity"];
}

+ (void)saveLastVisitedCity:(NSString *)city {
    [[NSUserDefaults standardUserDefaults] setObject:city forKey:@"kLastVisitedCity"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)cloudInfoFromResponse:(NSDictionary *)response {
    NSArray *weatherInfo = response[@"weather"];
    NSString *cloudInfo = weatherInfo.firstObject[@"description"];
    
    return [cloudInfo capitalizedString];
}

+ (NSString *)iconNameFromResponse:(NSDictionary *)response {
    NSArray *weatherInfo = response[@"weather"];
    
    return weatherInfo.firstObject[@"icon"];
}

+ (NSString *)countryFromResponse:(NSDictionary *)response {
    return response[@"sys"][@"country"];
}

+ (NSString *)currentTemperatureFromResponse:(NSDictionary *)response {
    return [NSString stringWithFormat:@"%.1f",[response[@"main"][@"temp"] floatValue]];
}

+ (NSString *)highTemperatureFromResponse:(NSDictionary *)response {
    return [NSString stringWithFormat:@"%d",[response[@"main"][@"temp_max"] intValue]];
}

+ (NSString *)lowTemperatureFromResponse:(NSDictionary *)response {
    return [NSString stringWithFormat:@"%d",[response[@"main"][@"temp_min"] intValue]];
}

+ (NSString *)currentFormattedDateFromResponse:(NSDictionary *)response {
    NSString *formattedDate = nil;
    NSString *responseTime = [response[@"sys"][@"sunrise"] stringValue];
    if ([responseTime length] > 0) {
        formattedDate =
        [self formattedDatefromResponseTime:responseTime];
    }
    
    return formattedDate;
}

+ (NSString *)formattedSunriseTimeFromResponse:(NSDictionary *)response {
    NSString *formattedTime = nil;
    NSString *responseTime = [response[@"sys"][@"sunrise"] stringValue];
    if ([responseTime length] > 0) {
        formattedTime =
        [self formattedTimefromResponseTime:responseTime];
    }
    
    return formattedTime;
}

+ (NSString *)formattedSunsetTimeFromResponse:(NSDictionary *)response {
    NSString *formattedTime = nil;
    NSString *responseTime = [response[@"sys"][@"sunset"] stringValue];
    if ([responseTime length] > 0) {
        formattedTime =
        [self formattedTimefromResponseTime:responseTime];
    }
    
    return formattedTime;
}

+ (NSString *)humidityFromResponse:(NSDictionary *)response {
    return [response[@"main"][@"humidity"] stringValue];
}

+ (NSString *)windSpeedFromResponse:(NSDictionary *)response {
    return [NSString stringWithFormat:@"%.1f", [response[@"wind"][@"speed"] floatValue]];
}

+ (NSString *)pressureFromResponse:(NSDictionary *)response {
    int pressureInHpa = [response[@"main"][@"pressure"] intValue];
    float pressureInHg = 0.02952998751 * pressureInHpa;
    return [NSString stringWithFormat:@"%.1f", pressureInHg];
}

+ (NSString *)visibilityFromResponse:(NSDictionary *)response {
    int visibilityValue = [response[@"visibility"] intValue];
    float visibilityInMiles = visibilityValue / 1609.344;
    return [NSString stringWithFormat:@"%.0f", visibilityInMiles];
}

+ (NSString *)formattedDatefromResponseTime:(NSString *)responseTime {
    NSTimeInterval seconds = [responseTime doubleValue];
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)formattedTimefromResponseTime:(NSString *)responseTime {
    NSTimeInterval seconds = [responseTime doubleValue];
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    return [dateFormatter stringFromDate:date];
}

@end
