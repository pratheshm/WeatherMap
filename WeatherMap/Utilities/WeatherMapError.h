//
//  WeatherMapError.h
//  WeatherMap
//
//  Log the error domain and all the associated error information here.
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
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
