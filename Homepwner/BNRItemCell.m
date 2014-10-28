//
//  BNRItemCell.m
//  Homepwner
//
//  Created by Krzysztof Kula on 19/10/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemCell.h"

@interface BNRItemCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewWidthConstraint;

@end


@implementation BNRItemCell

- (IBAction)showImage:(id)sender
{
    if (self.actionBlock) {
        self.actionBlock();
    }
}

- (void)updateInterfaceForDynamicTypeSize
{
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.nameLabel.font = font;
    self.serialNumberLabel.font = font;
    self.valueLabel.font = font;
    
    static NSDictionary *imageSizeDictionary;
    
    if (!imageSizeDictionary) {
        imageSizeDictionary = @{
                                UIContentSizeCategoryExtraSmall: @40,
                                UIContentSizeCategorySmall: @40,
                                UIContentSizeCategoryMedium: @40,
                                UIContentSizeCategoryLarge: @40,
                                UIContentSizeCategoryExtraLarge: @45,
                                UIContentSizeCategoryExtraExtraLarge: @55,
                                UIContentSizeCategoryExtraExtraExtraLarge: @65
                                };
    }
    
    NSString *userSize = [[UIApplication sharedApplication] preferredContentSizeCategory];
    
    NSNumber *imageSize = imageSizeDictionary[userSize];
    self.imageViewHeightConstraint.constant = imageSize.floatValue;
    self.imageViewWidthConstraint.constant = imageSize.floatValue;
}

- (void)awakeFromNib
{
    [self updateInterfaceForDynamicTypeSize];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(updateInterfaceForDynamicTypeSize)
               name:UIContentSizeCategoryDidChangeNotification
             object:nil];
}

- (void)dealloc
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}

@end
