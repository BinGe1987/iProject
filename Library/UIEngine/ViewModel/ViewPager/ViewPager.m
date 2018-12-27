//
//  ViewPager.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "ViewPager.h"
#import "ScrollView.h"

@interface ViewPager()<UIScrollViewDelegate>

@end

@implementation ViewPager

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.showsVerticalScrollIndicator = NO;
//        self.showsHorizontalScrollIndicator= NO;
        self.pagingEnabled = YES;
    }
    return self;
}

- (void)assignmentForMaxSize:(CGSize)size {
    [super assignmentForMaxSize:size];
    CGFloat width = size.width, height = size.height;
    CGFloat maxWidth = width, maxHeight = height;
    for (UIView *view in self.subviews) {
        [view assignmentForMaxSize:CGSizeMake(maxWidth, maxHeight)];
//        if (self.orientation == ScrollOrientationVertical) {
//            maxHeight -= view.boundingSize.height;
//        } else {
//            maxWidth -= view.boundingSize.width;
//        }
    }
}

@end
