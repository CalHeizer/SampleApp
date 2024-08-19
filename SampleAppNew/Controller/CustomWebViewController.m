//
//  CustomWebViewController.m
//  SampleAppNew
//
//  Created by FrancoLing on 2024/8/14.
//

#import "CustomWebViewController.h"
#import <WebKit/WebKit.h>

@interface CustomWebViewController ()

@end

@implementation CustomWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    WKWebViewConfiguration *webConfiguration = [[WKWebViewConfiguration alloc] init];
    
    WKWebView *webView = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:webConfiguration];
    
    [self.view addSubview:webView];
    
    NSURL *myURL = [NSURL URLWithString:@"https://github.com/pro648/tips/wiki/WebKit的使用"];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    
    [webView loadRequest:request];
}


@end
