//
//  UIView+ApplyViewParams.m
//  APP
//
//  Created by BinGe on 2019/1/11.
//

#import "UIView+ApplyViewParams.h"

@implementation UIView (ApplyViewParams)

- (void)applyViewParams:(ViewParams *)viewParams {
    self.alpha = viewParams.alpha;
    [self setViewVisibility:viewParams.visibility];
    NSString *background = viewParams.background;
    if (background) {
        [self setBackgroundWithString:background];
    }
    
    self.layer.masksToBounds = viewParams.masksToBounds;
    self.layer.borderColor = viewParams.borderColor.CGColor;
    if (viewParams.borderWidth) {
        self.layer.borderWidth = viewParams.borderWidth;
    }
    if (viewParams.borderRadius) {
        self.layer.cornerRadius = viewParams.borderRadius;
    }
    
    if (viewParams.shadowColor) {
        self.layer.shadowColor = viewParams.shadowColor.CGColor;
        self.layer.shadowOffset = CGSizeMake(viewParams.shadowOffsetX, viewParams.shadowOffsetY);
        self.layer.shadowRadius = viewParams.shadowRadius;
        self.layer.shadowOpacity = viewParams.shadowOpacity;
    }
}

- (void)setBackgroundWithString:(NSString *)background {
    if ([background hasPrefix:@"#"]) {
        self.backgroundColor = [ColorUtils colorWithString:background];
    }
    else if ([background hasPrefix:@"@"]) {
        background = [background substringFromIndex:1];
        UIImage *image = [UIImage imageNamed:background];
        self.layer.contents = (id)image.CGImage;
    }
}

@end
