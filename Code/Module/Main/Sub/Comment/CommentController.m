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
    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"table"];
    sv.contentInset = UIEdgeInsetsMake(topHeight,0,0,0);
    sv.contentOffset = CGPointMake(0, -topHeight);
}

- (CGRect)safeRect {
    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    UIEdgeInsets insets = self.view.safeAreaInsets;
    insets.top = 0;
    CGFloat width = size.width - insets.left - insets.right;
    CGFloat height = size.height - insets.top - insets.bottom;
    return CGRectMake(insets.left, insets.top, width, height);
}

@end
