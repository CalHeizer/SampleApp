//
//  GTDeleteCellView.m
//  SampleApp
//
//  Created by FrancoLing on 2024/6/28.
//

#import "GTDeleteCellView.h"

#import "GTDeleteCellView.h"

@interface GTDeleteCellView ()

@property (nonatomic, strong, readwrite) UIView *backgroundView;
@property (nonatomic, strong, readwrite) UIButton *deleteButton;


@end

@implementation GTDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            _backgroundView;
            
        })];

        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}

- (void)showDeleteView {

    [[UIApplication sharedApplication].keyWindow addSubview:self];

//    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//             self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200) / 2, (self.bounds.size.height - 200) / 2, 200, 200);
//         } completion:^(BOOL finished) {
//             //动画结束
//         }];

}

- (void)dismissDeleteView {
    [self removeFromSuperview];
}

- (void)_clickButton {
//    if (_deleteBlock) {
//        _deleteBlock();
//    }
    [self removeFromSuperview];
}

@end
