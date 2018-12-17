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
        
        self.width = [self getWHValue:[model getString:@"view_width" defaultValue:@"auto"]];
        self.height = [self getWHValue:[model getString:@"view_height" defaultValue:@"auto"]];
        
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
    }
    return self;
}

- (NSInteger)getWHValue:(NSString *)stringValue {
    NSInteger value;
    if ([stringValue isEqualToString:@"full"]) {
        value = FULL;
    }
    else if ([stringValue isEqualToString:@"auto"]) {
        value = AUTO;
    }
    else {
        value = [stringValue integerValue];
    }
    return value;
}

@end
