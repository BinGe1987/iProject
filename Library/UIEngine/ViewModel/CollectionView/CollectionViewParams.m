//
//  CollectionViewParams.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "CollectionViewParams.h"

@implementation CollectionViewParams

- (instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    self.column = [model getInteger:@"column" defaultValue:1];
    return self;
}

@end
