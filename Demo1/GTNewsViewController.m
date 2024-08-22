//
//  ViewController.m
//  Demo1
//
//  Created by FrancoLing on 2024/7/26.
//

#import "GTNewsViewController.h"

@interface GTNewsViewController ()

@end

@implementation GTNewsViewController

- (void)viewDidLoad {
    NSLog(@"[Debug] Class: %@, Instance: %@, Method: %s", NSStringFromClass([self class]), self, __PRETTY_FUNCTION__);

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect frame = CGRectMake(0, 200, 200, 21);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"The grass is green; the sky is blue."];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(13, 5)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(31, 4)];
    label.attributedText = attributedString;
    [label sizeToFit];
    label.layer.shadowOffset = CGSizeMake(3, 3);
    label.layer.shadowOpacity = 0.7;
    label.layer.shadowRadius = 2;
//    label.text = @"Hello, World!!";
    label.numberOfLines = 0;
//    label.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
//    label.font = [label.font fontWithSize:20];
    [self.view addSubview:label];
}


@end
