//
//  GTListItem.m
//  SampleApp
//
//  Created by FrancoLing on 2024/8/23.
//

#import "GTListItem.h"

@implementation GTListItem

#warning 类型是否匹配
- (void)configWithDictionary:(NSDictionary *)dictionary {
    
    self.category = [dictionary objectForKey:@"category"]; // 新闻分类
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"]; // 新闻图片链接 thumbnail_pic_s
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"]; // 新闻ID
    self.title = [dictionary objectForKey:@"title"]; // 新闻标题
    self.date = [dictionary objectForKey:@"date"]; // 新闻时间
    self.authorName = [dictionary objectForKey:@"author_name"]; // 新闻来源
    self.articleUrl = [dictionary objectForKey:@"url"]; // 新闻访问链接
}

@end
