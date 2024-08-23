//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by FrancoLing on 2024/6/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView

/// 点击出现删除Cell确认浮层
/// - Parameters:
///   - point: 点击的位置
///   - clickBlock: 点击后的操作
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
@end

NS_ASSUME_NONNULL_END
