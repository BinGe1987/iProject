//
//  TechDetailController.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "TechDetailController.h"

@interface TechDetailController ()

@end

@implementation TechDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setContentViewWithXML:@"TechDetail.xml"];
}

- (void)onLayoutSubViewsCompleted {
    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"table"];
    sv.contentInset = UIEdgeInsetsMake(topHeight,0,0,0);
    sv.contentOffset = CGPointMake(0, -topHeight);
}

- (CGRect)safeRect {
    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    UIEdgeInsets insets = self.view.safeAreaInsets;
    insets.top = 0;
    CGFloat width = size.width - insets.left - insets.right;
    CGFloat height = size.height - insets.top - insets.bottom;
    return CGRectMake(insets.left, insets.top, width, height);
}


@end
