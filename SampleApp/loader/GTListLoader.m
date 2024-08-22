//
//  GTListLoader.m
//  SampleApp
//
//  Created by FrancoLing on 2024/8/22.
//

#import "GTListLoader.h"

/// 类扩展
@interface GTListLoader () <NSURLSessionDataDelegate>

@end


/// 列表请求
@implementation GTListLoader

- (void)loadListData {
    NSString *urlString = @"https://johnny:p4ssw0rd@www.example.com:443/script.ext;param=value?query=value#ref";
//    NSString *urlString = @"https://www.bing.com";
    NSURL *listURL = [NSURL URLWithString:urlString];
    
    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:listRequest];
    
    dataTask.delegate = self;
    NSLog(@"");
}

@end
