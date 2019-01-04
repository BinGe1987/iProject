//
//  CommentItemCell.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentItemCell.h"

@implementation CommentItemCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterCommentList_Comment";
    CommentItemCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[CommentItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    UIView *view = [UIView viewWithXML:@"CommentItem.xml" size:size];
    
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    
}

@end
