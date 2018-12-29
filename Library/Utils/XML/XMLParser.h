//
//  XMLParser.h
//  APP
//
//  Created by BinGe on 2018/12/29.
//

#import <Foundation/Foundation.h>
#import "XMLObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface XMLParser : NSObject

+ (XMLObject *)dictionaryFromXML:(NSString *)xml;

@end

NS_ASSUME_NONNULL_END
