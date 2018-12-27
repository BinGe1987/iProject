//
//  DiscoverViewController.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Discover.json" ofType:nil];
    [self setContentViewWithJSONPath:path];
    
    UIView *clubPage = [self findViewByName:@"page_club"];
    
    UIView *techPage = [self findViewByName:@"page_tech"];
    
    
}



@end
