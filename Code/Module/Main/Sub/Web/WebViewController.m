//
//  WebViewController.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.title = self.intentData[@"title"];
//    self.navigationController.navigationBarHidden = YES;
    
//    self.view.backgroundColor = [UIColor greenColor];

}

- (void)viewWillAppear:(BOOL)animated {
//    [self.navigationController.navigationBar setBackgroundImage:[ImageUtils imageWithColorHex:@"#ffffffff" size:CGSizeMake(10, 10)] forBarMetrics:UIBarMetricsDefault];
}

@end
