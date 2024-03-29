
#import <Foundation/Foundation.h>

@interface NSString (LXExtension)
/**
 *  md5加密
 */
+ (NSString*)md5HexDigest:(NSString*)input;

/**
 *  DES解密
 */
- (NSString*)decryptUseDESKey:(NSString*)key;
/**
 *  根据文件名计算出文件大小
 */
- (unsigned long long)lx_fileSize;
/**
 *  生成缓存目录全路径
 */
- (instancetype)cacheDir;
/**
 *  生成文档目录全路径
 */
- (instancetype)docDir;
/**
 *  生成临时目录全路径
 */
- (instancetype)tmpDir;

/**
 *  @brief 根据字数的不同,返回UILabel中的text文字需要占用多少Size
 *  @param size 约束的尺寸
 *  @param font 文本字体
 *  @return 文本的实际尺寸
 */
- (CGSize)textSizeWithContentSize:(CGSize)size font:(UIFont *)font;

/**
 *  @brief  根据文本字数/文本宽度约束/文本字体 求得text的Size
 *  @param width 宽度约束
 *  @param font  文本字体
 *  @return 文本的实际高度
 */
- (CGFloat)textHeightWithContentWidth:(CGFloat)width font:(UIFont *)font;

/**
 *  @brief  根据文本字数/文本宽度约束/文本字体 求得text的Size
 *  @param height 宽度约束
 *  @param font  文本字体
 *  @return 文本的实际长度
 */
- (CGFloat)textWidthWithContentHeight:(CGFloat)height font:(UIFont *)font;


/**
 根据富文本设置的行间距计算文字高度

 @param str 需要计算的文本
 @param font 文本字体
 @param width 宽度约束
 @param lineSpacing 行间距
 @return 文本实际高度
 */
-(CGFloat)textSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

/**
 获取文章ID

 @return ID
 */
-(NSString *)getTheArticleID;


/**
判断是否是纯汉字
 */
- (BOOL)isChinese;


/**
 判断是否含有汉字
 */
- (BOOL)includeChinese;

@end
