//
//  CheckLoginPerfomer.m
//  APP
//
//  Created by BinGe on 2018/12/11.
//

#import "CheckLoginPerfomer.h"
#import "CheckLoginRequest.h"

@implementation CheckLoginPerfomer

- (id)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callback {
    NetResponse *response = [Net synchroRequest:[CheckLoginRequest new]];
    Data *data = [Data new];
    data.source = response.data;
    data.error = response.error;
    return data;
}

@end
