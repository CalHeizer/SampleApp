//
//  ViewController.m
//  Demo1
//
//  Created by FrancoLing on 2024/7/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    NSLog(@"[Debug] Class: %@, Instance: %@, Method: %s", NSStringFromClass([self class]), self, __PRETTY_FUNCTION__);

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
