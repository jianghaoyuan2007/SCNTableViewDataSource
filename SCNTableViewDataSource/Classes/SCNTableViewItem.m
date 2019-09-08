//
//  SCNTableViewItem.m
//  SCNTableViewDataSource
//
//  Created by Stephen Chiang on 2019/9/8.
//

#import "SCNTableViewItem.h"

@implementation SCNTableViewItem

+ (instancetype)itemWithTitle:(NSString *)title {
    SCNTableViewItem *item = SCNTableViewItem.new;
    item.title = title;
    return item;
}

@end
