//
//  WeatherMapAPI.h
//  WeatherMap
//
//  An api class to retrieve weather information/Image for the city searched.
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherMap.h"

@interface WeatherMapAPI : NSObject

/**
 * an api to get weather information for the city searched
 * @param cityName any city name in US
 * @param completionBlock block returning the weather forecase information
 */
+ (void)getInfoForCityName:(NSString *)cityName
                completion:(void (^)(NSURLSessionDataTask* task, WeatherMap *weatherMap, NSError* error))completionBlock;
/**
 * an api to get an image from the server by the name that is mentioned
 * @param name name of the image.
 * @param completionBlock block returning the image data
 */
+ (void)getImageWithName:(NSString *)name
              completion:(void (^)(NSURLSessionDataTask* task, NSData *data, NSError* error))completionBlock;

@end
