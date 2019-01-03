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

- (NSInteger)statusCode {
    NSInteger code = [self integerWithKey:@"statusCode"];
    return code;
}

- (BOOL)isSuccess {
    return self.statusCode == 200;
}

- (NSString *)errorMessage {
    if (self.error) {
        return self.error.localizedDescription;
    }
    else {
        NSString *msg = [self stringWithKey:@"msg"];
        return msg;
    }
}

@end
