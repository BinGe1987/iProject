//
//  ClassifyViewController.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClassifyViewController.h"
#import "ClassifyPresenter.h"

@interface ClassifyViewController ()

@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setContentViewWithXML:@"ClassifyViewController.xml"];
    
    [self addPresenter:[[ClassifyPresenter alloc] initWithView:[self findViewByName:@"page_club"]]];
}

- (void)onLayoutSubViewsCompleted {
    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    
    UIScrollView *sv;
    
    UIView *club = [self findViewByName:@"page_club"];
    sv = (UIScrollView *)[club findViewByName:@"table"];
    sv.contentInset = UIEdgeInsetsMake(topHeight,0,0,0);
    sv.contentOffset = CGPointMake(0, -topHeight);
}

- (CGRect)safeRect {
    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    UIEdgeInsets insets = self.view.safeAreaInsets;
    insets.top = 0;
    CGFloat width = size.width - insets.left - insets.right;
    CGFloat height = size.height - insets.top - insets.bottom;
    return CGRectMake(insets.left, insets.top, width, height - 44);
}

- (void)dealloc
{
    
}

@end
