//
//  TextView.m
//  UIEngine
//
//  Created by BinGe on 2018/11/29.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "TextView.h"

@implementation TextView

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
