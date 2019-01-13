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
        if ([xml hasPrefix:@"@"]) {
            xml = [xml substringFromIndex:1];
        }
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
    if ([value hasSuffix:@"sp"]) {
        value = [value substringToIndex:[value length] -2];
        return ScaleValue([value floatValue]);
    }
    return [value floatValue];
}

- (NSArray *)getChildModels {
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for (XMLObject *object in self.source.childs) {
        XMLModel *model = [[XMLModel alloc] initWithXMLObject:object];
        if (object.name && [object.name isEqualToString:@"include"]) {
            NSString *name = object.attribute[@"name"];
            model = [[XMLModel alloc] initWithXML:name];
        }
        [newArray addObject:model];
    }
    return newArray;
}

@end
