//
//  SCNViewController.m
//  SCNTableViewDataSource
//
//  Created by Stephen Chiang on 09/08/2019.
//  Copyright (c) 2019 Stephen Chiang. All rights reserved.
//

#import "SCNViewController.h"
#import <SCNTableViewDataSource/SCNTableViewDataSource.h>
#import <SCNTableViewDataSource/SCNTableViewItem.h>

@interface SCNViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) SCNTableViewDataSource *dataSource;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation SCNViewController

#pragma mark -
#pragma mark Getter

- (SCNTableViewDataSource *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [SCNTableViewDataSource dataSourceWithTableView:self.tableView];
    }
    return _dataSource;
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray new];
    }
    return _items;
}

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.items addObject:[SCNTableViewItem itemWithTitle:@"Title"]];
    self.dataSource.items = self.items;
}

@end
