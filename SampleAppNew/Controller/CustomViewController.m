//
//  CustomViewController.m
//  SampleAppNew
//
//  Created by FrancoLing on 2024/7/16.
//

#import "CustomViewController.h"

NSString *REUSECUSTOMTABLEVIEWCELLID = @"REUSECUSTOMTABLEVIEWCELLID";
@interface CustomViewController () <UITableViewDataSource>

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
//    tableView.estimatedRowHeight = 50;
//    tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableView];
}

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSECUSTOMTABLEVIEWCELLID];
    
    if (!cell) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:REUSECUSTOMTABLEVIEWCELLID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"主标题 - %02ld", indexPath.row + 1];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"副标题 - %02ld", indexPath.row + 1];
    cell.detailTextLabel.textAlignment = NSTextAlignmentLeft;
    cell.imageView.image = [UIImage imageNamed:@"video"];
    [cell.textLabel sizeToFit];
    [cell.detailTextLabel sizeToFit];
    return cell;
}


@end
