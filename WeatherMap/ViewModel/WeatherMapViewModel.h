//
//  WeatherMapViewModel.h
//  WeatherMap
//
//  View Model that does all the heavy lifting from the controller and also keep the
//  controller and views loosely coupled. Also, it is very efficient.
//  It take care of the network calls.
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherMapViewModel : NSObject

@property (nonatomic, strong) NSString *cityText;
@property (nonatomic, strong) NSString *cloudInfoText;
@property (nonatomic, strong) NSString *currentTempText;
@property (nonatomic, strong) NSString *hiTempText;
@property (nonatomic, strong) NSString *lowTempText;
@property (nonatomic, strong) NSString *currentDateText;
@property (nonatomic, strong) NSString *sunriseText;
@property (nonatomic, strong) NSString *sunsetText;
@property (nonatomic, strong) NSString *humidityText;
@property (nonatomic, strong) NSString *windText;
@property (nonatomic, strong) NSString *pressureText;
@property (nonatomic, strong) NSString *visibilityText;
@property (nonatomic, strong) NSData *imageData;

/**
 *  fetch the weather info based on the city name. It triggers a get call
 *  to retrieve this information.
 */
- (void)fetchWeatherInfoForCityName:(NSString *)cityName
                         completion:(void (^)(NSError* error))completionBlock;
/**
 *  inform the view controller the number of rows that needs to be shown after retrieving the results.
 */
- (NSInteger)numberOfRowsInSection:(NSInteger)section;

@end
