//
//  ClubDetailProjectCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailProjectCell.h"

@implementation ClubDetailProjectCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterClubDetailCell_project";
    ClubDetailProjectCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubDetailProjectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    UIView *view = [UIView viewWithXML:@"ClubDetailServiceItem.xml" size:size];
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    ClubServiceData *service = data;
    ViewGroup *root = [self.contentView findViewByName:@"root"];
    
    UIImageView *imageView = [root findViewByName:@"image"];
    [imageView setImageWithURL:[NSURL URLWithString:service.imageUrl] placeholder:UIImageDefault];
    
    UILabel *name = [root findViewByName:@"name"];
    name.text = service.name;
    
    UILabel *originalPrice = [root findViewByName:@"originalPrice"];
    originalPrice.text = [NSString stringWithFormat:@"门市价：¥%ld",service.originalPrice/100];
    
    UILabel *price = [root findViewByName:@"price"];
    price.text = [NSString stringWithFormat:@"¥%ld/%ld%@",service.price/100,service.amount,service.unit];
    
    UILabel *savePrice = [root findViewByName:@"savePrice"];
    savePrice.text = [NSString stringWithFormat:@"减：¥%ld",service.savePrice/100];
    
    
    
    [root boundsAndRefreshLayout];
}



@end
