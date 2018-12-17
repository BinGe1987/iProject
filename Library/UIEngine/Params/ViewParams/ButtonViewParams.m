//
//  ButtonParams.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "ButtonViewParams.h"

@implementation ButtonViewParams

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
