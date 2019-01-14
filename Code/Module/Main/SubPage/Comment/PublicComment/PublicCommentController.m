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
    [self setNavigationXML:@"PublicCommentControllerNavigation.xml"];
    
    [self setContentViewWithXML:@"PublicCommentController.xml"];
    [self addPresenter:[[PublicCommentPresenter alloc] initWithView:self.contentView]];
//    [self endEditingWithViewTouch:self.contentView];
}
    
- (void)dealloc
{
    
}

@end
