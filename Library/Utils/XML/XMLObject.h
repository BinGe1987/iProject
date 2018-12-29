//
//  XMLObject.h
//  APP
//
//  Created by BinGe on 2018/12/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMLObject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, weak) id parent;

@property (nonatomic, strong) NSDictionary *attribute;
@property (nonatomic, strong) NSMutableArray<XMLObject *> *childs;

@end

NS_ASSUME_NONNULL_END
