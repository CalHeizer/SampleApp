//
//  CustomViewController.m
//  SampleAppNew
//
//  Created by FrancoLing on 2024/7/16.
//

#import "CustomViewController.h"
#import "../View/CustomTableViewCell.h"

NSString *REUSECUSTOMTABLEVIEWCELLID = @"REUSECUSTOMTABLEVIEWCELLID";
@interface CustomViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation CustomViewController

- (void)viewDidLoad {
//    NSLog(@"[Debug] Class: %@, Instance: %@, Method: %s", NSStringFromClass([self class]), self, __PRETTY_FUNCTION__);
    NSLog(@"[Debug] Instance: %@, Method: %s", self, __PRETTY_FUNCTION__);

    [super viewDidLoad];
    
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CustomTableViewCell class])];
    
    tableView.dataSource = self;
    tableView.delegate = self;
//    tableView.estimatedRowHeight = 100;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"[Debug] Instance: %@, Method: %s", self, __PRETTY_FUNCTION__);
    return 5;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    NSLog(@"[Debug] Class: %@, Instance: %@, Method: %s sectionIndex = %ld", NSStringFromClass([self class]), self, __PRETTY_FUNCTION__, section);
    NSLog(@"[Debug] Instance: %@, Method: %s sectionIndex = %ld", self, __PRETTY_FUNCTION__, section);
    
    return [NSString stringWithFormat:@"%02ld", section];
}

/**
 返回该tableView的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"[Debug] Instance: %@, Method: %s sectionIndex = %ld", self, __PRETTY_FUNCTION__, section);

    return 6;
}

/**
 返回特定的indexPath的应该显示的Cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"[Debug] Instance: %@, Method: %s, IndexPath: %@", self, __PRETTY_FUNCTION__, indexPath);

    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomTableViewCell class])];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"主标题  -  %03ld", indexPath.row + 1];
    cell.contentLabel.text = [NSString stringWithFormat:@"副标题  -  %@", @(indexPath.row + 1)];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"[Debug] Instance: %@, Method: %s, IndexPath: %@", self, __PRETTY_FUNCTION__, indexPath);

    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"[Debug] Instance: %@, Method: %s, IndexPath: %@", self, __PRETTY_FUNCTION__, indexPath);

    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"[Debug] Instance: %@, Method: %s %ld", self, __PRETTY_FUNCTION__, section);
    return 5;
}
@end
