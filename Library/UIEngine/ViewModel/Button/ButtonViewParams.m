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
        CGFloat textSize = [model getFloat:@"text_size" defaultValue:12];
        self.font = UIFontMake(textSize);
        
        NSString *text = [model getString:@"text_src" defaultValue:@""];
        self.text = text;
        
        NSString *color = [model getString:@"text_color" defaultValue:@"#ff000000"];
        self.textColor = [ColorUtils colorWithString:color];
        
        NSString *colorSelected = [model getString:@"text_colorSelected" defaultValue:@"#ff000000"];
        self.textColorSelected = [ColorUtils colorWithString:colorSelected];
        
        NSString *imageNormal = [model getString:@"view_image" defaultValue:nil];
        if (imageNormal) {
            if ([imageNormal hasPrefix:@"@"]) {
                imageNormal = [imageNormal substringFromIndex:1];
                self.imageNormal = [UIImage imageNamed:imageNormal];
            }
        }
        NSString *imageSelected = [model getString:@"view_imageSelected" defaultValue:nil];
        if (imageSelected) {
            if ([imageSelected hasPrefix:@"@"]) {
                imageSelected = [imageSelected substringFromIndex:1];
                self.imageSelected = [UIImage imageNamed:imageSelected];
            }
        }
    }
    return self;
}

@end
