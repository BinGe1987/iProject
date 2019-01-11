//
//  SearchController.m
//  APP
//
//  Created by BinGe on 2019/1/11.
//

#import "SearchController.h"
#import "SearchNavigationController.h"

@interface SearchController ()

@end

@implementation SearchController

+ (void)open {
    [UIViewController presentController:@"SearchController" animated:NO data:nil completion:nil];
    SearchController *vc = [SearchController new];
    SearchNavigationController *nv = [[SearchNavigationController alloc] initWithRootViewController:vc];
    UIViewController *topController = [UIViewController topViewController];
    [topController presentViewController:nv animated:NO completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    [self setContentViewWithXML:@"SearchController.xml"];
}



@end
