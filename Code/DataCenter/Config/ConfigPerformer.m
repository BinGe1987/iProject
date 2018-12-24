//
//  ConfigPerformer.m
//  APP
//
//  Created by BinGe on 2018/12/21.
//

#import "ConfigPerformer.h"

@implementation ConfigPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    sleep(1);
    NSString *path = [[NSBundle mainBundle] pathForResource:@"collocation.json" ofType:nil];
    Data *json = [[Data alloc] initWithPath:path];
    if (!json.error) {
        
    }
    return json;
}

@end
