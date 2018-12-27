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
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator= NO;
        self.pagingEnabled = YES;
        self.delegate = self;
    }
    return self;
}

- (void)scrollToPage:(NSInteger)index {
    CGPoint offset = self.contentOffset;
    offset.x = index * self.frame.size.width;
    [self setContentOffset:offset animated:YES];
}

- (UIView *)pageWithIndex:(NSInteger)index {
    for (UIView * page in self.subviews) {
        if (page.frame.origin.x == index * self.frame.size.width) {
            return page;
        }
    }
    return nil;
}

- (void)assignmentForMaxSize:(CGSize)size {
    [super assignmentForMaxSize:size];
    CGFloat width = size.width, height = size.height;
    CGFloat maxWidth = width, maxHeight = height;
    for (UIView *view in self.subviews) {
        [view assignmentForMaxSize:CGSizeMake(maxWidth, maxHeight)];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int pageNo= scrollView.contentOffset.x/scrollView.frame.size.width;
    if (self.viewPagerDelegate) {
        [self.viewPagerDelegate viewPager:self pageIndexDidChanged:pageNo];
    }
}

@end
