//
//  TextViewParams.m
//  UIEngine
//
//  Created by BinGe on 2018/11/29.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "TextViewParams.h"
#import "CommonHeader.h"

@implementation TextViewParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    if (self) {
        NSInteger textSize = [model getInteger:@"text_size" defaultValue:12];
        self.font = UIFontMake(textSize);
        
        NSString *text = [model getString:@"text_src" defaultValue:@"Empty Text"];
        self.text = text;
        
        NSString *color = [model getString:@"text_color" defaultValue:@"#ff000000"];
        self.textColor = [UIColor colorWithString:color];
    }
    return self;
}

@end
