//
//  AutoTableViewAdapter.h
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import <Foundation/Foundation.h>
#import "AutoTableViewSection.h"
#import "AutoTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AutoTableViewAdapter : NSObject<UITableViewDataSource, UITableViewDelegate>

+ (instancetype)adapterWithSection:(AutoTableViewSection *)section;

+ (instancetype)adapterWithSections:(NSArray<AutoTableViewSection *>*)sections;

- (void)addSection:(AutoTableViewSection *)section;

@end

NS_ASSUME_NONNULL_END
