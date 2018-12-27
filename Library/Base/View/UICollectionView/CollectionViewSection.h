//
//  CollectionViewSection.h
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewSection : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, strong) NSArray *array;

@property (nonatomic, assign) CGSize itemSize;

@end

NS_ASSUME_NONNULL_END
