//
//  NSString+PinYin.m
//  中文转拼音
//
//  Created by mac on 2017/9/28.
//  Copyright © 2017年 Lucyf. All rights reserved.
//

#import "NSString+PinYin.h"

#define IsNullString(string) string.length<=0?true:false

@implementation NSString (PinYin)


/**
 将中文字符串转换为拼音格式（带声调）
 
 @return 返回带声调拼音字符串
 */
- (NSString *)transformToPinyinTone
{
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    // 空值判断
    if (IsNullString(self)) {
        return @"";
    }
    // 将字符串转为NSMutableString类型
    NSMutableString *string = [self mutableCopy];
    // 将字符串转换为拼音音调格式
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    // 返回带声调拼音字符串
    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"pinyintone in %f ms", linkTime *1000.0);
    return string;
}


/**
 将中文字符串转换为拼音格式（不带声调）
 
 @return 返回不带声调拼音字符串
 */
- (NSString *)transformToPinyin
{
     CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    // 空值判断
    if (IsNullString(self)) {
        return @"";
    }
    // 将字符串转为NSMutableString类型
    NSMutableString *string = [self mutableCopy];
    // 将字符串转换为拼音音调格式
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    // 去掉音调符号
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
    // 返回不带声调拼音字符串
    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"pinyin in %f ms", linkTime *1000.0);
    return string;
}

/**
 将中字符串转换为拼音首字母
 
 @return 拼音首字母字符串
 */
- (NSString *)transformToFirstLetter
{
     CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    // 空值判断
    if (IsNullString(self)) {
        return nil;
    }
    // 首字母存储
    NSMutableString *firstLetterStirng = [NSMutableString string];
    // 遍历字符串中的所有字符
    for (NSUInteger i = 0; i < self.length; i++) {
        // 将每个字符截取后进行拼音转换
        NSString *charStr = [self substringWithRange:NSMakeRange(i, 1)];
        NSString *pinyin = [charStr transformToPinyin];
        // 存储转换后的拼音首字母
        [firstLetterStirng appendString:[pinyin substringToIndex:1]];
    }
    // 返回中文首字母字符串
    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"firstLetter in %f ms", linkTime *1000.0);
    return [firstLetterStirng uppercaseString];
}

- (NSString *)transformToFirstLetterAndPinyin
{
    
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    // 空值判断
    if (IsNullString(self)) {
        return @"";
    }
    // 将字符串转为NSMutableString类型
    NSMutableString *string = [self mutableCopy];
    // 将字符串转换为拼音音调格式
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    // 去掉音调符号
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
    
    NSMutableString *firstLetterStr = [NSMutableString stringWithFormat:@"%@",[string substringToIndex:1]];
    NSRange range = [string rangeOfString:@" "];
    NSString *subString = [NSString stringWithFormat:@"%@",string];
    while (range.location != NSNotFound) {
        if(subString.length > range.location){
            subString = [subString substringFromIndex:range.location+1];
        }
        [firstLetterStr appendFormat:@"%@",[subString substringToIndex:1]];
        range = [subString rangeOfString:@" "];
    }
    // 返回不带声调拼音字符串
    NSString *resultStr = [NSString stringWithFormat:@"%@===%@",firstLetterStr,string];
    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"pinyinAndFirstLetter in %f ms", linkTime *1000.0);
    return resultStr;


}
@end
