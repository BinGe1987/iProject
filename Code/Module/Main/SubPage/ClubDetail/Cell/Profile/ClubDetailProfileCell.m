//
//  ClubDetailProfileCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailProfileCell.h"

@interface ClubDetailProfileCell()

@property (nonatomic, strong) ViewGroup *view;

@end

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

- (void)initWithSize:(CGSize)size {
    self.view = (ViewGroup *)[UIView viewWithXML:@"ClubDetailProfile.xml" size:size];
    [self.contentView addSubview:self.view];
}

- (void)setData:(id)data {
    ClubData *club = data;
    
    UILabel *label = [self.view findViewByName:@"label_clubName"];
    label.text = club.name;
    
    label = [self.view findViewByName:@"label_follow"];
    label.text = [NSString stringWithFormat:@"%ld人关注", club.followCount];
    
    label = [self.view findViewByName:@"label_star"];
    label.text = [NSString stringWithFormat:@"%.1f", club.star];
    
    label = [self.view findViewByName:@"label_consumeAvg"];
    label.text = [NSString stringWithFormat:@"%@/人", club.consumeAvg];
    
    label = [self.view findViewByName:@"label_address"];
    label.text = [NSString stringWithFormat:@"%@", club.address];
    
    label = [self.view findViewByName:@"label_time"];
    label.text = [NSString stringWithFormat:@"营业时间: %@-%@", club.startTime, club.endTime];
    
    [self.view refreshLaoyout];
}

@end
