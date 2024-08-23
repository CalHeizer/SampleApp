//
//  GTListLoader.m
//  SampleApp
//
//  Created by FrancoLing on 2024/8/22.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItem.h"

/// 列表请求
@implementation GTListLoader

- (void)loadListData {
    // 基本参数配置
    NSString *apiUrl = @"http://v.juhe.cn/toutiao/index";  // 接口请求URL
    NSString *apiKey = @"178a373942ffe6bb886f1b364090b7fd";  // 在个人中心->我的数据,接口名称上方查看

    // 接口请求入参配置
    NSDictionary *requestParams = @{
        @"key": apiKey,
        @"type": @"top",
        @"page": @"20",
        @"page_size": @"",
        @"is_filter": @"",
    };
    
    // 发起接口网络请求
    NSURLComponents *components = [NSURLComponents componentsWithString:apiUrl];
    NSMutableArray *queryItems = [NSMutableArray array];
    [requestParams enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:value]];
    }];
    components.queryItems = queryItems;
    
//    NSString *urlString = @"https://johnny:p4ssw0rd@www.example.com:443/script.ext;param=value?query=value#ref";
//    NSString *urlString = @"https://www.bing.com";
//    NSURL *listURL = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
    NSURL *listURL = components.URL;
    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
//    NSString *urlString = components.URL.absoluteString;
//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//            
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"");
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"");
//        }];
    
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            // 网络请求异常处理
            NSLog(@"请求异常");
        } else {
            NSError *jsonError;
            NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            if (!jsonError) {
                // 网络请求成功处理
#warning 类型的检查
                NSArray *dataArray = [((NSDictionary *)[jsonObj objectForKey:@"result"]) objectForKey:@"data"];
                
                NSMutableArray *listItemArray = @[].mutableCopy; // 该数组用来存放解析后的ListItem
                
                for (NSDictionary *info in dataArray) {
                    GTListItem *listItem = [[GTListItem alloc] init];
                    [listItem configWithDictionary:info];
                    
                    [listItemArray addObject:listItem];
                }
                
                NSLog(@"");
            } else {
                // 解析结果异常处理
                NSLog(@"解析结果异常");
            }
        }
    }];
    
    [dataTask resume];
    
    NSLog(@"");
}


@end
