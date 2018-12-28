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
        self.marginLeft = [model getInteger:@"layout_marginLeft" defaultValue:0];
        self.marginRight = [model getInteger:@"layout_marginRight" defaultValue:0];
        self.marginTop = [model getInteger:@"layout_marginTop" defaultValue:0];
        self.marginBottom = [model getInteger:@"layout_marginBottom" defaultValue:0];
        
        self.fixTop = [model getBool:@"layout_fixTop" defaultValue:NO];
        if (self.fixTop) {
            self.marginTop += (STATUSBARHIEGHT + 44);
        }
    }
    return self;
}

@end
