//
//  MineViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "MineViewHandler.h"

@implementation MineViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    return self;
}

- (void)setData:(id)data {
    UserData *user = (UserData *)data;
    
    //头像
    UIImageView *avatar = (UIImageView *)[self.view findViewByName:@"image_avatar"];
    if (![NSString isEmpty:user.avatarUrl]) {
        [avatar setImageWithURL:[NSURL URLWithString:user.avatarUrl]];
    }
    
    UIButton *btnMemberWelfare = (UIButton *)[self.view findViewByName:@"btn_memberWelfare"];
    [btnMemberWelfare setClickBlock:^(UIButton * _Nonnull button) {
        [UIViewController pushController:@"WebViewController" animated:YES data:@{@"title":@"会员福利"}];
    }];
    
    //手机
    UILabel *phone = (UILabel *)[self.view findViewByName:@"label_phone"];
    phone.text = [user.phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];;
    
    //累计充值
    UILabel *totalRecharge = (UILabel *)[self.view findViewByName:@"label_totalRecharge"];
    totalRecharge.text = [NSString stringWithFormat:@"￥%.1f", user.recharge.totalRechargeAmount];
    
    //当前余额
    UILabel *amount = (UILabel *)[self.view findViewByName:@"label_amount"];
    amount.text = [NSString stringWithFormat:@"%.1f", user.recharge.amount];
    
    //我的积分
    UILabel *points = (UILabel *)[self.view findViewByName:@"label_points"];
    points.text = [NSString stringWithFormat:@"我的积分: %ld", user.points.nowPoints];
}

@end
