//
//  NiceNameEditController.m
//  APP
//
//  Created by BinGe on 2019/1/16.
//

#import "NiceNameEditController.h"

@interface NiceNameEditController ()

@end

@implementation NiceNameEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改昵称";
    
    [self setContentViewWithXML:@"NiceNameEditController.xml"];
    [self endEditingWithViewTouch:self.view];
    
    UIButton *btn = [self findViewByName:@"btn_commit"];
    [btn addTarget:self action:@selector(commitEvent:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)commitEvent:(UIButton *)btn {
    UITextField *input = [self findViewByName:@"input_name"];
    NSString *name = input.text;
    if ([NSString isEmpty:name]) {
        [ProgressHUB showTips:@"请输入昵称"];
    } else {
        [btn showLoadingViewGrivaty:LoadingViewGravityCenter padding:UIEdgeInsetsMake(0, 0, 0, 50) color:[UIColor whiteColor]];
        self.view.userInteractionEnabled = NO;
        
        WeakSelf(self)
        NSDictionary *params = @{@"nickName":name};
        [DataCenter perform:OperationEditMineData params:params callback:^(id  _Nonnull operation, Data * _Nullable data) {
            if ([data isSuccess]) {
                [ProgressHUB toast:@"修改成功"];
                [weakself.navigationController popViewControllerAnimated:YES];
            } else {
                [ProgressHUB showTips:[data errorMessage]];
            }
        }];
    }
}



@end
