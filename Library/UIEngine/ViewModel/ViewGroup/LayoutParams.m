//
//  LayoutParams.m
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "LayoutParams.h"

@implementation LayoutParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super  init];
    if (self) {
        self.marginLeft = [model getFloat:@"layout_marginLeft" defaultValue:0];
        self.marginRight = [model getFloat:@"layout_marginRight" defaultValue:0];
        self.marginTop = [model getFloat:@"layout_marginTop" defaultValue:0];
        self.marginBottom = [model getFloat:@"layout_marginBottom" defaultValue:0];
        
        NSInteger margin = [model getFloat:@"layout_margin" defaultValue:0];
        if (margin) {
            self.marginLeft = self.marginLeft ? self.marginLeft : margin;
            self.marginRight = self.marginRight ? self.marginRight : margin;
            self.marginTop = self.marginTop ? self.marginTop : margin;
            self.marginBottom = self.marginBottom ? self.marginBottom : margin;
            
        }
        
        self.fixTop = [model getBool:@"layout_fixTop" defaultValue:NO];
        if (self.fixTop) {
            self.marginTop += STATUSBARHIEGHT;
        }
    }
    return self;
}

@end
