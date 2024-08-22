//
//  GTListLoader.m
//  SampleApp
//
//  Created by FrancoLing on 2024/8/22.
//

#import "GTListLoader.h"


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
    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            // 网络请求异常处理
            NSLog(@"请求异常");
        } else {
            NSError *jsonError;
            NSDictionary *responseResult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            if (!jsonError) {
                // 网络请求成功处理
                // NSLog(@"%@", [responseResult objectForKey:@"error_code"]);
                NSLog(@"%@", responseResult);
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
