//
//  TechUITableViewCell.m
//  APP
//
//  Created by BinGe on 2018/12/26.
//

#import "TechUITableViewCell.h"

@implementation TechUITableViewCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterCell_Tech";
    TechUITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[TechUITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
//    UIView *view = [UIView viewWithJSON:@"ClassifyCell.json" size:size];
//    [self.contentView addSubview:view];
    self.contentView.backgroundColor = [UIColor redColor];
}

- (void)setData:(id)data {
    
}
@end
