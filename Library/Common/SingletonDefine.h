//
//  SingletonDefine.h
//  UIEngine
//
//  Created by BinGe on 2018/11/26.
//  Copyright © 2018 Bin. All rights reserved.
//  用于快速实现单例

#ifndef SingletonDefine_h
#define SingletonDefine_h

// @interface
#define singleton_interface(className) \
+ (className *)get;\
-(instancetype) init __attribute__((unavailable("init not available, call get instead")));\
+(instancetype) new __attribute__((unavailable("new not available, call get instead")));\
+(instancetype) allocWithZone __attribute__((unavailable("new not available, call get instead")));\
-(void)initialize;\


// @implementation
#define singleton_implementation(className) \
static className *_instance; \
+ (className *)get \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[super alloc] initUniqueInstance]; \
}); \
return _instance; \
}\
-(instancetype) initUniqueInstance {\
    self = [super init];\
    [self initialize];\
    return self;\
}\

#endif /* SingletonDefine_h */
