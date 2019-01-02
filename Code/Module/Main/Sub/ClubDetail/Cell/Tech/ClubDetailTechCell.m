//
//  ClubDetailTechCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailTechCell.h"

@interface ClubDetailTechCell()

@property (nonatomic, strong) ListData *techList;

@end

@implementation ClubDetailTechCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterClubDetailCell_tech";
    ClubDetailTechCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubDetailTechCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    UIView *view = [UIView viewWithXML:@"ClubDetailTech.xml" size:size];
    
    UIScrollView *scrollView = (UIScrollView *)[view findViewByName:@"scroll"];
    scrollView.showsVerticalScrollIndicator = FALSE; //垂直滚动条
    scrollView.showsHorizontalScrollIndicator = FALSE;//水平滚动条
    [self.contentView addSubview:view];
    
}

- (void)setData:(id)data {
    LinearLayout *linearView = (LinearLayout *)[self.contentView findViewByName:@"linear"];
//    CGSize size = CGSizeMake(ScaleValue(84), linearView.height);
    for (UIView *chidView in linearView.subviews) {
        UIButton *btn = (UIButton *)[chidView findViewByName:@"btn"];
        [btn setClickBlock:^(UIButton * _Nonnull button) {
            [UIViewController pushController:@"TechDetailViewController" animated:YES data:nil];
        }];
    }
    [linearView onLayout];
}

@end
