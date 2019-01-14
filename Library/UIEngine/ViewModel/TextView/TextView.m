//
//  TextView.m
//  UIEngine
//
//  Created by BinGe on 2018/11/29.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "TextView.h"

@interface TextView()

@property (nonatomic, strong) UILabel *placeHolderLabel;

@end

@implementation TextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.placeHolderLabel = [[UILabel alloc] init];
        self.placeHolderLabel.numberOfLines = 0;
        [self addSubview:self.placeHolderLabel];
        
        [self setValue:self.placeHolderLabel forKey:@"_placeholderLabel"];
    }
    return self;
}

- (void)setPlaceholder:(NSString *)text {
    self.placeHolderLabel.text = text;
}

- (void)setPlaceholderColor:(UIColor *)color {
    self.placeHolderLabel.textColor = color;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self.placeHolderLabel setFont:font];
}

- (CGSize)boundingSizeNeed {
    CGSize size = [self boundingTextSize];
    size.width = size.width + self.viewParams.paddingLeft + self.viewParams.paddingRight;
    size.height = size.height + self.viewParams.paddingTop + self.viewParams.paddingBottom;
    return size;
}

//计算textview所需要的宽高
- (CGSize)boundingTextSize {
    if (!self.text) {
        return CGSizeZero;
    }
    NSDictionary *attributes = @{NSFontAttributeName:self.font,};
    CGSize maxSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    CGSize textSize = [self.text boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return CGSizeMake(textSize.width + self.font.pointSize/2, textSize.height + self.font.pointSize/2);
}

@end
