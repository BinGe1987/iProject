//
//  UIViewController+Data.m
//  APP
//
//  Created by BinGe on 2018/12/28.
//

#import "UIViewController+Data.h"


static const void *DataKey = &DataKey;

@implementation UIViewController (Data)

- (void)setIntent:(id)intent {
    objc_setAssociatedObject(self, DataKey, intent, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(id)intent{
    return objc_getAssociatedObject(self, DataKey);
}

@end
