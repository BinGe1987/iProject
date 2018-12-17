//
//  UIEngine.m
//  UIEngine
//
//  Created by BinGe on 2018/11/26.
//  Copyright © 2018 Bin. All rights reserved.
//


#import "UIEngine.h"
#import "DefaultMapping.h"

@interface UIEngine()

@property (nonatomic, strong) NSMutableArray *mappings;

@end


@implementation UIEngine

singleton_implementation(UIEngine)

- (void)initialize {
    Log(@"UIEngine initialize %@", self);
    if (!self.mappings) {
        self.mappings = [[NSMutableArray alloc] init];
        [self loadEngineMapping:[[DefaultMapping alloc] init]];
    }
}

- (void)loadEngineMapping:(id<IEngineMapping>)mapping {
    [self.mappings addObject:mapping];
}

- (UIView *)parse:(id<UIModel>)model {
    ViewModel *vm = [self getViewModel:model];
    if (vm) {
        return vm.view;
    }
    return nil;
}

- (ViewModel *)getViewModel:(id<UIModel>)model {
    for (id<IEngineMapping> mapping in self.mappings) {
        ViewModel *vm = [mapping getViewModel:model];
        if (vm) {
            if ([vm isKindOfClass:[ViewGroupModel class]]) {
                ViewGroupModel *parent = (ViewGroupModel *)vm;
                for (id<UIModel> child in [model getChildModels] ) {
                    ViewModel *childVM = [self getViewModel:child];
                    [parent addChildViewModel:childVM];
                }
            }
            return vm;
        }
    }
    return nil;
}

@end
