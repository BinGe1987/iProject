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

@property (nonatomic, strong) UILabel *errorLabel;

@end

@implementation LoginViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    WeakSelf(self);
    
    UIButton *btn = (UIButton *)[view findViewByName:@"btn_loginTitle"];
    [btn setClickBlock:^(UIButton * _Nonnull button) {
        NSString *token = @"e678eae481c04aeeb8bf060ec0b02b49";
        [DataCenter perform:OperationLoginCheck params:token callback:^(id  _Nonnull operation, id  _Nullable data) {
            if ([data isKindOfClass:[UserData class]] && [data isLogin]) {
                Log(@"自动登录完成。。。");
                [button dismissViewControllerAnimated:YES completion:nil];
            }
            else {
                NSLog(@"%@", data);
            }
        }];
//        [button dismissViewControllerAnimated:YES completion:nil];
//        UserData *user = [DataCenter get].userData;
//        user.source = [@{@"statusCode":@"200"} mutableCopy];
//        user.token = @"e678eae481c04aeeb8bf060ec0b02b49";
//        [Store setValue:user.token forKey:@"token"];
//        [EventBus postEvent:EventLoginStatusChanged data:user];
    }];
    
    self.errorLabel = (UILabel *)[self.view findViewByName:@"label_errorInfo"];
    self.errorLabel.textAlignment = NSTextAlignmentLeft;
    
    UITextField *phoneField = (UITextField *)[view findViewByName:@"input_phone"];
    UITextField *codeField = (UITextField *)[view findViewByName:@"input_code"];
    
    NSString *localPhone = [Store valueForKey:@"login_phone" defaultValue:nil];
    if (![NSString isEmpty:localPhone]) {
        phoneField.text = localPhone;
    }
    
    self.btnLogin = (UIButton *)[view findViewByName:@"btn_login"];
    [self.btnLogin setClickBlock:^(UIButton * _Nonnull button) {
        NSString *phone = phoneField.text;
        NSString *code = codeField.text;
        if (![Utils validateContactNumber:phone]) {
            [ProgressHUB showTips:@"请输入正确的手机号码"];
            [phoneField becomeFirstResponder];
        } else if ([NSString isEmpty:code]){
            [ProgressHUB showTips:@"请输入验证码"];
            [codeField becomeFirstResponder];
        } else {
            [ProgressHUB loading];
            [view endEditing:YES];
            [weakself.delegate onViewAction:@"Login" data:@{@"loginName":phone, @"code":code}];
            
            UILabel *label = (UILabel *)[weakself.view findViewByName:@"label_errorInfo"];
            label.text = @"";
        }
    }];
    
    self.btnCode = (UIButton *)[view findViewByName:@"btn_code"];
    [self.btnCode setClickBlock:^(UIButton * _Nonnull button) {
        NSString *phone = phoneField.text;
        if (![Utils validateContactNumber:phone]) {
//            [ProgressHUB toast:@"请输入正确的手机号码"];
            [ProgressHUB showTips:@"请输入正确的手机号码"];
            [phoneField becomeFirstResponder];
        } else {
            [Store setValue:phone forKey:@"login_phone"];
            [weakself startCount];
            
        }
    }];
    
    
    
    return self;
}

- (void)loginSuccess:(UserData *)user {
    [ProgressHUB dismiss];
    [self.view dismissViewControllerAnimated:YES completion:nil];
}

- (void)loginError:(NSString *)error {
    [ProgressHUB dismiss];
    [self error:error];
}

- (void)getCodeSuccess {
    self.btnLogin.highlighted = NO;
    self.btnLogin.userInteractionEnabled = YES;
}

- (void)error:(NSString *)error {
    self.errorLabel.text = error;
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
    
    self.errorLabel.text = @"";
    self.btnLogin.highlighted = YES;
    self.btnLogin.userInteractionEnabled = NO;
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
    timeValue = 59;
    
    self.btnCode.selected = NO;
    self.btnCode.userInteractionEnabled = YES;
    self.btnCode.layer.borderColor = UIColorMain.CGColor;
    
    self.btnLogin.highlighted = NO;
    self.btnLogin.userInteractionEnabled = YES;
}

- (void)finish {
    [self.view dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    
}

@end
