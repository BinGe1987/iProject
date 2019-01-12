//
//  CommentController.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentController.h"
#import "CommentPresenter.h"

@interface CommentController ()

@end

@implementation CommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部评论";
    
    [self setContentViewWithXML:@"Comment.xml"];
    [self addPresenter:[[CommentPresenter alloc] initWithView:[self.view findViewByName:@"root"]]];
}

- (void)onLayoutSubViewsCompleted {
//    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"table"];
    sv.contentInset = UIEdgeInsetsMake(0,0,20,0);
//    sv.contentOffset = CGPointMake(0, -topHeight);
}

@end
