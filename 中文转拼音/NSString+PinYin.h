//
//  NSString+PinYin.h
//  中文转拼音
//
//  Created by mac on 2017/9/28.
//  Copyright © 2017年 Lucyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PinYin)

- (NSString *)transformToPinyinTone;

- (NSString *)transformToPinyin;

- (NSString *)transformToFirstLetter;

- (NSString *)transformToFirstLetterAndPinyin;

@end
