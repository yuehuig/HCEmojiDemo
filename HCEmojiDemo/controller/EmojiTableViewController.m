//
//  EmojiTableViewController.m
//  HCEmojiDemo
//
//  Created by Caoyq on 16/5/9.
//  Copyright © 2016年 honeycao. All rights reserved.
//

#import "EmojiTableViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"


@interface EmojiTableViewController ()
@property (strong, nonatomic) NSArray *dataSource;
@end
@implementation EmojiTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"多类型表情键盘";
    UIBarButtonItem *back = [[UIBarButtonItem alloc]init];
    back.title = @"";
    self.navigationItem.backBarButtonItem = back;
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"表情、键盘共一键",@"表情添加至拓展栏",@"自定义表情位置"];
    }
    return _dataSource;
}

#pragma mark - Table View DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    cell.backgroundColor = [UIColor yellowColor];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITable View Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        case 1:{
            FirstViewController *first = [FirstViewController new];
            first.row = indexPath.row;
            [self.navigationController pushViewController:first animated:YES];
        }
            break;
        case 2:{
            SecondViewController *second = [[SecondViewController alloc]init];
            [self.navigationController pushViewController:second animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
