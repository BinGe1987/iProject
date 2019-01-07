//
//  ClassifyUITableViewCell.m
//  APP
//
//  Created by BinGe on 2018/12/26.
//

#import "ClassifyUITableViewCell.h"

@interface ClassifyUITableViewCell()

@property (nonatomic, strong) NSArray *array;

@end

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
    UIButton *btn1 = (UIButton *)[view findViewByName:@"classify_hydrotherapy"];
    WeakSelf(self)
    [btn1 setClickBlock:^(UIButton * _Nonnull button) {
        ClassifyData *data;
        if (weakself.array && weakself.array.count >= 3) {
            data = weakself.array[0];
        }
        [UIViewController pushController:@"ClassifyViewController" animated:YES data:data];
    }];
    UIButton *btn2 = (UIButton *)[view findViewByName:@"classify_tuina"];
    [btn2 setClickBlock:^(UIButton * _Nonnull button) {
        ClassifyData *data;
        if (weakself.array && weakself.array.count >= 3) {
            data = weakself.array[1];
        }
        [UIViewController pushController:@"ClassifyViewController" animated:YES data:data];
    }];
    UIButton *btn3 = (UIButton *)[view findViewByName:@"classify_bathing"];
    [btn3 setClickBlock:^(UIButton * _Nonnull button) {
        ClassifyData *data;
        if (weakself.array && weakself.array.count >= 3) {
            data = weakself.array[2];
        }
        [UIViewController pushController:@"ClassifyViewController" animated:YES data:data];
    }];
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    self.array = data;
}
@end
