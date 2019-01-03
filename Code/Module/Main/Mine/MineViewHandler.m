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
    
    //手机
    UILabel *phone = (UILabel *)[self.view findViewByName:@"label_phone"];
    phone.text = [user.phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];;
    
    //累计充值
    UILabel *totalRecharge = (UILabel *)[self.view findViewByName:@"label_totalRecharge"];
    totalRecharge.text = [NSString stringWithFormat:@"￥%@", user.recharge.totalRechargeAmount];
    
    //累计充值
    UILabel *amount = (UILabel *)[self.view findViewByName:@"label_amount"];
    amount.text = [NSString stringWithFormat:@"%@", user.recharge.amount];
}

@end
