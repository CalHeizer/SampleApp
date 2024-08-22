//
//  ViewController.m
//  SampleApp
//
//  Created by FrancoLing on 2024/6/25.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"
#import "GTListLoader.h"

@interface TestView : UIView

@end

//@implementation TestView
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        
//    }
//    return self;
//}
//- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
//    [super willMoveToSuperview:newSuperview];
//}
//- (void)didMoveToSuperview {
//    [super didMoveToSuperview];
//}
//- (void)willMoveToWindow:(nullable UIWindow *)newWindow {
//    [super willMoveToWindow:newWindow];
//}
//- (void)didMoveToWindow; {
//    [super didMoveToWindow];
//}
//@end

@interface GTNewsViewController () <UITableViewDataSource, UITableViewDelegate, GTNormalTableViewCellDelegate>
@property (nonatomic, strong, readwrite)UITableView *tableView;
@property (nonatomic, strong, readwrite)NSMutableArray *dataArray;
@property (nonatomic, strong, readwrite)GTListLoader *listLoader;
@end

@implementation GTNewsViewController

#pragma mark - life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        _dataArray = @[].mutableCopy;
        for (int i = 0; i < 20; i++) {
            [_dataArray addObject:@(i)];
        }
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    self.listLoader = [[GTListLoader alloc] init];
    [self.listLoader loadListData];
}

#pragma mark - UITableViewDelegate
/**
 设置Cell的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

/**
 点击Cell后的逻辑
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GTDetailViewController *controller = [[GTDetailViewController alloc] init];
    controller.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    controller.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:controller animated:YES];
}
/**
 return 整个tableVIew中有多少个Cell
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if (!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    
    [cell layoutTableViewCell]; // 在 GTNormalTableViewCell.m 自定义的方法
    
    return cell;
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
    
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    
    __weak typeof(self) weakSelf = self;
    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.dataArray removeLastObject];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end
