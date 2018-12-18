//
//  CheckLoginPerfomer.m
//  APP
//
//  Created by BinGe on 2018/12/11.
//

#import "CheckLoginPerfomer.h"

@implementation CheckLoginPerfomer

- (id)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callback {
    NetResponse *response = [Net synchroRequest:nil];
    Log(@"这里 需要格式转换 NetResponse:%@ -> Data", response);
    Data *data = [Data new];
    return data;
}

@end
