//
//  WeatherMapHeadCell.h
//  WeatherMap
//
//  Created by Prathesh Santh Muthuramalingam on 1/11/18.
//  Copyright © 2018 Prathesh Santh Muthuramalingam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherMapHeadCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *cityLabel;
@property (nonatomic, strong) IBOutlet UILabel *cloundInfoLabel;
@property (nonatomic, strong) IBOutlet UIImageView *weatherImageView;
@property (nonatomic, strong) IBOutlet UILabel *currentTempLabel;
@property (nonatomic, strong) IBOutlet UILabel *hiTempLabel;
@property (nonatomic, strong) IBOutlet UILabel *lowTempLabel;
@property (nonatomic, strong) IBOutlet UILabel *currentDateLabel;

@end
