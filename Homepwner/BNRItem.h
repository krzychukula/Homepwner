//
//  BNRItem.h
//  RandomItems
//
//  Created by Krzysztof Kula on 25.07.2014.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

@import Foundation;

@interface BNRItem : NSObject <NSCoding>

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, copy) NSString *itemKey;
@property (nonatomic, strong) UIImage *thumbnail;



+ (instancetype)randomItem;

- (void)setThumbnailFromImage:(UIImage *)image;


//designated initializer for BNRItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;
- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)sNumber;
- (instancetype)initWithItemName:(NSString *)name;

@end
