//
//  InputViewParams.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "InputViewParams.h"

@implementation InputViewParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    if (self) {
        NSString *text = [model getString:@"text_placeholder" defaultValue:@"Input..."];
        self.placeholder = text;
        
        NSString *color = [model getString:@"text_placeholderColor" defaultValue:@"#ffd6d6d6"];
        self.placeholderColor = [ColorUtils colorWithString:color];
    }
    return self;
}

@end
