//
//  CommonDefine.h
//  UIEngine
//
//  Created by BinGe on 2018/11/29.
//  Copyright © 2018 Bin. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

#pragma mark 机型相关

#pragma mark 分辨率相关的宏

#define STATUSBARHIEGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define NVBARHIEGHT  self.navigationController.navigationBar.frame.size.height
#define TABBARHIEGHT self.tabBarController.tabBar.frame.size.height

#define SCREENWIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT  [UIScreen mainScreen].bounds.size.height

#define SCREENSCALE   SCREENWIDTH/375.0

#define ScaleValue(value)   value * SCREENSCALE

#ifdef DEBUG
#define Log(...) NSLog(@"%s 第%d行 \n%@\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define Log(...)
#endif

#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type)  __strong typeof(type) type = weak##type;

#pragma mark 字体相关的宏
///用于快速创建一个字体对象，更多创建宏可查看 UIFont+QMUI.h
#define UIFontMake(size) [UIFont systemFontOfSize:size]
#define UIFontItalicMake(size) [UIFont italicSystemFontOfSize:size] // 斜体只对数字和字母有效，中文无效
#define UIFontBoldMake(size) [UIFont boldSystemFontOfSize:size]
#define UIFontBoldWithFont(_font) [UIFont boldSystemFontOfSize:_font.pointSize]

#pragma mark 颜色相关宏
///直接转入8位字符串颜色值（#FFFFFFFF），1、2位为透明度，后6位为颜色值
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:((float)((rgbValue & 0xFF000000) >> 32))/255.0]

#pragma mark 时间相关宏
///可以放在代码块中打印耗时
#define TICK   CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
#define TOCK   NSLog(@"Method <%@ %@> consumption time : %f ms", NSStringFromClass([self class]), NSStringFromSelector(_cmd),(CFAbsoluteTimeGetCurrent() - startTime) * 1000.0);


#endif /* CommonDefine_h */
