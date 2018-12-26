//
//  HomeTableViewCell.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    return nil;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    return self;
}

- (void)setData:(id)data {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
