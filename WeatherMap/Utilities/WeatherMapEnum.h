//
//  WeatherMapEnum.h
//  WeatherMap
//
//  Log all the weather map related enum types here
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#ifndef WeatherMapEnum_h
#define WeatherMapEnum_h

/**
 *  Enums for Weather Map app.
 */
typedef NS_ENUM(NSInteger, WeatherMapViewType) {
    /**
     *  View type that request user to input us city
     */
    WeatherMapInstructionView,
    /**
     *  View type to display the progress of call request activity
     */
    WeatherMapActivityProgressView,
    /**
     *  View type to display the results
     */
    WeatherMapResultView
};

/**
 *  Enums for Weather Map Information Cell Index.
 */
typedef NS_ENUM(NSInteger, WeatherMapInfoCellIndex) {
    /**
     *  cell index that indicate sunrise info
     */
    WeatherMapSunriseInfoIndex = 1,
    /**
     *  cell index that indicate sunset info
     */
    WeatherMapSunsetInfoIndex = 2,
    /**
     *  cell index that indicate humidity infos
     */
    WeatherMapHumidityInfoIndex = 3,
    /**
     *  cell index that indicate wind info
     */
    WeatherMapWindInfoIndex = 4,
    /**
     *  cell index that indicate pressure info
     */
    WeatherMapPressureInfoIndex = 5,
    /**
     *  cell index that indicate visibility info
     */
    WeatherMapVisibilityInfoIndex = 6
};

#endif /* WeatherMapEnum_h */
