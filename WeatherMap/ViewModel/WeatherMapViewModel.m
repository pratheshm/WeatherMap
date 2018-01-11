//
//  WeatherMapViewModel.m
//  WeatherMap
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import "WeatherMapViewModel.h"
#import "WeatherMapAPI.h"
#import "WeatherMapHelper.h"
#import "WeatherMapError.h"

// maximum rows allowed to be displayed in the weather info table
static NSInteger maxRows = 7;

@implementation WeatherMapViewModel

- (void)fetchWeatherInfoForCityName:(NSString *)cityName
                         completion:(void (^)(NSError* error))completionBlock {
    WeatherMapViewModel __weak *weakSelf = self;
    [WeatherMapAPI getInfoForCityName:cityName
                           completion:^(NSURLSessionDataTask *task, WeatherMap *weatherMap, NSError *error) {
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   if (error != nil) {
                                       completionBlock(error);
                                   } else {
                                       if (weatherMap != nil
                                           && [weatherMap.city length] > 0) {
                                           // once the weather info is retrieved successfully, write it to userdafaults
                                           // to log the recently retrieved city name so that it can be retrieved on opening the
                                           // app again.
                                           [WeatherMapHelper saveLastVisitedCity:weatherMap.city];
                                           
                                           weakSelf.cityText = [NSString stringWithFormat:@"%@, %@",weatherMap.city,weatherMap.country];
                                           weakSelf.cloudInfoText = weatherMap.cloudInfo;
                                           weakSelf.currentTempText = [NSString stringWithFormat:@"%@ °C",weatherMap.currentTemp];
                                           weakSelf.hiTempText = [NSString stringWithFormat:@"↑ %@ °C",weatherMap.highTemp];
                                           weakSelf.lowTempText = [NSString stringWithFormat:@"↓ %@ °C",weatherMap.lowTemp];
                                           weakSelf.currentDateText = weatherMap.currentDate;
                                           
                                           weakSelf.sunriseText = weatherMap.sunrise;
                                           weakSelf.sunsetText = weatherMap.sunset;
                                           weakSelf.humidityText = [NSString stringWithFormat:@"%@ %%", weatherMap.humidity];
                                           weakSelf.windText = [NSString stringWithFormat:@"%@ m/s",weatherMap.windSpeed];
                                           weakSelf.pressureText = [NSString stringWithFormat:@"%@ inHg",weatherMap.pressure];
                                           weakSelf.visibilityText = [NSString stringWithFormat:@"%@ mi",weatherMap.visibility];
                                           
                                           // trigger call to fetch the images after retrieving the icon name.
                                           [WeatherMapAPI getImageWithName:weatherMap.iconName
                                                                completion:^(NSURLSessionDataTask *task, id data, NSError *error) {
                                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                                        weakSelf.imageData = data;
                                                                        
                                                                        completionBlock(error);
                                                                    });
                                                                }];
                                       }
                                   }
                               });
                           }];
    
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [self.cityText length] > 0 ? maxRows : 0;
}

@end
