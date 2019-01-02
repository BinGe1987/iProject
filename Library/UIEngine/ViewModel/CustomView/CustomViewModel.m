//
//  CustomViewModel.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "CustomViewModel.h"

@implementation CustomViewModel

//- (instancetype)initWithUIModel:(id<UIModel>)model {
//    self = [super init];
//    if (self) {
//        self.model = model;
//        //        NSString *clsName = []
//
//        self.view = [[[self ViewClass] alloc] init];
//        self.view.viewParams = [[[self ViewParamsClass] alloc] initWithModel:model];
//        [self setupViewParams:self.view.viewParams];
//        [self initialize];
//    }
//    return self;
//}

- (void)initialize {
    //    NSLog(@"ViewModel 初始化！");
}

- (Class)ViewClass {
    NSString *className = [self.model getString:@"view_class" defaultValue:nil];
    return NSClassFromString(className);
}

- (Class)ViewParamsClass {
    return [ViewParams class];
}

@end
