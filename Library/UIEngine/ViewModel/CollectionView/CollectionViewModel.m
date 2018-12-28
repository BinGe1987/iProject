//
//  CollectionViewModel.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "CollectionViewModel.h"

@interface CollectionViewModel()


@end

@implementation CollectionViewModel

- (void)initialize {
    CollectionView *view = (CollectionView *)self.view;
//    CollectionViewParams *params = (CollectionViewParams *)view.viewParams;
    
    
    
}

- (Class)ViewClass {
    return [CollectionView class];
}
- (Class)ViewParamsClass {
    return [CollectionViewParams class];
}

- (Class)LayoutParamsClass {
    return [CollectionLayoutParams class];
}

@end
