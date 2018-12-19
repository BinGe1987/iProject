中文介绍
==============
![ProgressiveBlur~](https://raw.github.com/ibireme/YYWebImage/master/Demo/Demo.gif
)

YYWebImage 是一个异步图片加载框架 ([YYKit](https://github.com/ibireme/YYKit) 组件之一).

其设计目的是试图替代 SDWebImage、PINRemoteImage、FLAnimatedImage 等开源框架，它支持这些开源框架的大部分功能，同时增加了大量新特性、并且有不小的性能提升。

它底层用 [YYCache](https://github.com/ibireme/YYCache) 实现了内存和磁盘缓存, 用 [YYImage](https://github.com/ibireme/YYImage) 实现了 WebP/APNG/GIF 动图的解码和播放。<br/>
你可以查看这些项目以获得更多信息。


特性
==============
- 异步的图片加载，支持 HTTP 和本地文件。
- 支持 GIF、APNG、WebP 动画（动态缓存，低内存占用）。
- 支持逐行扫描、隔行扫描、渐进式图像加载。
- UIImageView、UIButton、MKAnnotationView、CALayer 的 Category 方法支持。
- 常见图片处理：模糊、圆角、大小调整、裁切、旋转、色调等。
- 高性能的内存和磁盘缓存。
- 高性能的图片设置方式，以避免主线程阻塞。
- 每个类和方法都有完善的文档注释。

用法
==============

### 从 URL 加载图片
```objc
// 加载网络图片
imageView.yy_imageURL = [NSURL URLWithString:@"http://github.com/logo.png"];
	
// 加载本地图片
imageView.yy_imageURL = [NSURL fileURLWithPath:@"/tmp/logo.png"];
```	

### 加载动图
```objc
// 只需要把 `UIImageView` 替换为 `YYAnimatedImageView` 即可。
UIImageView *imageView = [YYAnimatedImageView new];
imageView.yy_imageURL = [NSURL URLWithString:@"http://github.com/ani.webp"];
```

### 渐进式图片加载
```objc
// 渐进式：边下载边显示
[imageView yy_setImageWithURL:url options:YYWebImageOptionProgressive];
	
// 渐进式加载，增加模糊效果和渐变动画 （见本页最上方的GIF演示）
[imageView yy_setImageWithURL:url options:YYWebImageOptionProgressiveBlur ｜ YYWebImageOptionSetImageWithFadeAnimation];
```

### 加载、处理图片
```objc
// 1. 下载图片
// 2. 获得图片下载进度
// 3. 调整图片大小、加圆角
// 4. 显示图片时增加一个淡入动画，以获得更好的用户体验
	
[imageView yy_setImageWithURL:url
   placeholder:nil
   options:YYWebImageOptionSetImageWithFadeAnimation
   progress:^(NSInteger receivedSize, NSInteger expectedSize) {
       progress = (float)receivedSize / expectedSize;
   }
   transform:^UIImage *(UIImage *image, NSURL *url) {
       image = [image yy_imageByResizeToSize:CGSizeMake(100, 100) contentMode:UIViewContentModeCenter];
       return [image yy_imageByRoundCornerRadius:10];
   }
   completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
       if (from == YYWebImageFromDiskCache) {
           NSLog(@"load from disk cache");
       }
   }];
```

### 图片缓存
```objc
YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    
// 获取缓存大小
cache.memoryCache.totalCost;
cache.memoryCache.totalCount;
cache.diskCache.totalCost;
cache.diskCache.totalCount;
    
// 清空缓存
[cache.memoryCache removeAllObjects];
[cache.diskCache removeAllObjects];
    
// 清空磁盘缓存，带进度回调
[cache.diskCache removeAllObjectsWithProgressBlock:^(int removedCount, int totalCount) {
   // progress
} endBlock:^(BOOL error) {
   // end
}];
```

安装
==============

### CocoaPods

1. 将 cocoapods 更新至最新版本.
2. 在 Podfile 中添加 `pod 'YYWebImage'`。
3. 执行 `pod install` 或 `pod update`。
4. 导入 \<YYWebImage/YYWebImage.h\>。
5. 注意：pod 配置并没有包含 WebP 组件, 如果你需要支持 WebP，可以在 Podfile 中添加 `pod 'YYImage/WebP'`。你可以调用 `YYImageWebPAvailable()` 来检查一下 WebP 组件是否被正确安装。

### Carthage

1. 在 Cartfile 中添加 `github "ibireme/YYWebImage"`。
2. 执行 `carthage update --platform ios` 并将生成的 framework 添加到你的工程。
3. 导入 \<YYWebImage/YYWebImage.h\>。
4. 注意: carthage framework 并没有包含 webp 组件。如果你需要支持 WebP，可以用 CocoaPods 安装，或者手动安装。

### 手动安装

1. 下载 YYWebImage 文件夹内的所有内容。
2. 将 YYWebImage 内的源文件添加(拖放)到你的工程。
3. 链接以下 frameworks:
	* UIKit
	* CoreFoundation
	* QuartzCore
	* AssetsLibrary
	* ImageIO
	* Accelerate
	* MobileCoreServices
	* sqlite3
	* libz
4. 导入 `YYWebImage.h`。
5. 注意：如果你需要支持 WebP，可以将 `Vendor/WebP.framework`(静态库) 加入你的工程。你可以调用 `YYImageWebPAvailable()` 来检查一下 WebP 组件是否被正确安装。


文档
==============
你可以在 [CocoaDocs](http://cocoadocs.org/docsets/YYWebImage/) 查看在线 API 文档，也可以用 [appledoc](https://github.com/tomaz/appledoc) 本地生成文档。


系统要求
==============
该项目最低支持 `iOS 6.0` 和 `Xcode 8.0`。


许可证
==============
YYWebImage 使用 MIT 许可证，详情见 LICENSE 文件。

相关链接
==============
[移动端图片格式调研](https://blog.ibireme.com/2015/11/02/mobile_image_benchmark/)<br/>

[iOS 处理图片的一些小 Tip](https://blog.ibireme.com/2015/11/02/ios_image_tips/)

