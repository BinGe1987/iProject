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
    if (!self.text) {
        return CGSizeZero;
    }
    NSDictionary *attributes = @{NSFontAttributeName:self.font,};
    CGSize maxSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    CGSize textSize = [self.text boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return textSize;
}


@end
