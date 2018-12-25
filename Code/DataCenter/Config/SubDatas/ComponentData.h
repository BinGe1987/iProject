//
//  ComponentData.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface ComponentData : Data

@property (nonatomic, assign) BOOL isHead;
@property (nonatomic, assign) NSString *componentID;
@property (nonatomic, assign) NSString *type;
@property (nonatomic, assign) NSString *name;
@property (nonatomic, assign) NSString *title;

@end

NS_ASSUME_NONNULL_END
