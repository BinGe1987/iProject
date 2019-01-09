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
    NSArray *techList = data;
    NSInteger count = techList.count > 4 ? 4 : techList.count;
    LinearLayout *linearView = (LinearLayout *)[self.contentView findViewByName:@"linear"];
    for (int i=0; i<count; i++) {
        ViewGroup *item = linearView.subviews[i];
        TechData *tech = [techList[i] copy];
        
        UIImageView *imageView = [item findViewByName:@"image"];
        [imageView setImageWithURL:[NSURL URLWithString:tech.imageUrl] placeholder:UIImageDefault_Tech];
        
        UILabel *label = [item findViewByName:@"name"];
        label.text = tech.name;
        
        UIButton *btn = (UIButton *)[item findViewByName:@"btn"];
        [btn setClickBlock:^(UIButton * _Nonnull button) {
            [UIViewController pushController:@"TechDetailController" animated:YES data:tech];
        }];
    }
    [linearView refreshLaoyout];
}

@end
