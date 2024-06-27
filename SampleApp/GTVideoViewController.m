//
//  GTVideoViewController.m
//  SampleApp
//
//  Created by FrancoLing on 2024/6/26.
//

#import "GTVideoViewController.h"

@interface GTVideoViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation GTVideoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10) / 2, 300);
    
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                                            collectionViewLayout:flowLayout];
    
    // CollectionView 和 TableView的区别 之一 ：必须先注册Cell以重用
    [collectionView registerClass:[UICollectionViewCell class]
       forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
}

// 实现 <UICollectionViewDataSource> 必须实现的方法
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 20;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView 
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView
                                  dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell"
                                  forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

// 区分处理特定的 Cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item % 3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 100);
    } else {
        return CGSizeMake((self.view.frame.size.width - 10) / 2, 300);
    }
}

@end
