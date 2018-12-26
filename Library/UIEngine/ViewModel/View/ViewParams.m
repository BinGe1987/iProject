//
//  ViewParams.m
//  UIEngine
//
//  Created by BinGe on 2018/11/29.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "ViewParams.h"

@implementation ViewParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super init];
    if (self) {
        self.name = [model getString:@"view_name" defaultValue:@""];
        
        NSString *width = [model getString:@"view_width" defaultValue:@"auto"];
        if ([width isEqualToString:@"auto"]) {
            self.widthValueType = AUTO;
        } else if ([width isEqualToString:@"full"]) {
            self.widthValueType = FULL;
        } else if ([width hasSuffix:@"%"]) {
            self.widthValueType = PERCENT;
            self.width = [[width substringToIndex:[width length] -1] floatValue];
        } else {
            self.widthValueType = VALUE;
            self.width = [width floatValue];
        }
        NSString *height = [model getString:@"view_height" defaultValue:@"auto"];
        if ([height isEqualToString:@"auto"]) {
            self.heightValueType = AUTO;
        } else if ([height isEqualToString:@"full"]) {
            self.heightValueType = FULL;
        } else if ([height hasSuffix:@"%"]) {
            self.heightValueType = PERCENT;
            self.height = [[height substringToIndex:[width length] -1] floatValue];
        } else {
            self.heightValueType = VALUE;
            self.height = [height floatValue];
        }
        
        self.paddingLeft = [model getInteger:@"view_paddingLeft" defaultValue:0];
        self.paddingTop = [model getInteger:@"view_paddingTop" defaultValue:0];
        self.paddingRight = [model getInteger:@"view_paddingRight" defaultValue:0];
        self.paddingBottom = [model getInteger:@"view_paddingBottom" defaultValue:0];
        
        self.background = [model getString:@"view_background" defaultValue:@"#00FFFFFF"];
        
        self.alpha = [[model getString:@"view_alpha" defaultValue:@"1"] floatValue];
        
        NSString *visibility = [model getString:@"view_visibility" defaultValue:@"visible"];
        if ([visibility isEqualToString:@"gone"]) {
            self.visibility = ViewVisibilityGone;
        }
        else if ([visibility isEqualToString:@"invisible"]) {
            self.visibility = ViewVisibilityInvisible;
        }
        else {
            self.visibility = ViewVisibilityVisible;
        }
        
        self.borderRadius = [model getFloat:@"view_borderRadius" defaultValue:0];
        self.borderWidth = [model getFloat:@"view_borderWidth" defaultValue:0];
        NSString *colorString = [model getString:@"view_borderColor" defaultValue:@"#ff000000"];
        self.borderColor = [ColorUtils colorWithString:colorString];
    }
    return self;
}

@end
