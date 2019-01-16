//
//  FeedbackController.m
//  APP
//
//  Created by BinGe on 2019/1/16.
//

#import "FeedbackController.h"

@interface FeedbackController ()

@end

@implementation FeedbackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"意见反馈";
    [self setContentViewWithXML:@"FeedbackController.xml"];
    
}

@end
