//
//  Aspects+My.m
//  APP
//
//  Created by BinGe on 2018/12/23.
//

#import "Aspects+My.h"
#import "Aspects.h"

@implementation NSObject (My)

- (BOOL)hookBeforSelector:(SEL)selector block:(id)block {
    return [self aspect_hookSelector:selector withOptions:AspectPositionBefore usingBlock:block error:NULL];
}

- (BOOL)hookInsteadSelector:(SEL)selector block:(id)block {
    return [self aspect_hookSelector:selector withOptions:AspectPositionInstead usingBlock:block error:NULL];
}

- (BOOL)hookAfterSelector:(SEL)selector block:(id)block {
    return [self aspect_hookSelector:selector withOptions:AspectPositionAfter usingBlock:block error:NULL];
}

@end
