//
//  Button.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "Button.h"

@implementation Button

- (CGSize)boundingSizeNeed {
    CGSize size = [self boundingTextSize];
    size.width = size.width + self.viewParams.paddingLeft + self.viewParams.paddingRight;
    size.height = size.height + self.viewParams.paddingTop + self.viewParams.paddingBottom;
    
    return size;
}

- (void)boundSizeChanged {
//    [self setEnlargeEdgeWithTop:self.viewParams.paddingTop
//                          right:self.viewParams.paddingRight
//                         bottom:self.viewParams.paddingBottom
//                           left:self.viewParams.paddingLeft];
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
