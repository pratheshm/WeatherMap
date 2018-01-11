//
//  WeatherMapError.h
//  WeatherMap
//
//  Created by M_498678 on 1/11/18.
//  Copyright © 2018 M_498678. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * The codes of a WeatherMap-generated NSError
 */
typedef NS_ENUM(NSInteger, WeatherMapErrorCode) {
    /**
     * The error code for invalid city.
     */
    WeatherAppErrorCodeInvalidCity
};


/**
 * The domain of a Weather app generated NSError
 */
extern NSString *const WeatherMapErrorDomain;
