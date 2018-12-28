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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Login.json" ofType:nil];
    [self setContentViewWithJSONPath:path];
    
    UIButton *btn = (UIButton *)[self findViewByName:@"btn2"];
//    WeakSelf(self)
    [btn setClickBlock:^(UIButton * _Nonnull button) {
        [button popControllerAnimated:YES];
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
