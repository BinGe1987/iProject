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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    return self;
}

- (void)setData:(id)data {
    
}

@end
