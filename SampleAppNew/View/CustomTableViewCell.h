//
//  CustomTableViewCell.h
//  SampleAppNew
//
//  Created by FrancoLing on 2024/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *contentLabel;

@end

NS_ASSUME_NONNULL_END
