//
//  SessionManager.h
//  WeatherMap
//
//  A session manager class to contact the server/endpoint.
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SessionManager : NSObject

@property (nonatomic, readonly) NSURLSession *defaultSession;

/**
 * create shared instance of weather forecast session manager
 * @return sharedInstance shared instance of weather forecast session manager
 */
+ (instancetype)sharedInstance;

/**
 * get call that retrieves the url session data task
 * @param URLString an url string
 * @param success block that returns the success response object
 * @param failure block that returns the failure error object
 */
- (void)GET:(NSString *)URLString
    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask *task, NSError* error))failure;

/**
 * get call that retrieves the url session data and data task
 * @param URLString an url string
 * @param success block that returns the success response object
 * @param failure block that returns the failure error object
 */
- (void)GETData:(NSString *)URLString
        success:(void (^)(NSData *data, NSURLSessionDataTask *task, id responseObject))success
        failure:(void (^)(NSData *data, NSURLSessionDataTask *task, NSError* error))failure;

@end
