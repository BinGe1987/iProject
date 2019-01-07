//
//  Location.m
//  APP
//
//  Created by BinGe on 2019/1/7.
//

#import "Location.h"

@implementation Location

+ (instancetype)newWithLongitude:(CGFloat)longitude latitude:(CGFloat)latitude {
    Location *l = [Location new];
    l.longitude = longitude;
    l.latitude = latitude;
    return l;
}

@end
