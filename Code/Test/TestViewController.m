//
//  TestViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "TestViewController.h"
#import "LoginViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:self.view.bounds];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [iv setImageWithURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=517299671,1909033020&fm=200&gp=0.jpg"]];
    [self.view addSubview:iv];
}


@end
