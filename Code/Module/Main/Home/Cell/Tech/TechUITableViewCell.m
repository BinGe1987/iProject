//
//  TechUITableViewCell.m
//  APP
//
//  Created by BinGe on 2018/12/26.
//

#import "TechUITableViewCell.h"

@interface TechUITableViewCell()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

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
    UIView *view = [UIView viewWithJSON:@"TechCellList.json" size:size];
    self.scrollView = (UIScrollView *)[view findViewByName:@"scroll"];
    self.scrollView.showsVerticalScrollIndicator = FALSE; //垂直滚动条
    self.scrollView.showsHorizontalScrollIndicator = FALSE;//水平滚动条
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    if (data == self.cellData) {
        return;
    }
    self.cellData = data;
    CGSize size = CGSizeMake(ScaleValue(84), self.scrollView.height);
    id<ViewGroupDelegate> delegate = (id<ViewGroupDelegate>)self.scrollView;
    for (TechData *tech in data) {
        UIView *view = [UIView viewWithJSON:@"TechCellListItem.json" size:size];
        UILabel *lable = (UILabel *)[view findViewByName:@"name"];
        lable.text = tech.name;
        [delegate addView:view];
        UIButton *btn = (UIButton *)[view findViewByName:@"btn"];
        [btn setClickBlock:^(UIButton * _Nonnull button) {
            [UIViewController pushController:@"TechDetailController" animated:YES data:nil];
        }];
    }
    [delegate onLayout];
    
}
@end
