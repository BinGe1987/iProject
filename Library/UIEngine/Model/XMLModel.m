//
//  XMLModel.m
//  APP
//
//  Created by BinGe on 2018/12/29.
//

#import "XMLModel.h"

@interface XMLModel()

@property (nonatomic, strong) XMLObject *source;

@end

@implementation XMLModel

-(instancetype)initWithXML:(NSString *)xml {
    self = [super init];
    if (self) {
        XMLObject *xmlObject = [XMLParser objectFromXML:xml];
        self.source = xmlObject;
    }
    return self;
}

-(instancetype)initWithXMLObject:(XMLObject *)object {
    self = [super init];
    if (self) {
        self.source = object;
    }
    return self;
}

- (id)getSource {
    return self.source;
}

- (NSString *)getType {
    return self.source.name;
}

- (NSString *)getString:(NSString *)key defaultValue:(NSString * _Nullable)defValue {
    NSString *string = [self.source.attribute objectForKey:key];
    if (!string) {
        return defValue;
    }
    return string;
}

- (BOOL)getBool:(NSString *)key defaultValue:(BOOL)defValue {
    NSString *value = [self getString:key defaultValue:nil];
    if ([NSString isEmpty:value]) {
        return NO;
    }
    if ([value isEqualToString:@"YES"]) {
        return YES;
    }
    return defValue;
}

- (int)getInteger:(NSString *)key defaultValue:(int)defValue {
    NSString *value = [self getString:key defaultValue:[NSString stringWithFormat:@"%d", defValue]];
    return [value intValue];
}

- (CGFloat)getFloat:(NSString *)key defaultValue:(CGFloat)defValue {
    NSString *value = [self getString:key defaultValue:[NSString stringWithFormat:@"%fl", defValue]];
    return [value floatValue];
}

- (NSArray *)getChildModels {
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for (XMLObject *object in self.source.childs) {
        XMLModel *model = [[XMLModel alloc] initWithXMLObject:object];
        NSString *include = [model getString:@"include" defaultValue:nil];
        if (include) {
            model = [[XMLModel alloc] initWithXML:include];
        }
        [newArray addObject:model];
    }
    return newArray;
}

@end
