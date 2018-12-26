//
//  Data+Update.m
//  APP
//
//  Created by BinGe on 2018/12/26.
//

#import "Data+Update.h"

static const void *IsDataUpdatedKey = &IsDataUpdatedKey;

@implementation Data (Update)

- (void)setIsDataUpdated:(BOOL)isDataUpdated {
    objc_setAssociatedObject(self, &isDataUpdated, @(isDataUpdated), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)isDataUpdated {
    return [objc_getAssociatedObject(self, &IsDataUpdatedKey) boolValue];
}

@end
