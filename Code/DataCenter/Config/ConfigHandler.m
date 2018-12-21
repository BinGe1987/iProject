//
//  ConfigHandler.m
//  APP
//
//  Created by BinGe on 2018/12/21.
//

#import "ConfigHandler.h"
#import "ConfigPerformer.h"

@interface ConfigHandler()<IParser>

@property (nonatomic, strong) ConfigData *data;

@end

@implementation ConfigHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.data = [ConfigData new];
        [self bind:OperationGetConfig performer:[ConfigPerformer new] parser:self];
    }
    return self;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    
    return [self getData];
}

- (id)getData {
    return self.data;
}


@end
