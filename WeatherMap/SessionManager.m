//
//  SessionManager.m
//  WeatherMap
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import "SessionManager.h"

@interface SessionManager ()

@property (nonatomic, strong) NSURLSession *defaultSession;

@end

@implementation SessionManager

#pragma mark - Initializers

- (id)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.defaultSession = [NSURLSession sessionWithConfiguration:configuration];
    }
    
    return self;
}

+ (instancetype) sharedInstance {
    static SessionManager *sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - URLSession Utility Methods

- (void)GET:(NSString *)URLString
    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask *task, NSError* error))failure {
    NSURL *url = [NSURL URLWithString:URLString];
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask =
    [self.defaultSession dataTaskWithURL:url
                       completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            failure(dataTask, error);
        } else {
            NSError *error = nil;
            
            id responseObject = [NSJSONSerialization JSONObjectWithData:data
                                                                options:kNilOptions
                                                                  error:&error];
            success(dataTask, responseObject);
        }
    }];
    
    [dataTask resume];
}

- (void)GETData:(NSString *)URLString
        success:(void (^)(NSData *data, NSURLSessionDataTask *task, id responseObject))success
        failure:(void (^)(NSData *data, NSURLSessionDataTask *task, NSError* error))failure {
    NSURL *url = [NSURL URLWithString:URLString];
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask =
    [self.defaultSession dataTaskWithURL:url
                       completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                           if (error) {
                               failure(data, dataTask, error);
                           } else {
                               NSError *error = nil;
                               id responseObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                   options:kNilOptions
                                                                                     error:&error];
                               success(data, dataTask, responseObject);
                           }
                       }];
    
    [dataTask resume];
}

@end
