//
//  LoginViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import "LoginViewHandler.h"

@interface LoginViewHandler()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIButton *btnCode;
@property (nonatomic, strong) UIButton *btnLogin;

@end

@implementation LoginViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    WeakSelf(self);
    
    UITextField *phoneField = (UITextField *)[view findViewByName:@"input_phone"];
    UITextField *codeField = (UITextField *)[view findViewByName:@"input_code"];
    
    NSString *localPhone = [Store valueForKey:@"login_phone" defaultValue:nil];
    if (![NSString isEmpty:localPhone]) {
        phoneField.text = localPhone;
        [codeField becomeFirstResponder];
    }
    
    self.btnCode = (UIButton *)[view findViewByName:@"btn_code"];
    [self.btnCode setClickBlock:^(UIButton * _Nonnull button) {
        NSString *phone = phoneField.text;
        if (![Utils validateContactNumber:phone]) {
            [ProgressHUB toast:@"请输入正确的手机号码"];
        } else {
            [Store setValue:phone forKey:@"login_phone"];
            [codeField becomeFirstResponder];
            [weakself startCount];
        }
    }];
    
    self.btnLogin = (UIButton *)[view findViewByName:@"btn_login"];
    [self.btnLogin setClickBlock:^(UIButton * _Nonnull button) {
        NSString *phone = phoneField.text;
        NSString *code = codeField.text;
        if (![Utils validateContactNumber:phone]) {
            [ProgressHUB toast:@"请输入正确的手机号码"];
        } else if ([NSString isEmpty:code]){
            [ProgressHUB toast:@"请输入验证码"];
        } else {
            [ProgressHUB loading];
            [weakself.delegate onViewAction:@"Login" data:@{@"loginName":phone, @"code":code}];
        }
    }];
    
    return self;
}

- (void)loginSuccess:(UserData *)user {
    [ProgressHUB dismiss];
    [self.view dismissViewControllerAnimated:YES completion:nil];
}

- (void)error:(NSString *)error {
    [ProgressHUB dismiss];
    [ProgressHUB toast:error];
    [self resetCount];
}

static int timeValue;
- (void)startCount {
    NSString *localPhone = [Store valueForKey:@"login_phone" defaultValue:nil];
    [self.delegate onViewAction:@"startCount" data:localPhone];
    
    [self resetCount];
    
    self.btnCode.selected = YES;
    self.btnCode.userInteractionEnabled = NO;
    self.btnCode.layer.borderColor = [ColorUtils colorWithString:@"#b2b2b2"].CGColor;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
    
    [self.btnCode setTitle:@"重新获取" forState:UIControlStateNormal];
    [self.btnCode setTitle:[NSString stringWithFormat:@"%dS", timeValue+1] forState:UIControlStateSelected];
    
   
}

- (void)count {
    if (timeValue == 0) {
        [self resetCount];
    }
    [self.btnCode setTitle:[NSString stringWithFormat:@"%dS", timeValue] forState:UIControlStateSelected];
    timeValue--;
    
    
}

- (void)resetCount {
    if (self.timer) {
        [self.timer invalidate];
    }
    timeValue = 9;
    
    self.btnCode.selected = NO;
    self.btnCode.userInteractionEnabled = YES;
    self.btnCode.layer.borderColor = UIColorMain.CGColor;
}

- (void)finish {
    [self.view dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    
}

@end
