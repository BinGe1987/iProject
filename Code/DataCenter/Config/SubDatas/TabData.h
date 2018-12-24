//
//  TabData.h
//  APP
//
//  Created by BinGe on 2018/12/24.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface TabData : Data

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSString *type;

@property (nonatomic, assign) NSInteger tabID;
@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *titleColorNormal;
@property (nonatomic, strong) NSString *titleColorSelected;

@property (nonatomic, strong) NSString *imageNormal;
@property (nonatomic, strong) NSString *imageSelected;

@end

NS_ASSUME_NONNULL_END
