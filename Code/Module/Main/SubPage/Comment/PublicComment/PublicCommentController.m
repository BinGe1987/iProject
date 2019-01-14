//
//  PublicCommentController.m
//  APP
//
//  Created by BinGe on 2019/1/13.
//

#import "PublicCommentController.h"

@interface PublicCommentController ()

@end

@implementation PublicCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    Data *data = self.intentData;
    self.title = @"发布评论";
    
    [self setContentViewWithXML:@"PublicCommentController.xml"];
    ViewGroup *v5 = [self findViewByName:@"comment_level5"];
    UIButton *button = [v5 findViewByName:@"image"];
    button.selected = YES;
    UIButton *label = [v5 findViewByName:@"label"];
    label.selected = YES;
}

@end
