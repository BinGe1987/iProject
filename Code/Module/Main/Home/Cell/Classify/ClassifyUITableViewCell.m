//
//  ClassifyUITableViewCell.m
//  APP
//
//  Created by BinGe on 2018/12/26.
//

#import "ClassifyUITableViewCell.h"


@implementation ClassifyUITableViewCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterCell_Classify";
    ClassifyUITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClassifyUITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    UIView *view = [UIView viewWithJSON:@"ClassifyCell.json" size:size];
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    
}
@end
