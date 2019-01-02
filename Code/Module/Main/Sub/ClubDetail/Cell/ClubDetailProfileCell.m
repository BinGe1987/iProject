//
//  ClubDetailProfileCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailProfileCell.h"

@implementation ClubDetailProfileCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterClubDetailCell_Profile";
    ClubDetailProfileCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubDetailProfileCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    return self;
}

- (void)initWithSize:(CGSize)size {
//    self.contentView.backgroundColor = [UIColor redColor];
    UIView *view = [UIView viewWithXML:@"ClubDetailProfile.xml" size:size];
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    
}

@end
