//
//  LoginViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setContentViewWithXML:@"Login.xml"];
    [self endEditingWithViewTouch:self.view];//键盘回收
    
    UIButton *btn = (UIButton *)[self findViewByName:@"btn_login"];
    [btn setClickBlock:^(UIButton * _Nonnull button) {
        [ProgressHUB loadingTitle:@"正在登录"];
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            sleep(3);
            [ProgressHUB dismiss];
        });
    }];

    
    
}

- (CGRect)safeRect {
    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    UIEdgeInsets insets = self.view.safeAreaInsets;
    insets.top = 0;
    CGFloat width = size.width - insets.left - insets.right;
    CGFloat height = size.height - insets.top - insets.bottom;
    return CGRectMake(insets.left, insets.top, width, height);
}

-(void)dealloc {
    
}

@end
