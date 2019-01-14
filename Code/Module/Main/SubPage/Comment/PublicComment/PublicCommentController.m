//
//  PublicCommentController.m
//  APP
//
//  Created by BinGe on 2019/1/13.
//

#import "PublicCommentController.h"
#import "PublicCommentPresenter.h"

@interface PublicCommentController ()

@end

@implementation PublicCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
//    Data *data = self.intentData;
    self.title = @"发布评论";
    [self setNavigationXML:@"PublicCommentControllerNavigation.xml"];
    
    [self setContentViewWithXML:@"PublicCommentController.xml"];
    [self addPresenter:[[PublicCommentPresenter alloc] initWithView:self.contentView]];
    [self endEditingWithViewTouch:self.contentView];
}

- (void)viewWillAppear:(BOOL)animated {
    UIView *view = self.navigationView;
    CGRect frame = view.frame;
}

- (void)viewDidAppear:(BOOL)animated {
    UIView *view = self.navigationView.superview;
    CGRect frame = view.frame;
    
}

- (void)dealloc
{
    
}

@end
