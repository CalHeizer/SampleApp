//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by FrancoLing on 2024/6/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface GTNormalTableViewCell : UITableViewCell

@property (nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END
