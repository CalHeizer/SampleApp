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
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
//    tableView.estimatedRowHeight = 100;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
/**
 返回该tableView的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 200;
}

/**
 返回特定的indexPath的应该显示的Cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSECUSTOMTABLEVIEWCELLID];
    
    if (!cell) {
         cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:REUSECUSTOMTABLEVIEWCELLID];
    }
    
    cell.titleLabel.text = [NSString stringWithFormat:@"主标题  -  %03ld", indexPath.row + 1];
    cell.contentLabel.text = [NSString stringWithFormat:@"副标题  -  %@", @(indexPath.row + 1)];
    
    return cell;
}

#pragma mark - UITableViewDelegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100;
//}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
@end
