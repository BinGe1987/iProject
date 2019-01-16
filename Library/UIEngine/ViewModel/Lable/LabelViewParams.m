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
        CGFloat textSize = [model getFloat:@"text_size" defaultValue:12];
        self.font = UIFontMake(textSize);
        
        NSString *text = [model getString:@"text_src" defaultValue:@""];
        self.text = text;
        
        NSString *color = [model getString:@"text_color" defaultValue:@"#ff000000"];
        self.textColor = [ColorUtils colorWithString:color];
        
        self.lines = [model getInteger:@"text_lines" defaultValue:0];
        
        NSString *textGravity = [model getString:@"text_gravity" defaultValue:@"center"];
        if (textGravity) {
            if (self) {
                NSArray  *array = [[textGravity stringByReplacingOccurrencesOfString:@" " withString:@""]
                                   componentsSeparatedByString:@"|"];
                for (NSString *g in array) {
                    if ([g isEqualToString:@"center"]) {
                        self.textGravity |= TextGravityCenter;
                    }
                    else if ([g isEqualToString:@"left"]) {
                        self.textGravity |= TextGravityLeft;
                    }
                    else if ([g isEqualToString:@"top"]) {
                        self.textGravity |= TextGravityTop;
                    }
                    else if ([g isEqualToString:@"right"]) {
                        self.textGravity |= TextGravityRight;
                    }
                    else if ([g isEqualToString:@"bottom"]) {
                        self.textGravity |= TextGravityBottom;
                    }
                    else {
                        Log(@"wrong gravity : %@", g);
                    }
                }
                
            }
        }
    }
    return self;
}

@end
