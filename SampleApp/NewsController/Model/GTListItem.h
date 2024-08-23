//
//  GTListItem.h
//  SampleApp
//
//  Created by FrancoLing on 2024/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// 列表结构化数据
@interface GTListItem : NSObject

@property(nonatomic, copy, readwrite) NSString *category; // 新闻分类
@property(nonatomic, copy, readwrite) NSString *picUrl; // 新闻图片链接 thumbnail_pic_s
@property(nonatomic, copy, readwrite) NSString *uniqueKey; // 新闻ID
@property(nonatomic, copy, readwrite) NSString *title; // 新闻标题
@property(nonatomic, copy, readwrite) NSString *date; // 新闻时间
@property(nonatomic, copy, readwrite) NSString *authorName; // 新闻来源
@property(nonatomic, copy, readwrite) NSString *articleUrl; // 新闻访问链接

- (void)configWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
