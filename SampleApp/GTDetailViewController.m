//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by FrancoLing on 2024/6/28.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController () <WKNavigationDelegate>

@property (nonatomic, strong, readwrite) WKWebView *webView;

@end

@implementation GTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.bing.com"]]];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    //Webview加载完成
    //此时并不代表整个Web页面已经渲染结束
    NSLog(@"");
}

@end
