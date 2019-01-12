//
//  ClassifyViewController.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClassifyViewController.h"
#import "ClassifyPresenter.h"
#import "ClassifyNvPresenter.h"

@interface ClassifyViewController ()

@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setContentViewWithXML:@"ClassifyViewController.xml"];
    
    [self addPresenter:[[ClassifyPresenter alloc] initWithView:[self findViewByName:@"page_club"]]];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH - 90, NVBARHIEGHT)];
    self.navigationItem.titleView = view;
    [self addPresenter:[[ClassifyNvPresenter alloc] initWithView:view]];
}

- (void)viewWillAppear:(BOOL)animated {
    
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
    return CGRectMake(insets.left, insets.top, width, height);
}

- (void)dealloc
{
    
}

@end
