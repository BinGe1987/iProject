//
//  CommentItemView.m
//  APP
//
//  Created by BinGe on 2019/1/10.
//

#import "CommentItemView.h"

@implementation CommentItemView

- (instancetype)initWithViewParams:(ViewParams *)viewParams
{
    self = [super initWithViewParams:viewParams];
    if (self) {
        UIView *view = [UIView viewWithXML:@"CommentItem.xml" size:CGSizeZero];
        view.viewParams = viewParams;
        [self addView:view];
    }
    return self;
}

@end
