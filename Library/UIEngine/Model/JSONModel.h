//
//  JSONModel.h
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSONModel : NSObject<UIModel>

-(instancetype)initWithJSON:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
