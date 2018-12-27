//
//  DataCenter.m
//  YDD
//
//  Created by BinGe on 2018/12/4.
//  Copyright © 2018 约多多. All rights reserved.
//

#import "CommonHeader.h"
#import "DataCenter.h"


@interface DataCenter()

///处理器
@property (nonatomic, strong) NSMutableArray<DataHandler *> *handlers;

///公众处理器
@property (nonatomic, strong) CommonHandler *commonHandler;

//数据中心线程池，发送到数据中心的所有请求将在线程中执行
@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation DataCenter

singleton_implementation(DataCenter)

- (void)initialize {
    Log(@"UIEngine initialize %@", self);
    self.operationQueue = [[NSOperationQueue alloc] init];
    self.operationQueue.maxConcurrentOperationCount = 3;
    
    self.handlers = [[NSMutableArray alloc] init];
    [self addSubHandlers];
}

- (NSArray *)getDataHandlerClassForInit {
    return nil;
}

- (void)addSubHandlers {
    self.commonHandler = [[CommonHandler alloc] init];
    [self.handlers addObject:self.commonHandler];
    TICK
    for (Class handlerCls in [self getDataHandlerClassForInit]) {
        DataHandler *handler = [[handlerCls alloc] init];
        [self.handlers addObject:handler];
    }
    TOCK
    
//    ///这一部份代码会查出所有DataHandler的子类，初始化后添加到Handler数组中！！！
//    TICK
//    int numClasses;
//    Class *classes = NULL;
//    numClasses = objc_getClassList(NULL, 0);
//    if (numClasses > 0) {
//        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
//        numClasses = objc_getClassList(classes, numClasses);
//        for (int i = 0; i < numClasses; i++) {
//            if (class_getSuperclass(classes[i]) == [DataHandler class]){
//                Class cls = classes[i];
//                id handler = [[cls alloc] init];
//                [self.handlers addObject:handler];
//                Log(@"DataCenter add handler --> %@", cls);
//            }
//        }
//        free(classes);
//    }
//    TOCK
}

+ (void)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callbak {
    [[DataCenter get] perform:operation params:params callback:callbak];
}

- (void)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callbak {
    
    [self.operationQueue addOperationWithBlock:^{
        ///在子线程中处理事件
        [self dispatch:operation params:params callback:callbak];
    }];
}

- (void)dispatch:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callbak {
    for (DataHandler *handler in self.handlers) {
        if ([handler isContainsPerformer: operation]) {
            id<IPerformer> performer = [handler getPerformer:operation];
            if ([performer isAsynchronous]) {
                [performer perform:operation params:params callback:^(id  _Nonnull operation, id  _Nullable data) {
                    [self handData:operation data:data callback:callbak];
                }];
            } else {
                id data = [performer perform:operation params:params callback:nil];
                [self handData:operation data:data callback:callbak];
            }
            return;
        }
    }
    @throw [NSException exceptionWithName:operation reason:@"找不到对应DataHandler处理" userInfo:nil];
}

- (void)handData :(_Nonnull id)operation data:(_Nullable id)data callback:(_Nullable ICallback)callbak {
    ///交给数据处理器整理数据，做数据分析、转换，如果没有则直接返回原始数据
    for (DataHandler *handler in self.handlers) {
        if ([handler isContainsParser: operation]) {
            data = [handler parseData:operation withSourceData:data];
            break;
        }
    }
    
    ///在主线程中返回结果
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        ///在主线程中处理事件
        callbak(operation, data);
    }];
}

- (Data *)getData:(_Nonnull Class)handlerClass {
    for (DataHandler *handler in self.handlers) {
        if ([handler isMemberOfClass:handlerClass]) {
            return [handler.delegate getData];
        }
    }
    return nil;
}

@end
