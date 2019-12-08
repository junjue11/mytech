//
//  NVSchemeModel.h
//  LightVoice
//
//  Created by zhuchangwei on 2018/12/18.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NVSchemeModel : NSObject

+ (NSString *)xn_transformUrlLScheme:(NSString *)scheme;
+ (NSDictionary *)xn_getUrlParams:(NSString *)scheme;

- (instancetype)initWithScheme:(NSString *)scheme;
- (NSString*)queryForKey:(NSString*)key;

@property (nonatomic, strong) NSString* scheme;
@property (nonatomic, strong) NSString* host;
@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, strong) NSString *jumpType;
@property (nonatomic, strong) NSString *component;

@end

NS_ASSUME_NONNULL_END
