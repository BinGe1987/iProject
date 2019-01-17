//
//  MyFollowController.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "MyFollowController.h"

@interface MyFollowController ()

@end

@implementation MyFollowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的关注";
    [self setContentViewWithXML:@"MyFollowController.xml"];
    
}

@end
