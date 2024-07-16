//
//  CustomTableViewCell.m
//  SampleAppNew
//
//  Created by FrancoLing on 2024/7/16.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell ()

@property (nonatomic, strong, readwrite) UIImageView *avatarImageView;

@end

@implementation CustomTableViewCell
- (instancetype)init {
    return [self initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *leftImageView = [[UIImageView alloc] init];
        leftImageView.image = [UIImage imageNamed:@"video"];
        leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        _avatarImageView = leftImageView;
        [self.contentView addSubview:_avatarImageView];
        
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] init];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.contentLabel = [[UILabel alloc] init];
            self.contentLabel.font = [UIFont systemFontOfSize:12];
            self.contentLabel.textColor = [UIColor grayColor];
            self.contentLabel.numberOfLines = 1;
            self.contentLabel.textAlignment = NSTextAlignmentLeft;
            self.contentLabel;
        })];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews]; // 非常重要，没有这句话会导致Cell的分割线显示不正确
    self.avatarImageView.frame = CGRectMake(self.contentView.bounds.origin.x + 30, self.contentView.bounds.origin.y + 30, 70, 70);
    
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake(self.avatarImageView.frame.origin.x + self.avatarImageView.frame.size.width + 30,
                                       self.avatarImageView.frame.origin.y,
                                       self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    
    [self.contentLabel sizeToFit];
    self.contentLabel.frame = CGRectMake(self.titleLabel.frame.origin.x, 
                                         self.avatarImageView.center.y - self.contentLabel.frame.size.height / 2,
                                       self.contentLabel.frame.size.width, self.contentLabel.frame.size.height);
}

// cell 里重写 sizeThatFits:，根据 size.width 计算高度，系统会用返回的 height 作为 cell 最终的高度
// 当走到这个方法时，cellForRow 已经调用完了，所以 cell 的数据已经被正确设置好
- (CGSize)sizeThatFits:(CGSize)size {

    CGFloat height = [self.contentView sizeThatFits:CGSizeMake(size.width, CGFLOAT_MAX)].height;
    return CGSizeMake(size.width, height);
    
}
@end
