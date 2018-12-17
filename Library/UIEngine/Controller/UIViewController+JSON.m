//
//  UIViewController+JSON.m
//  UIEngine
//
//  Created by BinGe on 2018/11/26.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "UIViewController+JSON.h"

@implementation UIViewController (JSON)

-(void)setContentViewWithJSONPath:(NSString *)path {
    JSON *json = [[JSON alloc] initWithPath:path];
    if (!json.error) {
        JSONModel *model = [[JSONModel alloc] initWithJSON:json.source];
        UIView *view = [[UIEngine get]parse:model];
        [self setContentView:view];
    }
}

@end
