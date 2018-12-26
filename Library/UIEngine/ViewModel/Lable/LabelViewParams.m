//
//  LableViewParams.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "LabelViewParams.h"
//#import "CommonHeader.h"

@implementation LabelViewParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    if (self) {
        NSInteger textSize = [model getInteger:@"text_size" defaultValue:12];
        self.font = UIFontMake(textSize);
        
        NSString *text = [model getString:@"text_src" defaultValue:@""];
        self.text = text;
        
        NSString *color = [model getString:@"text_color" defaultValue:@"#ff000000"];
        self.textColor = [ColorUtils colorWithString:color];
    }
    return self;
}

@end
