//
//  TestTableViewCell.m
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import "TestTableViewCell.h"

@interface TestTableViewCell()

@property (nonatomic,assign) NSInteger height;

@end

@implementation TestTableViewCell

- (void)setCellData:(id)data {
    self.height = [data integerValue];
}


- (CGFloat)heightForCell {
    return self.height;
}

@end
