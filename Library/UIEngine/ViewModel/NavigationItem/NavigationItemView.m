//
//  NavigationItemView.m
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "NavigationItemView.h"

@implementation NavigationItemView

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self assignmentForMaxSize:frame.size];
    [self boundsAndRefreshLayout];
}

@end
