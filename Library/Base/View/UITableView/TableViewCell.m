//
//  TableViewCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "TableViewCell.h"

@implementation TableViewCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    return nil;
}
+ (instancetype)tableView:(UITableView *)tableView cellSizeValue:(NSValue *)size {
    return [[self class] tableView:tableView cellWithSize:size.CGSizeValue];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    return self;
}

- (UITableView *)myTableView {
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}

- (void)setData:(id)data {
    
}

static NSString * showUserInfoCellIdentifier = @"TableViewAdapterCell";
- (NSString *)cellIdentifier {
    return showUserInfoCellIdentifier;
}

@end
