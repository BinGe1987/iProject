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
    [self setContentViewWithXML:@"WebVewController.xml"];
}

@end
