//
//  Button.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "Button.h"

@implementation Button

- (instancetype)init
{
    self = [Button buttonWithType:UIButtonTypeCustom];
    return self;
}

- (void)applyViewParams:(ViewParams *)viewParams {
    [super applyViewParams:viewParams];
    ButtonViewParams *params = (ButtonViewParams *)viewParams;
    self.titleLabel.font = params.font;
    [self setTitle:params.text forState:UIControlStateNormal];
    [self setTitleColor:params.textColor forState:UIControlStateNormal];
    [self setTitleColor:params.textColorSelected forState:UIControlStateSelected];
    [self setTitleColor:params.textColorSelected forState:UIControlStateHighlighted];
    if (params.imageNormal) {
        [self setImage:params.imageNormal forState:UIControlStateNormal];
    }
    if (params.imageSelected) {
        [self setImage:params.imageSelected forState:UIControlStateSelected];
        [self setImage:params.imageSelected forState:UIControlStateHighlighted];
    }
    
    if (params.backgroundSelected) {
        self.backgroundColor = [UIColor clearColor];
        
        [self setBackgroundImage:[ImageUtils imageWithColorHex:params.background size:CGSizeMake(10, 10)] forState:UIControlStateNormal];
        [self setBackgroundImage:[ImageUtils imageWithColorHex:params.backgroundSelected size:CGSizeMake(10, 10)] forState:UIControlStateSelected];
        [self setBackgroundImage:[ImageUtils imageWithColorHex:params.backgroundSelected size:CGSizeMake(10, 10)] forState:UIControlStateHighlighted];
    }
}

- (CGSize)boundingSizeNeed {
    CGSize size = [self boundingTextSize];
    size.width = size.width + self.viewParams.paddingLeft + self.viewParams.paddingRight;
    size.height = size.height + self.viewParams.paddingTop + self.viewParams.paddingBottom;
    
    return size;
}

- (void)boundSizeChanged {
    [self setEnlargeEdgeWithTop:self.viewParams.paddingTop
                          right:self.viewParams.paddingRight
                         bottom:self.viewParams.paddingBottom
                           left:self.viewParams.paddingLeft];
}

- (CGSize)boundingTextSize {
    if (!self.titleLabel.text) {
        return CGSizeZero;
    }
    NSDictionary *attributes = @{NSFontAttributeName:self.titleLabel.font,};
    CGSize maxSize = CGSizeMake(self.maxWidth, self.maxHeight);
    CGSize textSize = [self.titleLabel.text boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return textSize;
}

@end
