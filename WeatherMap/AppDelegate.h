//
//  AppDelegate.h
//  WeatherMap
//
//  Created by Prathesh Santh Muthuramalingam on 1/10/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

