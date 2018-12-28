//
//  UIViewController+Data.m
//  APP
//
//  Created by BinGe on 2018/12/28.
//

#import "UIViewController+Data.h"


static const void *intentDataKey = &intentDataKey;

static const void *onClickBlockKey1 = &onClickBlockKey1;

@implementation UIViewController (Data)

- (void)setIntentData:(NSObject *)intent {
    objc_setAssociatedObject(self, intentDataKey, intent, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSObject *)intentData{
    return objc_getAssociatedObject(self, intentDataKey);
}

@end
