//
//  SearchController.m
//  APP
//
//  Created by BinGe on 2019/1/11.
//

#import "SearchController.h"
#import "SearchNavigationController.h"
#import "SearchPresenter.h"

@interface SearchController ()

@end

@implementation SearchController

+ (void)open {
//    [UIViewController presentController:@"SearchController" animated:NO data:nil completion:nil];
    SearchController *vc = [SearchController new];
   
    SearchNavigationController *nv = [[SearchNavigationController alloc] initWithRootViewController:vc];
    UIViewController *topController = [UIViewController topViewController];
    [nv setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [topController presentViewController:nv animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationColor:[ColorUtils colorWithString:@"#f4f4f4"]];
    [self setNavigationXML:@"SearchNavigation.xml"];
    
    [self setContentViewWithXML:@"SearchController.xml"];
    
    [self addPresenter:[[SearchPresenter alloc] initWithView:self.view]];
    
    
    
}

- (void)onLayoutSubViewsCompleted {
    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"table"];
    sv.contentInset = UIEdgeInsetsMake(topHeight,0,0,0);
    sv.contentOffset = CGPointMake(0, -topHeight);
}

@end
