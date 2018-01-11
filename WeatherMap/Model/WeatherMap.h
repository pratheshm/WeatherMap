//
//  WeatherMap.h
//  WeatherMap
//
//  Model that holds the parsed json response from the server
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherMap : NSObject

@property (nonatomic,strong) NSString *city;
@property (nonatomic,strong) NSString *country;
@property (nonatomic,strong) NSString *cloudInfo;
@property (nonatomic,strong) NSString *currentTemp;
@property (nonatomic,strong) NSString *highTemp;
@property (nonatomic,strong) NSString *lowTemp;
@property (nonatomic,strong) NSString *currentDate;
@property (nonatomic,strong) NSString *sunrise;
@property (nonatomic,strong) NSString *sunset;
@property (nonatomic,strong) NSString *humidity;
@property (nonatomic,strong) NSString *windSpeed;
@property (nonatomic,strong) NSString *pressure;
@property (nonatomic,strong) NSString *visibility;
@property (nonatomic,strong) NSString *iconName;

@end
