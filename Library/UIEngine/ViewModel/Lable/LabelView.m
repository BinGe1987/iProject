//
//  LabelView.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "LabelView.h"

@implementation LabelView

- (CGSize)boundingSizeNeed {
    CGSize size = [self boundingTextSize];
    size.width = size.width + self.viewParams.paddingLeft + self.viewParams.paddingRight;
    size.height = size.height + self.viewParams.paddingTop + self.viewParams.paddingBottom;
    return size;
}

//计算textview所需要的宽高
- (CGSize)boundingTextSize {
    if (!self.text || self.maxWidth == 0 || self.maxHeight == 0) {
        return CGSizeZero;
    }
    CGFloat maxWidth = self.maxWidth;
    if (self.numberOfLines == 0) {
        maxWidth *= 10000000;
    } else {
        maxWidth *= self.numberOfLines;
    }
    CGSize maxSize = CGSizeMake(maxWidth, self.maxHeight);
    
    NSDictionary *attributes = @{NSFontAttributeName:self.font,};
    CGSize textSize = [self.text boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    if (textSize.width < self.maxWidth) {
        return textSize;
    } else {
        int lines = textSize.width / self.maxWidth + 1;
        CGFloat height = textSize.height * lines;
        while (height > self.maxHeight) {
            height = textSize.height * lines--;
        }
        return CGSizeMake(self.maxWidth, height);
    }
    
}

@end
