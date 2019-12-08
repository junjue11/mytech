//
//  LVSchemeModel.m
//  LightVoice
//
//  Created by zhuchangwei on 2018/12/18.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "LVSchemeModel.h"
#import "SchemeDefine.h"

@implementation LVSchemeModel

- (instancetype)initWithScheme:(NSString *)scheme {
    self = [super init];
    if (self) {
        [self xn_initData:scheme];
    }
    return self;
}

- (void)xn_initData:(NSString *)scheme {
    _scheme = scheme;
    NSArray *array = [scheme componentsSeparatedByString:@";"];
    if (array.count > 0) {
        _host = array.firstObject;
    }
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for (NSString *text in array) {
        NSRange range = [text rangeOfString:@"="];
        if (range.location != NSNotFound) {
            NSString *key = [text substringToIndex:range.location];
            if ([key hasPrefix:@"s."] || [key hasPrefix:@"S."]) {
                key = [key substringFromIndex:2];
            }
            NSString *value = [text substringFromIndex:range.location + 1];
             dict[key] = value;
        }
    }
    _params = dict;
}

- (NSString*)queryForKey:(NSString*)key {
    if (key) {
        return self.params[key];
    }
    return @"";
}

- (NSString *)jumpType {
    if (!_jumpType) {
        _jumpType = [self queryForKey:@"jumpType"];
        if (!_jumpType || _jumpType.length == 0) {
            _jumpType = @"native";
        }
    }
    return _jumpType;
}

- (NSString *)component {
    if (!_component) {
        _component = [self queryForKey:@"component"];
    }
    return _component;
}

// 参数拼接成新的文本
- (NSString *)getParamsText{
    NSMutableArray *paramsArray = [[NSMutableArray alloc] init];
    for (NSString *key in self.params.allKeys) {
        if (![key isEqualToString:@"jumpType"] && ![key isEqualToString:@"component"]) {
            [paramsArray addObject:[NSString stringWithFormat:@"%@=%@", key, self.params[key]]];
        }
    }
    return [paramsArray componentsJoinedByString:@"&"];
}


+ (NSString *)xn_transformUrlLScheme:(NSString *)scheme {
    if ([scheme hasPrefix:@"intent:#Intent;component"]) {
        LVSchemeModel *model = [[LVSchemeModel alloc] initWithScheme:scheme];
        return [NSString stringWithFormat:@"voice://com.yanjing.voice/%@?%@", model.jumpType, [model getParamsText]];
    }
    return scheme;
}

+ (NSDictionary *)xn_getUrlParams:(NSString *)scheme {
    NSArray *array = [scheme componentsSeparatedByString:@"?"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    if (array.count > 1) {
        NSString *paramsText = array.lastObject;
        NSArray *paramsArray = [paramsText componentsSeparatedByString:@"&"];
        for (NSString *text in paramsArray) {
            NSArray *contentArray = [text componentsSeparatedByString:@"="];
            if (contentArray.count == 2) {
                NSString *key = contentArray[0];
                dict[key] = contentArray[1];
            }
        }
    }
    return dict;
}

@end
