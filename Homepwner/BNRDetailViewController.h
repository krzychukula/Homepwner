//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Krzysztof Kula on 14.08.2014.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface BNRDetailViewController : UIViewController

@property (nonatomic, strong) BNRItem *item;

@end
