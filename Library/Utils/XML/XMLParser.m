//
//  XMLParser.m
//  APP
//
//  Created by BinGe on 2018/12/29.
//

#import "XMLParser.h"


@interface XMLParser()<NSXMLParserDelegate>

@property (nonatomic, strong) XMLObject *data;
@property (nonatomic, strong) XMLObject *current;


@end

@implementation XMLParser

+ (XMLObject *)objectFromXML:(NSString *)xml {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:xml ofType:nil];
    XMLParser *parser = [XMLParser new];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSXMLParser * xmlParse = [[NSXMLParser alloc]initWithData:data];
    xmlParse.delegate = parser;
    [xmlParse parse];
    XMLObject *xmlObject = parser.data.childs[0];
    return  xmlObject;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    self.data = [XMLObject new];
    self.current = self.data;
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    XMLObject *object = [XMLObject new];
    object.name = elementName;
    object.attribute = attributeDict;
    object.parent = self.current;
    [self.current.childs addObject:object];
    self.current = object;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    self.current = self.current.parent;
}

//step 5：解析结束
- (void)parserDidEndDocument:(NSXMLParser *)parser {
}


@end
