//
//  Utils.m
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import "Utils.h"

@implementation Utils

+ (BOOL)validateContactNumber:(NSString *)mobileNum {
    NSString * MOBILE = @"^1\\d{10}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if(([regextestmobile evaluateWithObject:mobileNum] == YES)){
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)compareWithOldArray:(NSArray *)oldArray newArray:(NSArray *)newArray {
    if (oldArray.count != newArray.count) {
        return NO;
    }
    
    
    return NO;
}

@end
